# Bases de datos
## tarea 1.1: Algebra relacional

Juan Pablo Ruiz de Chavez Diez de Urdanivi - A01783127

---

**Instrucciones**

Se dispone de una Base de Datos RELACIONAL para un torneo internacional compuesto de diversas competencias. El esquema de la base de datos es el siguiente:


• COMPETENCIA (NombreCompetencia: STRING, NumPtos: INTEGER, Tipo: STRING)

Una competencia de un cierto TIPO, se identifica por su nombre NOMBRECOMPETENCIA y aporta un cierto número de puntos NUMPTOS.


• PARTICIPANTE ( Número: INTEGER, Apellidos: STRING, Nombre: STRING, Nacionalidad: STRING)

Una persona que participa en el torneo es identificada por un número de participante NUMERO y se registra con sus APELLIDOS, su NOMBRE y su NACIONALIDAD.


• PUNTOSACUMULADOS(Número: INTEGER, Puntos: INTEGER )

Todo participante identificado por NUMERO acumula un número de puntos PUNTOS durante el torneo.


• CLASIFICACION(NombreCompetencia: STRING, Número: INTEGER, Lugar: INTEGER)

Para la competencia de nombre NOMBRECOMPETENCIA, el participante identificado con el número NUMERO fue clasificado en el lugar LUGAR.

---
Tomando en cuenta lo anterior, escriba en álgebra relacional las siguientes consultas:


1. Apellidos y nombre de los participantes de nacionalidad mexicana.
2. Apellidos, nombre y puntos acumulados de los participantes de USA.
3. Apellidos y nombre de los participantes que se clasificaron en primer lugar en al menos una competencia.
4. Nombre de las competencias en las que intervinieron los participantes mexicanos.
5. Apellidos y nombre de los participantes que nunca se clasificaron en primer lugar en alguna competencia.
6. Apellidos y nombre de los participantes siempre se clasificaron en alguna competencia.
7. Nombre de la competencia que aporta el máximo de puntos.
8. Países (nacionalidades) que participaron en todas las competencias.

---
## **Soluciones**

1. 
$\Pi_{apellido, nombre}(\sigma_{Nacionalidad="MEX"}(PARTICIPANTE))$

2. 
$\Pi_{apellido, nombre, puntos}(\sigma_{Nacionalidad="US"}(PARTICIPANTE \bowtie PUNTOSACUMULADOS))$

3. 
$\Pi_{apellido, nombre}(\sigma_{Lugar="1ro"}(PARTICIPANTE \bowtie CLASIFICACION))$

4. 
$\Pi_{NombreCompetencia}(\sigma_{Nacionalidad="MEX"}(PARTICIPANTE \bowtie COMPETENCIA))$

5. 
$R1=\Pi_{apellido, nombre}(PARTICIPANTE)$

$R2=\Pi_{apellido, nombre}(\sigma_{Lugar="1ro"} (PARTICIPANTE \bowtie CLASIFICACION))$

$R1-R2$

6.
En esta pregunta la redacción es un poco ambigua, por lo que consideraré "clasificarse" como haber quedado en el podium, es decir primer, segundo o tercer lugar.

$R1=\Pi_{apellido, nombre}(PARTICIPANTE)$

$R2=\Pi_{apellido, nombre}(\sigma_{Lugar="1ro"} (PARTICIPANTE \bowtie CLASIFICACION))$

$R3=\Pi_{apellido, nombre}(\sigma_{Lugar="2do"} (PARTICIPANTE \bowtie CLASIFICACION))$

$R2=\Pi_{apellido, nombre}(\sigma_{Lugar="3ro"} (PARTICIPANTE \bowtie CLASIFICACION))$

$R1\cap (R2\cup R3\cup R4$)

Honestamente no se si se puedan usar multiples "or" en una misma selección con sigma como lo voy a hacer a continuación, pero de ser ese el caso, la respuesta se podria abreviar como:

$R1=\Pi_{apellido, nombre}(PARTICIPANTE)$

$R2=\Pi_{apellido, nombre}(\sigma_{Lugar="1ro" or Lugar="2do"orLugar="3ro"} (PARTICIPANTE \bowtie CLASIFICACION))$

$R1\cap R2$

7.

$R1=\Pi_{NumPtos,NombreCompetencia}(COMPETENCIA)$

$R2=\Pi_{NumPtos,NombreCompetencia}(COMPETENCIA)$

$R3=\rho_{ptos1/ptos2}(R2)$

$R4=R3 \times R1$

$R5=\Pi_{ptos2}(\sigma_{ptos2>ptos1}(R4))$

$R5 - R1$

8. 

El ejercicio 8 de la malvada algebra relacional pudo contra mi. Lo seguire intentando hacer, pero no alcanzo a tenerlo listo para la hora de entrega :(





