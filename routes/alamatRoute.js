const express = require("express");
const router = express.Router();
const alamatController = require("../controllers/alamatController");

router.route("/").get(alamatController.getAllAlamat).post(alamatController.createAlamat);

router.route("/detail").get(alamatController.getAlamatDetail);
router.route("/ruteTerpendek").get(alamatController.getRute);

router.route("/:id").patch(alamatController.updateAlamat).delete(alamatController.deleteAlamat);

module.exports = router;
