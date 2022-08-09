const alamatService = require("../services/alamatService");

exports.getAllAlamat = async function (req, res, next) {
  try {
    const { id_kursus } = req.query;
    const daftarAlamat = await alamatService.getMultiple(parseInt(id_kursus));
    res.status(200).json({
      status: "success",
      data: daftarAlamat,
    });
  } catch (err) {
    console.error(`Error while getting Alamat `, err.message);
    next(err);
  }
};

exports.getAlamatDetail = async function (req, res, next) {
  try {
    const daftarAlamat = await alamatService.getMultiple();
    const daftarAlamatDetail = [];
    daftarAlamat.forEach((e) => {
      console.log(e);
      const alamatKursus = {
        id_alamat_kursus: e.id_alamat_kursus,
        nama_alamat_kursus: e.nama_alamat_kursus,
        alamat: e.alamat,
        lon: e.lon,
        lat: e.lat,
      };
      const kursus = {
        id_kursus: e.id_kursus,
        nama_kursus: e.nama_kursus,
        alamat: [alamatKursus],
      };
      if (daftarAlamatDetail[daftarAlamatDetail.length - 1]?.id_kursus === e.id_kursus) {
        daftarAlamatDetail[daftarAlamatDetail.length - 1].alamat.push(alamatKursus);
      } else {
        daftarAlamatDetail.push(kursus);
      }
    });

    res.status(200).json({
      status: "success",
      data: daftarAlamatDetail,
    });
  } catch (err) {
    console.error(`Error while getting Alamat `, err.message);
    next(err);
  }
};

exports.createAlamat = async function (req, res, next) {
  try {
    const { id_kursus, nama, alamat, lon, lat } = req.body;
    console.log(id_kursus, nama, alamat, lon, lat);
    const message = await alamatService.create(id_kursus, nama, alamat, lon, lat);
    res.status(201).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while creating Alamat`, err.message);
    next(err);
  }
};

exports.updateAlamat = async function (req, res, next) {
  try {
    const { id } = req.params;
    const { id_kursus, nama, alamat, lon, lat } = req.body;
    const message = await alamatService.update(id, id_kursus, nama, alamat, lon, lat);
    res.status(200).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while updating Alamat`, err.message);
    next(err);
  }
};

exports.deleteAlamat = async function (req, res, next) {
  try {
    const { id } = req.params;
    const message = await alamatService.remove(id);
    res.status(200).json({
      status: "success",
      message,
    });
  } catch (err) {
    console.error(`Error while deleting Alamat`, err.message);
    next(err);
  }
};

exports.getRute = async function (req, res, next) {
  try {
    const { id_kursus, current_location, id_alamat_kursus } = req.query;
    console.log("req.query", req.query);
    const data = await alamatService.getRuteTerpendekKursus(parseInt(id_kursus), JSON.parse(current_location), parseInt(id_alamat_kursus));
    res.status(200).json({
      status: "success",
      data,
    });
  } catch (err) {
    console.error(`Error mendapatkan rute`, err.message);
    next(err);
  }
};
