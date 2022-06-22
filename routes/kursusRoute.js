const express = require("express");
const router = express.Router();
const kursusController = require("../controllers/kursusController");

router.route("/").get(kursusController.getAllKursus).post(kursusController.createKursus);

router.route("/:id").patch(kursusController.updateKursus).delete(kursusController.deleteKursus);

module.exports = router;
