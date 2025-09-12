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
