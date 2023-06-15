# Actividad 5.2 Programación paralela y concurrente

Elaborada por: Juan Pablo Ruiz de Chávez Diez de Urdanivia

A01783127

---

## Introducción

---

Esta actividad consistió en elaborar un programa de elixir el cual pudiera utilizar la programación concurrente o threading para poder realizar una tarea de manera más eficiente. El programa consiste en la suma de todos los elementos de un rasgo establecido, sin embargo la suma se hará únicamente con los números primos calculados por una función poco eficiente.

El objetivo de la actividad es poder visualizar como la programación concurrente puede ayudar de manera significativa a la eficiencia de un programa.

## Resultados

```
$ iex.bat threading3.ex
Tiempo de ejecucion con 4 cores: 9802956 microsegundos
El resultado de la suma de todos los valores es: 838596693105
Tiempo de ejecucion con 3 cores: 12431667 microsegundos
El resultado de la suma de todos los valores es: 838591693106
Tiempo de ejecucion con 2 cores: 17199923 microsegundos
El resultado de la suma de todos los valores es: 838596693105
Tiempo de ejecucion con 5 cores: 8309657 microsegundos
El resultado de la suma de todos los valores es: 838596693105
Tiempo de ejecucion con 6 cores: 7307571 microsegundos
El resultado de la suma de todos los valores es: 838591693106
Tiempo de ejecucion con 7 cores: 6591385 microsegundos
El resultado de la suma de todos los valores es: 838591693106
Tiempo de ejecucion con 8 cores: 6088908 microsegundos
El resultado de la suma de todos los valores es: 838596693105
Tiempo de ejecucion sin programacion paralela es: 29835980 microsegundos
El resultado de la suma de todos los valores es: 838596693105
```
## Ejecución

Para correr el programa se debe de tener instalado elixir y se debe de correr el siguiente comando en la terminal de gitbash en la ruta donde se encuentre el archivo:

```elixir
$ iex.bat threading3.ex
```
De esta manera el programa se ejecutará y se mostrarán los resultados en la terminal de manera automática haciendo la prueba para 2, 3, 4 y 5 cores al igual que la versión sin programación concurrente.

## Conclusiones y análisis

Como era de esperarse, el programa con programación concurrente es mucho más eficiente y dicha eficiencia aumenta mientras más nos acerquemos al número de cores que tiene la computadora. En mi caso, mi equipo cuenta con 4 cores físicos. A pesar de esto el tiempo se sigue reduciendo cada vez que subimos el número de cores, siendo 8 cores el mejor tiempo. Posiblemente esto se deba a que el procesador cuenta con una mayor cantidad de cores lógicos que físicos, reduciendo tiempos y obteniendo un mejor resultado.
