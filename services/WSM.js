function WSM(alternatifArray, subkriteriaCalon) {
  subkriteriaCalon = subkriteriaCalon.map((subkriteria) => {
    return {
      ...subkriteria,
      bobot: subkriteria.nilai / subkriteriaCalon.reduce((a, b) => a + b.nilai, 0),
    };
  });

  alternatifArray.forEach((alternatif) => {
    let skor = 0;
    let memenuhiSyarat = true;
    alternatif.kriteriaArray.forEach((kriteriaAlternatif) => {
      kriteriaAlternatif.subkriteriaArray.forEach((subkriteriaAlternatif) => {
        subkriteriaCalon.forEach((subkriteriaCalon) => {
          if (subkriteriaAlternatif.id_subkriteria == subkriteriaCalon.id_subkriteria) {
            subkriteriaAlternatif.nilai_bobot = subkriteriaCalon.bobot * subkriteriaAlternatif.nilai;
            skor += subkriteriaAlternatif.nilai_bobot;
            if (subkriteriaAlternatif.nilai > subkriteriaCalon.nilai) {
              memenuhiSyarat = false;
              console.log("subkriteriaAlternatif.nilai", subkriteriaAlternatif.nilai);
              console.log("subkriteriaCalon.nilai", subkriteriaCalon.nilai);
            }
          }
        });
      });
      alternatif.skor = skor;
      alternatif.memenuhiSyarat = memenuhiSyarat;
    });
  });

  const rank = alternatifArray
    .filter((e) => e.memenuhiSyarat === true)
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
