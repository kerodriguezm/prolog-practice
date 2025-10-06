# Consultas en Prolog – Familiares

Este documento contiene las consultas y resultados solicitados en los puntos **2.2 a 2.6** del ejercicio, ejecutadas sobre el archivo `familiares.pl`.

---


## 📌 Cómo ejecutar las consultas en Prolog

1. Guarda el archivo con los hechos y reglas como `familiares.pl`.  
2. Abre el intérprete de Prolog:
   ```bash
   swipl

**Carga el archivo**
```prolog
?- consult('familiares.pl').
```

## 2.2 Consultas básicas

### a) ¿Eduardo y Alicia son hermanos?
**Consulta:**
```prolog
?- hermano(eduardo, alicia).
```
**Resultado:**
```
true.
```
✅ Eduardo y Alicia son hermanos porque comparten a los mismos padres (Francisco y Victoria).

---

### b) ¿Quiénes son los padres de Beatriz?
**Consulta:**
```prolog
?- padres(beatriz, Padre, Madre).
```
**Resultado:**
```
Padre = alicia,
Madre = mario.
```
✅ Los padres de Beatriz son **Alicia** y **Mario**.

---

### c) ¿Eduardo es hijo de Mario?
**Consulta:**
```prolog
?- hijo(eduardo, mario).
```
**Resultado:**
```
false.
```
❌ Eduardo **no** es hijo de Mario, sino de Francisco y Victoria.

---

### d) ¿Luis es hijo de Verónica?
**Consulta:**
```prolog
?- hijo(luis, veronica).
```
**Resultado:**
```
true.
```
✅ Luis es hijo de Verónica (y de Eduardo).

---

### e) ¿De quién es hija Beatriz?
**Consulta:**
```prolog
?- hija(beatriz, X).
```
**Resultado:**
```
X = alicia ;
X = mario.
```
✅ Beatriz es hija de **Alicia** y de **Mario**.

---

## 2.3 Reglas para nieto y nieta

**Regla para nieto:**
```prolog
nieto(Nieto,Abuelo) :- 
    varon(Nieto), 
    padres(Nieto,Padre,_), 
    (padres(Padre,Abuelo,_) ; padres(Padre,_,Abuelo)).
```

**Regla para nieta:**
```prolog
nieta(Nieta,Abuelo) :- 
    mujer(Nieta), 
    padres(Nieta,Padre,_), 
    (padres(Padre,Abuelo,_) ; padres(Padre,_,Abuelo)).
```

---

## 2.4 Reglas para abuelo y abuela

**Regla para abuelo:**
```prolog
abuelo(Abuelo,Nieto) :- 
    varon(Abuelo), 
    (padres(Padre,Abuelo,_) ; padres(Padre,_,Abuelo)), 
    padres(Nieto,Padre,_).
```

**Regla para abuela:**
```prolog
abuela(Abuela,Nieto) :- 
    mujer(Abuela), 
    (padres(Padre,Abuela,_) ; padres(Padre,_,Abuela)), 
    padres(Nieto,Padre,_).
```

---

## 2.5 Consultas con abuelo/abuela/nieto/nieta

### a) ¿Eduardo es abuelo?
**Consulta:**
```prolog
?- abuelo(eduardo, _).
```
**Resultado:**
```
false.
```
❌ Eduardo no es abuelo (solo tiene un hijo, Luis).

---

### b) ¿Victoria es abuela?
**Consulta:**
```prolog
?- abuela(victoria, _).
```
**Resultado:**
```
true.
```
✅ Victoria es abuela de Luis.

---

### c) ¿De quién es nieto Luis?
**Consulta:**
```prolog
?- nieto(luis, X).
```
**Resultado:**
```
X = francisco ;
X = victoria.
```
✅ Luis es nieto de **Francisco** y **Victoria**.

---

### d) ¿Francisco es abuelo de Beatriz?
**Consulta:**
```prolog
?- abuelo(francisco, beatriz).
```
**Resultado:**
```
true.
```
✅ Francisco es abuelo de Beatriz.

---

## 2.6 Nuevas relaciones (ejemplo: sobrino y sobrina)

**Definiciones:**
```prolog
sobrino(Sobrino,Tio) :- 
    varon(Sobrino), 
    padres(Sobrino,Padre,_), 
    (hermano(Tio,Padre) ; hermana(Tio,Padre)).

sobrina(Sobrina,Tio) :- 
    mujer(Sobrina), 
    padres(Sobrina,Padre,_), 
    (hermano(Tio,Padre) ; hermana(Tio,Padre)).
```

---

### Ejemplos de consultas

**¿Luis es sobrino de Alicia?**
```prolog
?- sobrino(luis, alicia).
```
**Resultado:**
```
true.
```
✅ Luis es sobrino de Alicia.

---

**¿Beatriz es sobrina de Eduardo?**
```prolog
?- sobrina(beatriz, eduardo).
```
**Resultado:**
```
true.
```
✅ Beatriz es sobrina de Eduardo.

---

## 3.1 aprobar un examen

**Definiciones:**
```prolog
% Archivo: aprexamen.pl
% Predicados
aprueba_examen(X) :- preparado_para_examen(X).
aprueba_examen(X) :- persona(X),examen_facil.
preparado_para_examen(X) :- sabe_todo(X).
preparado_para_examen(X) :- asiste_a_clases(X), realiza_ejercicios(X),
lee_libro(X).
preparado_para_examen(X) :- preparado_para_examen(Y),tutor(Y,X).
% Proposiciones
persona(maria).
persona(alfredo).
persona(tomas).
persona(susana).
persona(juan).
lee_libro(alfredo).
lee_libro(maria).

asiste_a_clases(alfredo).
asiste_a_clases(maria).
realiza_ejercicios(alfredo).
realiza_ejercicios(maria).
sabe_todo(tomas).
tutor(maria,juan).
tutor(juan,susana).
```

---

### a) ¿Aprueba el examen Juan?

**Consulta:**
```prolog
?- aprueba_examen(juan).
```
**Resultado:**
```
true.
```
✅ Juan aprueba el examen.
---

### b) ¿Está Susana preparada para el examen?

**Consulta:**
```prolog
?- preparado_para_examen(susana).
```
**Resultado:**
```
true.
```
✅ Susana esta preparada para el examen.
---

### c) ¿Quién es el sabio del grupo?

**Consulta:**
```prolog
?- sabe_todo(X).
```
**Resultado:**
```
X = tomas.
```
✅ Tomas es el sabio del grupo.
---

### d) ¿Quiénes aprueban el examen?

**Consulta:**
```prolog
?- aprueba_examen(X).
```
**Resultado:**
```
X = tomas ;
X = alfredo ;
X = maria ;
X = juan ;
X = susana.
```
✅ La lista anterior muestra quienes aprobaran el examen.
---

### d) ¿Quiénes aprueban el examen?

**Consulta:**
```prolog
?- aprueba_examen(X).
```
**Resultado:**
```
X = tomas ;
X = alfredo ;
X = maria ;
X = juan ;
X = susana.
```
✅ La lista anterior muestra quienes aprobaran el examen.
---

### 4.1) Escribe un programa en Prolog que use esta base de conocimiento y muestre que SOPORTA(libro,taza) es verdadero

1. Si X está encima de Y, entonces Y soporta a X.
2. Si X está arriba de Y y se tocan una y otra, entonces X está encima de Y.
3. La taza está arriba del libro.
4. La taza toca al libro.

**Programa:**
```prolog
% Hechos
arriba_de(taza, libro).
se_tocan(taza, libro).
% Reglas
soporta(Y, X) :- encima_de(X, Y).
encima_de(X, Y) :- arriba_de(X, Y), se_tocan(X, Y).
```

---
### 4.2) SOPORTA(libro,taza)

**Consulta:**
```prolog
?- soporta(libro, taza).
```
**Resultado:**
```
true.
```
✅  La regla cumple con lo consultado
---

### 4.3) Convierte a Prolog la pregunta: ¿Qué soporta a la taza?

**Consulta:**
```prolog
?- soporta(Y, taza).
```
**Resultado:**
```
Y = libro.
```

---

### 4.4) Convierte a Prolog la pregunta: “¿Qué está encima del libro?”

**Consulta:**
```prolog
?- encima_de(X, libro).
```
**Resultado:**
```
X = taza.
```
---

### 5) Convierte a Prolog la pregunta: “¿Qué está encima del libro?”

El análisis de las consultas demostró la importancia de la precisión en la sintaxis y la estructura lógica, ya que un pequeño error puede alterar completamente los resultados del razonamiento. Además, se reforzó la comprensión sobre la forma en que Prolog utiliza la recursividad y el encadenamiento hacia atrás para llegar a conclusiones a partir de un conjunto finito de hechos.
