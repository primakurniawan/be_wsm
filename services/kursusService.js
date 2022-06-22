const db = require("./db");
const { emptyOrRows } = require("../helper");
const config = require("../config");

exports.getMultiple = async () => {
  const result = await db.query(`SELECT id, nama FROM kursus`);

  const data = emptyOrRows(result);

  return data;
};

exports.create = async (nama) => {
  const result = await db.query(`INSERT INTO kursus(nama) VALUES ('${nama}')`);

  let message = "Error in creating kursus";

  if (result.affectedRows) {
    message = "kursus created successfully";
  }

  return message;
};

exports.update = async (id, nama) => {
  const result = await db.query(`UPDATE kursus SET nama='${nama}' WHERE id=${id}`);

  let message = "Error in updating kursus";

  if (result.affectedRows) {
    message = "kursus updated successfully";
  }

  return message;
};

exports.remove = async (id) => {
  const result = await db.query(`DELETE FROM kursus WHERE id=${id}`);

  let message = "Error in deleting kursus";

  if (result.affectedRows) {
    message = "kursus deleted successfully";
  }

  return message;
};
