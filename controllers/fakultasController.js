const fakultasService = require("../services/fakultasService");

exports.getAllFakultas = async function (req, res, next) {
  try {
    const daftarFakultas = await fakultasService.getMultiple();

    res.status(200).json({
      status: "success",
      data: daftarFakultas,
    });
  } catch (err) {
    console.error(`Error while getting fakultas `, err.message);
    next(err);
  }
};

exports.createFakultas = async function (req, res, next) {
  try {
    const { nama } = req.body;
    const message = await fakultasService.create(nama);
    res.status(201).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while creating fakultas`, err.message);
    next(err);
  }
};

exports.updateFakultas = async function (req, res, next) {
  try {
    const { id } = req.params;
    const { nama } = req.body;
    const message = await fakultasService.update(id, nama);
    res.status(200).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while updating fakultas`, err.message);
    next(err);
  }
};

exports.deleteFakultas = async function (req, res, next) {
  try {
    const { id } = req.params;
    const message = await fakultasService.remove(id);
    res.status(200).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while deleting fakultas`, err.message);
    next(err);
  }
};
