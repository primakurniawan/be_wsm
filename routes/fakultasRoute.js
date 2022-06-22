const express = require("express");
const router = express.Router();
const fakultasController = require("../controllers/fakultasController");

router.route("/").get(fakultasController.getAllFakultas).post(fakultasController.createFakultas);

router.route("/:id").patch(fakultasController.updateFakultas).delete(fakultasController.deleteFakultas);

module.exports = router;
