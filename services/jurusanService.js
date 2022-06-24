const db = require("./db");
const { emptyOrRows } = require("../helper");
const WSM = require("./WSM");
const { performance } = require("perf_hooks");

exports.getMultiple = async () => {
  const nilaiJurusanAlternatif = await db.query(
    `SELECT 
    jurusan.id AS id_jurusan, jurusan.nama AS nama_jurusan,
    fakultas.id AS id_fakultas, fakultas.nama AS nama_fakultas,
    subkriteria.id AS id_subkriteria, subkriteria.nama AS nama_subkriteria,
    kriteria.id AS id_kriteria, kriteria.nama AS nama_kriteria,
    parameter.id AS id_parameter, parameter.nama AS nama_parameter,
    nilai_subkriteria_jurusan.nilai AS nilai_subkriteria, parameter.nilai AS nilai_parameter
    FROM nilai_subkriteria_jurusan
    INNER JOIN jurusan ON jurusan.id = nilai_subkriteria_jurusan.id_jurusan
    INNER JOIN fakultas ON fakultas.id = jurusan.id_fakultas
    INNER JOIN subkriteria ON subkriteria.id = nilai_subkriteria_jurusan.id_subkriteria
    INNER JOIN kriteria ON kriteria.id = subkriteria.id_kriteria
    INNER JOIN parameter ON parameter.id_kriteria = kriteria.id
    ORDER BY fakultas.id, jurusan.id, kriteria.id, subkriteria.id
    `
  );

  const nilaiJurusanFilter = nilaiJurusanAlternatif
    .filter((e) => e.nilai_subkriteria === e.nilai_parameter)
    .map((e) => {
      return {
        ...e,
        nilai: e.nilai_subkriteria,
      };
    })
    .map((e) => {
      delete e.nilai_subkriteria;
      delete e.nilai_parameter;
      return e;
    });

  const jurusanAlternatif = [];

  nilaiJurusanFilter.forEach((e) => {
    const subkriteria = {
      id_subkriteria: e.id_subkriteria,
      subkriteria: e.nama_subkriteria,
      parameter: e.nama_parameter,
      nilai: e.nilai,
    };

    const kriteria = {
      id_kriteria: e.id_kriteria,
      kriteria: e.nama_kriteria,
      subkriteriaArray: [subkriteria],
    };

    const jurusan = {
      id_jurusan: e.id_jurusan,
      jurusan: e.nama_jurusan,
      id_fakultas: e.id_fakultas,
      fakultas: e.nama_fakultas,
      kriteriaArray: [kriteria],
    };

    if (e.id_jurusan === jurusanAlternatif[jurusanAlternatif.length - 1]?.id_jurusan && jurusanAlternatif.length !== 0) {
      if (e.id_kriteria === jurusanAlternatif[jurusanAlternatif.length - 1].kriteriaArray[jurusanAlternatif[jurusanAlternatif.length - 1].kriteriaArray.length - 1].id_kriteria) {
        jurusanAlternatif[jurusanAlternatif.length - 1].kriteriaArray[jurusanAlternatif[jurusanAlternatif.length - 1].kriteriaArray.length - 1].subkriteriaArray.push(subkriteria);
      } else {
        jurusanAlternatif[jurusanAlternatif.length - 1].kriteriaArray.push(kriteria);
      }
    } else {
      jurusanAlternatif.push(jurusan);
    }
  });

  // jurusanAlternatif.forEach((e) => {
  //   // console.log(e);
  //   e.kriteriaArray.forEach((k) => {
  //     console.log(k.subkriteriaArray);
  //     k.subkriteriaArray.forEach((s) => {
  //       // console.log(s);
  //     });
  //   });
  // });
  return jurusanAlternatif;
};

let totalRunningTime = 0;
let totalCall = 0;
let averageRunningTime = 0;

exports.getRankAlternative = async (kriteriaCalon) => {
  const kriteriaCalon2 = [];
  Object.entries(kriteriaCalon).forEach(([key, value]) => {
    kriteriaCalon2.push({
      id_kriteria: key,
      nilai: value,
    });
  });

  const nilaiJurusanAlternatif = await db.query(
    `SELECT 
    jurusan.id AS id_jurusan, jurusan.nama AS nama_jurusan,
    fakultas.id AS id_fakultas, fakultas.nama AS nama_fakultas,
    subkriteria.id AS id_subkriteria, subkriteria.nama AS nama_subkriteria,
    kriteria.id AS id_kriteria, kriteria.nama AS nama_kriteria,
    parameter.id AS id_parameter, parameter.nama AS nama_parameter,
    nilai_subkriteria_jurusan.nilai AS nilai_subkriteria, parameter.nilai AS nilai_parameter
    FROM nilai_subkriteria_jurusan
    INNER JOIN jurusan ON jurusan.id = nilai_subkriteria_jurusan.id_jurusan
    INNER JOIN fakultas ON fakultas.id = jurusan.id_fakultas
    INNER JOIN subkriteria ON subkriteria.id = nilai_subkriteria_jurusan.id_subkriteria
    INNER JOIN kriteria ON kriteria.id = subkriteria.id_kriteria
    INNER JOIN parameter ON parameter.id_kriteria = kriteria.id
    ORDER BY fakultas.id, jurusan.id, kriteria.id, subkriteria.id
    `
  );

  const nilaiJurusanFilter = nilaiJurusanAlternatif
    .filter((e) => e.nilai_subkriteria === e.nilai_parameter)
    .map((e) => {
      return {
        ...e,
        nilai: e.nilai_subkriteria,
      };
    })
    .map((e) => {
      delete e.nilai_subkriteria;
      delete e.nilai_parameter;
      return e;
    });

  console.log(nilaiJurusanFilter);

  const jurusanAlternatif = [];

  nilaiJurusanFilter.forEach((e) => {
    const subkriteria = {
      id_subkriteria: e.id_subkriteria,
      subkriteria: e.nama_subkriteria,
      parameter: e.nama_parameter,
      nilai: e.nilai,
    };

    const kriteria = {
      id_kriteria: e.id_kriteria,
      kriteria: e.nama_kriteria,
      subkriteriaArray: [subkriteria],
    };

    const jurusan = {
      id_jurusan: e.id_jurusan,
      jurusan: e.nama_jurusan,
      id_fakultas: e.id_fakultas,
      fakultas: e.nama_fakultas,
      kriteriaArray: [kriteria],
    };

    if (e.id_jurusan === jurusanAlternatif[jurusanAlternatif.length - 1]?.id_jurusan && jurusanAlternatif.length !== 0) {
      if (e.id_kriteria === jurusanAlternatif[jurusanAlternatif.length - 1].kriteriaArray[jurusanAlternatif[jurusanAlternatif.length - 1].kriteriaArray.length - 1].id_kriteria) {
        jurusanAlternatif[jurusanAlternatif.length - 1].kriteriaArray[jurusanAlternatif[jurusanAlternatif.length - 1].kriteriaArray.length - 1].subkriteriaArray.push(subkriteria);
      } else {
        jurusanAlternatif[jurusanAlternatif.length - 1].kriteriaArray.push(kriteria);
      }
    } else {
      jurusanAlternatif.push(jurusan);
    }
  });

  var startTime = performance.now();
  const rank = WSM(jurusanAlternatif, kriteriaCalon2);
  var endTime = performance.now();
  totalRunningTime += endTime - startTime;
  totalCall += 1;
  averageRunningTime = totalRunningTime / totalCall;

  console.log(`Call to rank took ${endTime - startTime} milliseconds`);
  console.log(`Average running time: ${averageRunningTime}`);

  return rank;
};

exports.create = async (nama, id_fakultas, kriteria) => {
  console.log(nama, id_fakultas, kriteria);
  const jurusanResult = await db.query(`INSERT INTO jurusan(nama, id_fakultas) VALUES ('${nama}',${id_fakultas})`);

  const kriteriaStr = Object.entries(kriteria).map(([key, value]) => {
    return `(${jurusanResult.insertId},${key},${value})`;
  });

  const result = await db.query(`INSERT INTO nilai_subkriteria_jurusan(id_jurusan, id_subkriteria, nilai) VALUES ${kriteriaStr.join(",")}`);

  let message = "Error tidak bisa menambah jurusan";

  if (result.affectedRows) {
    message = "Berhasil menambah jurusan";
  }

  return message;
};

exports.update = async (id, nama, id_fakultas, kriteria) => {
  await db.query(`UPDATE jurusan SET nama='${nama}' WHERE id=${id}`);

  const deleteResult = await db.query(`DELETE FROM nilai_subkriteria_jurusan WHERE id_jurusan=${id}`);
  console.log(deleteResult.affectedRows);

  const kriteriaStr = Object.entries(kriteria).map(([key, value]) => {
    return `(${jurusanResult.insertId},${key},${value})`;
  });

  const result = await db.query(`INSERT INTO nilai_subkriteria_jurusan(id_jurusan, id_subkriteria, nilai) VALUES ${kriteriaStr.join(",")}`);

  let message = "Error in updating alternative";

  if (result.affectedRows) {
    message = "alternative updated successfully";
  }

  return message;
};

exports.remove = async (id) => {
  await db.query(`DELETE FROM nilai_subkriteria_jurusan WHERE id_jurusan=${id}`);

  const result = await db.query(`DELETE FROM jurusan WHERE id=${id}`);

  let message = "Gagal menghapus jurusan";

  if (result.affectedRows) {
    message = "Berhasil menghapus jurusan";
  }

  return message;
};
