function WSM(alternatifArray, subkriteriaCalon) {
  subkriteriaCalon.forEach((kriteria) => {
    kriteria.bobot = kriteria.nilai / subkriteriaCalon.reduce((a, b) => a + b.nilai, 0);
  });

  alternatifArray.forEach((alternatif) => {
    alternatif.kriteriaArray.forEach((subkriteriaAlternatif) => {
      subkriteriaAlternatif.subkriteriaArray.forEach((subkriteriaAlternatif) => {
        subkriteriaCalon.forEach((subkriteriaCalon) => {
          if (subkriteriaAlternatif.id_jurusan === subkriteriaCalon.id_jurusan) {
            subkriteriaAlternatif.nilai_bobot = subkriteriaCalon.bobot * subkriteriaAlternatif.nilai;
          }
        });
      });

      alternatif.kriteriaArray.forEach((subkriteriaAlternatif) => {
        alternatif.skor = subkriteriaAlternatif.subkriteriaArray.reduce((a, b) => a + b.nilai_bobot, 0);
      });
    });
  });

  const rank = alternatifArray
    .sort((a, b) => b.skor - a.skor)
    .map((e, i) => {
      return {
        ...e,
        rank: i + 1,
      };
    });

  console.log(rank);

  return rank;
}
module.exports = WSM;
