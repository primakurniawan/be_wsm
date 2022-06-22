const db = require("./db");
const { emptyOrRows } = require("../helper");
const config = require("../config");

exports.getMultiple = async () => {
  const result = await db.query(`SELECT 
  kriteria.id AS id_kriteria, kriteria.nama AS nama_kriteria, 
  parameter.id AS id_parameter, parameter.nama AS nama_parameter, parameter.nilai AS nilai_parameter
  FROM parameter
  INNER JOIN kriteria ON kriteria.id = parameter.id_kriteria
  ORDER BY id_kriteria, nilai
  `);

  const data = emptyOrRows(result);

  return data;
};

exports.create = async (nama, nilai, id_kriteria) => {
  const result = await db.query(`INSERT INTO parameter(nama, nilai, id_kriteria) VALUES ('${nama}',${nilai},${id_kriteria})`);

  let message = "Error in creating parameter";

  if (result.affectedRows) {
    message = "parameter created successfully";
  }

  return message;
};

exports.update = async (id, nama, nilai, id_kriteria) => {
  const result = await db.query(`UPDATE parameter SET nama='${nama}',nilai=${nilai},id_kriteria=${id_kriteria} WHERE id=${id}`);

  let message = "Error in updating parameter";

  if (result.affectedRows) {
    message = "parameter updated successfully";
  }

  return message;
};

exports.remove = async (id) => {
  const result = await db.query(`DELETE FROM parameter WHERE id=${id}`);

  let message = "Error in deleting parameter";

  if (result.affectedRows) {
    message = "parameter deleted successfully";
  }

  return message;
};
