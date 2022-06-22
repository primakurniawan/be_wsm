const kriteriaService = require("../services/kriteriaService");

exports.getAllKriteria = async function (req, res, next) {
  try {
    const daftarKriteria = await kriteriaService.getMultiple();

    res.status(200).json({
      status: "success",
      data: daftarKriteria,
    });
  } catch (err) {
    console.error(`Error while getting kriteria `, err.message);
    next(err);
  }
};

exports.createKriteria = async function (req, res, next) {
  try {
    const { nama } = req.body;
    const message = await kriteriaService.create(nama);
    res.status(201).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while creating kriteria`, err.message);
    next(err);
  }
};

exports.updateKriteria = async function (req, res, next) {
  try {
    const { id } = req.params;
    const { nama } = req.body;
    const message = await kriteriaService.update(id, nama);
    res.status(200).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while updating kriteria`, err.message);
    next(err);
  }
};

exports.deleteKriteria = async function (req, res, next) {
  try {
    const { id } = req.params;
    const message = await kriteriaService.remove(id);
    res.status(200).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while deleting kriteria`, err.message);
    next(err);
  }
};
