const kursusService = require("../services/kursusService");

exports.getAllKursus = async function (req, res, next) {
  try {
    const daftarKursus = await kursusService.getMultiple();

    res.status(200).json({
      status: "success",
      data: daftarKursus,
    });
  } catch (err) {
    console.error(`Error while getting kursus `, err.message);
    next(err);
  }
};

exports.createKursus = async function (req, res, next) {
  try {
    const { nama } = req.body;
    const message = await kursusService.create(nama);
    res.status(201).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while creating kursus`, err.message);
    next(err);
  }
};

exports.updateKursus = async function (req, res, next) {
  try {
    const { id } = req.params;
    const { nama } = req.body;
    const message = await kursusService.update(id, nama);
    res.status(200).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while updating kursus`, err.message);
    next(err);
  }
};

exports.deleteKursus = async function (req, res, next) {
  try {
    const { id } = req.params;
    const message = await kursusService.remove(id);
    res.status(200).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while deleting kursus`, err.message);
    next(err);
  }
};
