const express = require("express");
const app = express();
const port = 3000;
const cors = require("cors");

const fakultasRouter = require("./routes/fakultasRoute");
const jurusanRouter = require("./routes/jurusanRoute");
const kriteriaRouter = require("./routes/kriteriaRoute");
const subkriteriaRouter = require("./routes/subkriteriaRoute");
const kursusRouter = require("./routes/kursusRoute");
const alamatRouter = require("./routes/alamatRoute");
const parameterRouter = require("./routes/parameterRoute");

app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(cors());

app.use("/fakultas", fakultasRouter);
app.use("/jurusan", jurusanRouter);
app.use("/kriteria", kriteriaRouter);
app.use("/subkriteria", subkriteriaRouter);
app.use("/kursus", kursusRouter);
app.use("/alamat", alamatRouter);
app.use("/parameter", parameterRouter);

/* Error handler middleware */
app.use((err, req, res, next) => {
  const statusCode = err.statusCode || 500;
  console.error(err.message, err.stack);
  res.status(statusCode).json({ message: err.message });
  return;
});
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
