const express = require("express");
const router = express.Router();
const kriteriaController = require("../controllers/kriteriaController");

router.route("/").get(kriteriaController.getAllKriteria).post(kriteriaController.createKriteria);

router.route("/:id").patch(kriteriaController.updateKriteria).delete(kriteriaController.deleteKriteria);

module.exports = router;
