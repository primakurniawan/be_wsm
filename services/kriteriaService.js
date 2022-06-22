const db = require("./db");
const { emptyOrRows } = require("../helper");
const config = require("../config");

exports.getMultiple = async () => {
  const result = await db.query(`SELECT id, nama FROM kriteria`);

  const data = emptyOrRows(result);

  return data;
};

exports.create = async (nama) => {
  const result = await db.query(`INSERT INTO kriteria(nama) VALUES ('${nama}')`);

  let message = "Error in creating kriteria";

  if (result.affectedRows) {
    message = "kriteria created successfully";
  }

  return message;
};

exports.update = async (id, nama) => {
  const result = await db.query(`UPDATE kriteria SET nama='${nama}' WHERE id=${id}`);

  let message = "Error in updating kriteria";

  if (result.affectedRows) {
    message = "kriteria updated successfully";
  }

  return message;
};

exports.remove = async (id) => {
  const result = await db.query(`DELETE FROM kriteria WHERE id=${id}`);

  let message = "Error in deleting kriteria";

  if (result.affectedRows) {
    message = "kriteria deleted successfully";
  }

  return message;
};
