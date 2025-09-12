/* Clausulas sobre una familia y reglas para determinar relaciones familiares */

% Hechos
varon(eduardo).
varon(francisco).
varon(luis).
varon(mario).

mujer(alicia).
mujer(veronica).
mujer(victoria).
mujer(beatriz).

padres(eduardo,francisco,victoria).
padres(alicia,francisco,victoria).
padres(luis,eduardo,veronica).
padres(beatriz,alicia,mario).

esposos(eduardo,veronica).
esposos(mario,alicia).
esposos(francisco,victoria).

% Reglas básicas
hermana(Ella,X) :- mujer(Ella), padres(Ella,M,P), padres(X,M,P), Ella \= X.
hermano(El,X) :- varon(El), padres(El,M,P), padres(X,M,P), El \= X.

hijo(El,X) :- varon(El), padres(El,X,_).
hijo(El,X) :- varon(El), padres(El,_,X).

hija(Ella,X) :- mujer(Ella), padres(Ella,X,_).
hija(Ella,X) :- mujer(Ella), padres(Ella,_,X).

% Reglas agregadas
nieto(Nieto,Abuelo) :- varon(Nieto), padres(Nieto,Padre,_), (padres(Padre,Abuelo,_) ; padres(Padre,_,Abuelo)).
nieta(Nieta,Abuelo) :- mujer(Nieta), padres(Nieta,Padre,_), (padres(Padre,Abuelo,_) ; padres(Padre,_,Abuelo)).

abuelo(Abuelo,Nieto) :- varon(Abuelo), (padres(Padre,Abuelo,_) ; padres(Padre,_,Abuelo)), padres(Nieto,Padre,_).
abuela(Abuela,Nieto) :- mujer(Abuela), (padres(Padre,Abuela,_) ; padres(Padre,_,Abuela)), padres(Nieto,Padre,_).

% Relaciones adicionales
sobrino(Sobrino,Tio) :- varon(Sobrino), padres(Sobrino,Padre,_), (hermano(Tio,Padre) ; hermana(Tio,Padre)).
sobrina(Sobrina,Tio) :- mujer(Sobrina), padres(Sobrina,Padre,_), (hermano(Tio,Padre) ; hermana(Tio,Padre)).