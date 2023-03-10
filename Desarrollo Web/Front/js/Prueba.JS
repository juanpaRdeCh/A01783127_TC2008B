var letra = "MLYXAYMZAXmCYmGXmZY";
var contenedor = [];
var calculo = [];
var micalculo = 0;



letra = letra.toUpperCase()

console.log(letra)



function repetidos(){
  for (var i = 0; i < letra.length; i++) {
    if (contenedor.includes(letra[i]))   {
    }else{
        contenedor.push(letra[i])
        calculo.push(0)
    }

  }

  for (var p = 0; p < letra.length; p++) {

    for (var l = 0; l < contenedor.length; l++) {
          if (letra[p] == contenedor[l])  {
              calculo [l]= calculo [l]+1

          }

    }
  }


  for (var f = 0; f < calculo.length; f++) {

    if ( calculo[f] > calculo[micalculo]) {
            micalculo = f

    }
  }

 }

repetidos()

console.log("La primera letra mas recurrente es: " + contenedor[micalculo])
