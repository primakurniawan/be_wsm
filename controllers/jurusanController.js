const jurusanService = require("../services/jurusanService");

exports.getAllAlternatives = async function (req, res, next) {
  try {
    const { category_id } = req.query;
    const alternatives = await jurusanService.getMultiple(category_id);

    res.status(200).json({
      status: "success",
      data: alternatives,
    });
  } catch (err) {
    console.error(`Error while getting alternatives `, err.message);
    next(err);
  }
};

exports.getRankAlternative = async function (req, res, next) {
  try {
    const { kriteria } = req.query;
    const rankAlternative = await jurusanService.getRankAlternative(JSON.parse(kriteria));
    res.status(200).json({
      status: "success",
      data: rankAlternative,
    });
  } catch (err) {
    console.error(`Error while getting rank alternative `, err.message);
    next(err);
  }
};

exports.createAlternative = async function (req, res, next) {
  try {
    const { nama, id_fakultas, kriteria } = req.body;
    console.log("id_fakultas", id_fakultas);
    const message = await jurusanService.create(nama, id_fakultas, kriteria);
    res.status(201).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while creating alternative`, err.message);
    next(err);
  }
};

exports.updateAlternative = async function (req, res, next) {
  try {
    const { id } = req.params;
    const { name, parameters_id } = req.body;
    const message = await jurusanService.update(id, name, parameters_id);
    res.status(200).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while updating aspect`, err.message);
    next(err);
  }
};

exports.deleteAlternative = async function (req, res, next) {
  try {
    const { id } = req.params;
    const message = await jurusanService.remove(id);
    res.status(200).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while deleting aspect`, err.message);
    next(err);
  }
};
