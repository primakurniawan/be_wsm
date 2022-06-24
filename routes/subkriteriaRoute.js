const express = require("express");
const router = express.Router();
const subkriteria = require("../controllers/subkriteriaController");

router.route("/").get(subkriteria.getAllSubkriteria).post(subkriteria.createSubkriteria);
router.route("/detail").get(subkriteria.getAllSubkriteriaDetail);

router.route("/:id").patch(subkriteria.updateSubkriteria).delete(subkriteria.deleteSubkriteria);

module.exports = router;
