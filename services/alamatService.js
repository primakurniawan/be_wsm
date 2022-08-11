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
  const rows = await db.query(`
  SELECT alamat_kursus.id, alamat_kursus.nama, alamat_kursus.lon, alamat_kursus.lat FROM alamat_kursus 
  INNER JOIN kursus ON kursus.id = alamat_kursus.id_kursus
  WHERE id_kursus=${id_kursus}`);
  rows.unshift({ id: 0, lon: currentLocation[0], lat: currentLocation[1] });
  let storesCoordinates = ``;
  rows.forEach((store) => {
    storesCoordinates += `${store.lon},${store.lat};`;
  });

  storesCoordinates = storesCoordinates.slice(0, -1);
  const matrix = await axios.get(
    `https://api.mapbox.com/directions-matrix/v1/mapbox/driving/${storesCoordinates}?access_token=pk.eyJ1IjoicHJpbWFrdXJuaWF3YW4iLCJhIjoiY2wzamVrOHhvMDZyMzNqbzQ1cmt4anJ0ZCJ9.plWxz32egjvGNLpCZL9uVg&annotations=distance,duration`
  );

  var g = new jsgraphs.WeightedDiGraph(matrix.data.distances.length);
  matrix.data.distances.forEach((distance, i) => {
    distance.map((e, j) => {
      g.addEdge(new jsgraphs.Edge(i, j, e));
    });
  });
  var bf = new jsgraphs.BellmanFord(g, 0);

  const pathNode = [];
  var path = bf.pathTo(rows.findIndex((e) => e.id === idTujuan));
  for (var i = 0; i < path.length; ++i) {
    var e = path[i];
    pathNode.push(rows[e.to()]);
  }

  const rowRoutes = [];
  pathNode.forEach((e, i) => {
    rowRoutes.push(e);
  });

  let routesCoordinates = ``;
  let routesNames = `awal;`;
  pathNode.forEach((store) => {
    console.log("store");
    console.log(store);
    routesCoordinates += `${store.lon},${store.lat};`;
    routesNames += `${store.nama !== undefined ? store.nama.replace(" ", "%20") : "none"};`;
  });
  routesCoordinates = routesCoordinates.slice(0, -1);
  routesNames = routesNames.slice(0, -1);

  console.log("routesCoordinates");
  console.log(routesCoordinates);
  console.log(
    `https://api.mapbox.com/directions/v5/mapbox/driving/${currentLocation[0]},${currentLocation[1]};${routesCoordinates}?access_token=pk.eyJ1IjoicHJpbWFrdXJuaWF3YW4iLCJhIjoiY2wzamVrOHhvMDZyMzNqbzQ1cmt4anJ0ZCJ9.plWxz32egjvGNLpCZL9uVg&continue_straight=false&overview=simplified&steps=true&language=id&waypoint_names=${routesNames}&geometries=geojson`
  );

  const routes = await axios.get(
    `https://api.mapbox.com/directions/v5/mapbox/driving/${currentLocation[0]},${currentLocation[1]};${routesCoordinates}?access_token=pk.eyJ1IjoicHJpbWFrdXJuaWF3YW4iLCJhIjoiY2wzamVrOHhvMDZyMzNqbzQ1cmt4anJ0ZCJ9.plWxz32egjvGNLpCZL9uVg&continue_straight=false&overview=simplified&steps=true&language=id&waypoint_names=${routesNames}&geometries=geojson`
  );

  return routes.data;
};
