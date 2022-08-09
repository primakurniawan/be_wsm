const db = require("./db");
const { emptyOrRows } = require("../helper");
const config = require("../config");
var jsgraphs = require("js-graph-algorithms");
const axios = require("axios").default;
exports.getMultiple = async (id_kursus) => {
  const result = await db.query(`SELECT 
    kursus.id AS id_kursus, alamat_kursus.id AS id_alamat_kursus, kursus.nama AS nama_kursus, alamat_kursus.nama AS nama_alamat_kursus, alamat, lon, lat 
    FROM alamat_kursus
    INNER JOIN kursus ON kursus.id = alamat_kursus.id_kursus
    ${id_kursus ? `WHERE kursus.id = ${id_kursus}` : ""}
    ORDER BY id_kursus, id_alamat_kursus`);

  const data = emptyOrRows(result);

  return data;
};

exports.create = async (id_kursus, nama, alamat, lon, lat) => {
  console.log("id_kursus", id_kursus);
  console.log("nama", nama);
  console.log("alamat", alamat);
  console.log("lon", lon);
  console.log("lat", lat);
  const result = await db.query(`INSERT INTO alamat_kursus(id_kursus, nama, alamat, lon, lat) VALUES (${id_kursus},'${nama}','${alamat}',${lon},${lat})`);

  let message = "Error in creating alamat kursus";

  if (result.affectedRows) {
    message = "alamat created successfully";
  }

  return message;
};

exports.update = async (id, id_kursus, nama, alamat, lon, lat) => {
  const result = await db.query(`UPDATE alamat_kursus SET id_kursus=${id_kursus},nama='${nama}',alamat='${alamat}',lon=${lon},lat=${lat}  WHERE id=${id}`);

  let message = "Error in updating alamat kursus";

  if (result.affectedRows) {
    message = "alamat kursus updated successfully";
  }

  return message;
};

exports.remove = async (id) => {
  const result = await db.query(`DELETE FROM alamat_kursus WHERE id=${id}`);

  let message = "Error in deleting alamat kursus";

  if (result.affectedRows) {
    message = "alamat kursus deleted successfully";
  }

  return message;
};

exports.getRuteTerpendekKursus = async (id_kursus, currentLocation, idTujuan) => {
  console.log(id_kursus, currentLocation, idTujuan);
  const rows = await db.query(`
  SELECT * FROM alamat_kursus 
  INNER JOIN kursus ON kursus.id = alamat_kursus.id_kursus
  ${id_kursus ? `WHERE id_kursus=${id_kursus}` : ""}`);
  // const iteration = rows.length % 24;
  // const distanceRow = [];
  // for (let i = 0; i < iteration; i++) {}
  let storesCoordinates = ``;
  rows.forEach((store) => {
    storesCoordinates += `${store.lon},${store.lat};`;
  });
  storesCoordinates = storesCoordinates.slice(0, -1);

  const matrix = await axios.get(
    `https://api.mapbox.com/directions-matrix/v1/mapbox/driving/${currentLocation[0]},${currentLocation[1]};${storesCoordinates}?access_token=pk.eyJ1IjoicHJpbWFrdXJuaWF3YW4iLCJhIjoiY2wzamVrOHhvMDZyMzNqbzQ1cmt4anJ0ZCJ9.plWxz32egjvGNLpCZL9uVg&annotations=distance,duration`
  );

  var g = new jsgraphs.WeightedDiGraph(matrix.data.distances.length);
  matrix.data.distances.forEach((distance, i) => {
    distance.map((e, j) => {
      if (i === 0 && j !== 0) g.addEdge(new jsgraphs.Edge(0, rows[j - 1].id, e));
      else if (i !== 0 && j === 0) g.addEdge(new jsgraphs.Edge(rows[i - 1].id, 0, e));
      else if (i !== 0 && j !== 0 && i !== j) g.addEdge(new jsgraphs.Edge(rows[i - 1].id, rows[j - 1].id, e));
    });
  });
  var bf = new jsgraphs.BellmanFord(g, 0);

  const pathNode = [0];

  var path = bf.pathTo(idTujuan);
  for (var i = 0; i < path.length; ++i) {
    var e = path[i];
    pathNode.push(e.to());
  }

  const rowRoutes = [];
  pathNode.forEach((e, i) => {
    if (e !== 0) rowRoutes.push(rows.filter((row) => row.id === e)[0]);
  });

  let routesCoordinates = ``;
  let routesNames = `awal;`;
  rowRoutes.forEach((store) => {
    routesCoordinates += `${store.lon},${store.lat};`;
    routesNames += `${store.name !== undefined ? store.name.replace(" ", "%20") : "none"};`;
  });
  routesCoordinates = routesCoordinates.slice(0, -1);
  routesNames = routesNames.slice(0, -1);

  const routes = await axios.get(
    `https://api.mapbox.com/directions/v5/mapbox/driving/${currentLocation[0]},${currentLocation[1]};${routesCoordinates}?access_token=pk.eyJ1IjoicHJpbWFrdXJuaWF3YW4iLCJhIjoiY2wzamVrOHhvMDZyMzNqbzQ1cmt4anJ0ZCJ9.plWxz32egjvGNLpCZL9uVg&continue_straight=false&overview=simplified&steps=true&language=id&waypoint_names=${routesNames}&geometries=geojson`
  );

  return routes.data;
};
