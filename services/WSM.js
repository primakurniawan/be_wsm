function WSM(alternatifArray, subkriteriaCalon) {
  subkriteriaCalon = subkriteriaCalon.map((subkriteria) => {
    return {
      ...subkriteria,
      bobot: subkriteria.nilai / subkriteriaCalon.reduce((a, b) => a + b.nilai, 0),
    };
  });

  alternatifArray.forEach((alternatif) => {
    let skor = 0;
    alternatif.kriteriaArray.forEach((kriteriaAlternatif) => {
      kriteriaAlternatif.subkriteriaArray.forEach((subkriteriaAlternatif) => {
        subkriteriaCalon.forEach((subkriteriaCalon) => {
          if (subkriteriaAlternatif.id_subkriteria == subkriteriaCalon.id_subkriteria) {
            subkriteriaAlternatif.nilai_bobot = subkriteriaCalon.bobot * subkriteriaAlternatif.nilai;
            skor += subkriteriaAlternatif.nilai_bobot;
          }
        });
      });
      alternatif.skor = skor;
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

  return rank;
}
module.exports = WSM;
