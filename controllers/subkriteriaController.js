const subkriteriaService = require("../services/subkriteriaService");

exports.getAllSubkriteria = async function (req, res, next) {
  try {
    const daftarSubkriteria = await subkriteriaService.getMultiple();

    res.status(200).json({
      status: "success",
      data: daftarSubkriteria,
    });
  } catch (err) {
    console.error(`Error while getting subkriteria `, err.message);
    next(err);
  }
};

exports.getAllSubkriteriaDetail = async function (req, res, next) {
  try {
    const daftarSubkriteria = await subkriteriaService.getMultiple();
    const subkriteriaReturn = [];
    daftarSubkriteria.forEach((e) => {
      const subkriteria = {
        id_subkriteria: e.id_subkriteria,
        nama_subkriteria: e.nama_subkriteria,
      };
      const kriteria = {
        id_kriteria: e.id_kriteria,
        nama_kriteria: e.nama_kriteria,
        subkriteria: [subkriteria],
      };
      if (subkriteriaReturn[subkriteriaReturn.length - 1]?.id_kriteria === e.id_kriteria) {
        subkriteriaReturn[subkriteriaReturn.length - 1].subkriteria.push(subkriteria);
      } else {
        subkriteriaReturn.push(kriteria);
      }
    });

    res.status(200).json({
      status: "success",
      data: subkriteriaReturn,
    });
  } catch (err) {
    console.error(`Error while getting subkriteria `, err.message);
    next(err);
  }
};

exports.createSubkriteria = async function (req, res, next) {
  try {
    const { nama, id_kriteria } = req.body;
    const message = await subkriteriaService.create(nama, id_kriteria);
    res.status(201).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while creating subkriteria`, err.message);
    next(err);
  }
};

exports.updateSubkriteria = async function (req, res, next) {
  try {
    const { id } = req.params;
    const { nama, id_kriteria } = req.body;
    const message = await subkriteriaService.update(id, nama, id_kriteria);
    res.status(200).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while updating subkriteria`, err.message);
    next(err);
  }
};

exports.deleteSubkriteria = async function (req, res, next) {
  try {
    const { id } = req.params;
    const message = await subkriteriaService.remove(id);
    res.status(200).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while deleting subkriteria`, err.message);
    next(err);
  }
};
