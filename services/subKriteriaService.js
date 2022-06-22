const db = require("./db");
const { emptyOrRows } = require("../helper");
const config = require("../config");

exports.getMultiple = async () => {
  const result = await db.query(`SELECT 
  subkriteria.id AS id_subkriteria, subkriteria.nama AS nama_subkriteria,
  kriteria.id AS id_kriteria, kriteria.nama AS nama_kriteria
  FROM subkriteria 
  INNER JOIN kriteria ON kriteria.id = subkriteria.id_kriteria
  `);

  const data = emptyOrRows(result);

  return data;
};

exports.create = async (nama, id_kriteria) => {
  const result = await db.query(`INSERT INTO subkriteria(nama, id_kriteria) VALUES ('${nama}',${id_kriteria})`);

  let message = "Error in creating subkriteria";

  if (result.affectedRows) {
    message = "subkriteria created successfully";
  }

  return message;
};

exports.update = async (id, nama, id_kriteria) => {
  const result = await db.query(`UPDATE subkriteria SET nama='${nama}',id_kriteria=${id_kriteria} WHERE id=${id}`);

  let message = "Error in updating subkriteria";

  if (result.affectedRows) {
    message = "subkriteria updated successfully";
  }

  return message;
};

exports.remove = async (id) => {
  const result = await db.query(`DELETE FROM subkriteria WHERE id=${id}`);

  let message = "Error in deleting subkriteria";

  if (result.affectedRows) {
    message = "subkriteria deleted successfully";
  }

  return message;
};
