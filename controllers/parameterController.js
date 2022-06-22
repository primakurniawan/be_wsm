const parameterService = require("../services/parameterService");

exports.getAllParameter = async function (req, res, next) {
  try {
    const daftarParameter = await parameterService.getMultiple();

    res.status(200).json({
      status: "success",
      data: daftarParameter,
    });
  } catch (err) {
    console.error(`Error while getting Parameter `, err.message);
    next(err);
  }
};

exports.getParameterDetail = async function (req, res, next) {
  try {
    const daftarParameter = await parameterService.getMultiple();
    const daftarParameterDetail = [];
    daftarParameter.forEach((e) => {
      console.log(e);
      const parameterDetail = {
        id_parameter: e.id_parameter,
        nama_parameter: e.nama_parameter,
      };
      const kriteria = {
        id_kriteria: e.id_kriteria,
        nama_kriteria: e.nama_kriteria,
        parameter: [parameterDetail],
      };
      if (daftarParameterDetail[daftarParameterDetail.length - 1]?.id_kriteria === e.id_kriteria) {
        daftarParameterDetail[daftarParameterDetail.length - 1].parameter.push(parameterDetail);
      } else {
        daftarParameterDetail.push(kriteria);
      }
    });

    res.status(200).json({
      status: "success",
      data: daftarParameterDetail,
    });
  } catch (err) {
    console.error(`Error while getting Parameter `, err.message);
    next(err);
  }
};

exports.createParameter = async function (req, res, next) {
  try {
    const { nama, nilai, id_kriteria } = req.body;
    const message = await parameterService.create(nama, nilai, id_kriteria);
    res.status(201).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while creating Parameter`, err.message);
    next(err);
  }
};

exports.updateParameter = async function (req, res, next) {
  try {
    const { id } = req.params;
    const { nama, nilai, id_kriteria } = req.body;
    const message = await parameterService.update(id, nama, nilai, id_kriteria);
    res.status(200).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while updating Parameter`, err.message);
    next(err);
  }
};

exports.deleteParameter = async function (req, res, next) {
  try {
    const { id } = req.params;
    const message = await parameterService.remove(id);
    res.status(200).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while deleting Parameter`, err.message);
    next(err);
  }
};
