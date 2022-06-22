const express = require("express");
const router = express.Router();
const jurusanController = require("../controllers/jurusanController");

router.route("/").get(jurusanController.getAllAlternatives).post(jurusanController.createAlternative);

router.route("/rank").get(jurusanController.getRankAlternative);

router.route("/:id").patch(jurusanController.updateAlternative).delete(jurusanController.deleteAlternative);

module.exports = router;
