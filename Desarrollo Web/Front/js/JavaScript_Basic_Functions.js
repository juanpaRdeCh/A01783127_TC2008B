
// Funcion para ordenar en orden descendente un array.

let list = [24, 36, 12, 5, 30, 99, 1];

function descendingArray(array) 
{
    let arraylength = array.length;
    for (let i = 0; i < arraylength - 1; i++) 
    {
      for (let n = i + 1; n < arraylength; n++) 
      {
        if (array[n] > array[i]) 
        {
          let temporal = array[i];
          array[i] = array[n];
          array[n] = temporal;
        }
      }
    }
    return array
  }
console.log("lista desordenada:\n", list)
const orderedList=descendingArray(list);
console.log("lista ordenada:", orderedList); 

//Funcion pra determinar cual es la cadena mas frecuente dentro de una lista de cadenas de texto

const lista = ["perro", "gato", "jaguar", "perro", "elefante" ];

function FrequentString(stringList) 
{
    let accumulator = {};
    let frequencyNum = 0;
    let mostFrequentString = '';
  
    stringList.forEach(string => 
    {
      if (accumulator[string]) 
      {
        accumulator[string]++;
      } 
      else 
      {
        accumulator[string] = 1;
      }
  
      if (accumulator[string] > frequencyNum) 
      {
        frequencyNum = accumulator[string];
        mostFrequentString = string;
      }
    }
    );
    return [mostFrequentString, frequencyNum, accumulator];
  }
  
const mostFrequentData=FrequentString(lista)
console.log("\nValores de salida: \n\n| Cadena mas frecuente | Numero de repeticiones | Acumulador de todos los elementos | \n", mostFrequentData);

//Funcion para ordenar alfabeticamente las cadenas de texto en una lista

let alphUnorderedList = ["Juan", "Pablo", "Pedro", "Angel", "Jose", "Octavio"];

function alphSortList(lst) 
{
  for (let i = 1; i < lst.length; i++) 
  {
    let selected = lst[i];
    let n = i - 1;
    while (n >= 0 && lst[n] > selected) 
    {
      lst[n + 1] = lst[n];
      n--;
    }
    lst[n + 1] = selected;
  }
  return lst;
}
console.log("\nlista desordenada: \n", alphUnorderedList)
const alphOrderedList = alphSortList(alphUnorderedList);
console.log("\nLista ordenada:\n",alphOrderedList); 

