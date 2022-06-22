const db = require("./db");
const { emptyOrRows } = require("../helper");
const config = require("../config");

exports.getMultiple = async () => {
  const result = await db.query(`SELECT id, nama FROM fakultas`);

  const data = emptyOrRows(result);

  return data;
};

exports.create = async (nama) => {
  const result = await db.query(`INSERT INTO fakultas(nama) VALUES ('${nama}')`);

  let message = "Error in creating fakultas";

  if (result.affectedRows) {
    message = "fakultas created successfully";
  }

  return message;
};

exports.update = async (id, nama) => {
  const result = await db.query(`UPDATE fakultas SET nama='${nama}' WHERE id=${id}`);

  let message = "Error in updating fakultas";

  if (result.affectedRows) {
    message = "fakultas updated successfully";
  }

  return message;
};

exports.remove = async (id) => {
  const result = await db.query(`DELETE FROM fakultas WHERE id=${id}`);

  let message = "Error in deleting fakultas";

  if (result.affectedRows) {
    message = "fakultas deleted successfully";
  }

  return message;
};
