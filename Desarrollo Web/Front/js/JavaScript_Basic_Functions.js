

const unorderedList = [3, 5, 1, 8, 2];

function sortList(listaNumeros) {
    return listaNumeros.sort((a, b) => b - a);
  }
  
const orderedList = sortList(unorderedList);
console.log(orderedList);
