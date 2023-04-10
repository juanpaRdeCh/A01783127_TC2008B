
// p: Que es el DOM?
// r: Es la representacion de un documento HTML en forma de arbol, donde cada nodo es un elemento HTML

// p: Que es un nodo?
// r: Es un elemento HTML

// p: Como se accede a un elemento en el DOM?
// r: Mediante el metodo getElementById()

// p: Como se modifica un elemento del DOM?
// r: Mediante el metodo innerHTML

// p: Cual es la diferencia entre getElementById() y querySelector()?
// r: getElementById() devuelve un elemento, querySelector() devuelve una lista de elementos

// p: Que es un evento?
// r: Es una accion que se produce en un elemento HTML

// p: Que es un listener?
// r: Es una funcion que se ejecuta cuando se produce un evento

// p: Que es un callback?
// r: Es una funcion que se pasa como parametro a otra funcion

// p: Que es un objeto de evento?
// r: Es un objeto que se pasa como parametro a la funcion callback

$(document).mousemove(function(event) {
    var msg = "X: " + event.pageX + ", Y: " + event.pageY;
    $("#position").text(msg);
  });

var nombreGuardado = "";
var apellidoGuardado = "";

function guardarNombre() {
	nombreGuardado = document.getElementById("nombre").value;
	apellidoGuardado = document.getElementById("apellido").value;
	alert("Nombre y apellido guardados.");
}

function mostrarNombre() {
	alert("Nombre completo: " + nombreGuardado + " " + apellidoGuardado);
}

document.getElementById("guardar").addEventListener("click", guardarNombre);
document.getElementById("mostrar").addEventListener("click", mostrarNombre);




// Obtener referencias a la tabla y los botones
const table = document.getElementById('sampleTable');
const insertRowButton = document.getElementById('btn-insert-r');
const insertColumnButton = document.getElementById('btn-insert-c');

// Agregar un event listener para el botón "Insert row"
insertRowButton.addEventListener('click', function() {
  // Crear una nueva fila
  const newRow = table.insertRow();
  // Agregar dos nuevas celdas a la fila
  const newCell1 = newRow.insertCell();
  const newCell2 = newRow.insertCell();
  // Establecer el contenido de las nuevas celdas
  newCell1.textContent = 'New row column 1';
  newCell2.textContent = 'New row column 2';
});

// Agregar un event listener para el botón "Insert column"
insertColumnButton.addEventListener('click', function() {
  // Iterar sobre todas las filas de la tabla
  const rows = table.rows;
  for (let i = 0; i < rows.length; i++) {
    // Obtener la cantidad actual de columnas en la fila
    const currentColumns = rows[i].cells.length;
    // Crear una nueva celda al final de la fila
    const cell = rows[i].insertCell(currentColumns);
    // Establecer el contenido de la nueva celda
    cell.textContent = 'New column';
  }
});






// Obtener una referencia a la tabla y al botón
const tabla = document.getElementById("myTable");
const changeBtn = document.getElementById("btn-change");

// Agregar un manejador de eventos para el botón
changeBtn.addEventListener("click", function() {
  // Obtener los valores de índice de fila y columna y el nuevo valor del texto
  const rowIndex = document.getElementById("rowIndex").value;
  const colIndex = document.getElementById("colIndex").value;
  const newValue = document.getElementById("newValue").value;

  // Verificar si los valores de índice de fila y columna son válidos
  if (rowIndex >= 1 && rowIndex <= tabla.rows.length && colIndex >= 1 && colIndex <= tabla.rows[0].cells.length) {
    // Actualizar el contenido de la celda correspondiente
    tabla.rows[rowIndex - 1].cells[colIndex - 1].textContent = newValue;
  } else {
    // Mostrar un mensaje de error si los valores de índice de fila y columna son inválidos
    alert("Por favor ingresa valores de índice de fila y columna válidos");
  }
});


// Obtener referencias al select y a los botones
const colorSelect = document.getElementById("colorSelect");
const addBtn = document.getElementById("btn-add-color");
const rmvBtn = document.getElementById("btn-rmv-color");

// Agregar un manejador de eventos para el botón Agregar
addBtn.addEventListener("click", function() {
  // Crear un nuevo elemento de opción con un color aleatorio
  const newOption = document.createElement("option");
  const newColor = getRandomColor();
  newOption.text = newColor;
  newOption.value = newColor;

  // Agregar el nuevo elemento de opción al select
  colorSelect.add(newOption);
});

// Agregar un manejador de eventos para el botón Quitar
rmvBtn.addEventListener("click", function() {
  // Obtener el índice del elemento seleccionado
  const selectedIndex = colorSelect.selectedIndex;

  // Verificar si se ha seleccionado un elemento
  if (selectedIndex >= 0) {
    // Quitar el elemento seleccionado del select
    colorSelect.remove(selectedIndex);
  }
});

// Función para obtener un color aleatorio en formato hexadecimal
function getRandomColor() {
  const letters = "0123456789ABCDEF";
  let color = "#";
  for (let i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}




const imagenGato = document.getElementById("imagenGato");

imagenGato.addEventListener("mouseenter", () => {
  const width = Math.floor(Math.random() * (600 - 300) + 300);
  const height = Math.floor(Math.random() * (600 - 300) + 300);
  imagenGato.src = `http://placekitten.com/${width}/${height}`;
});


