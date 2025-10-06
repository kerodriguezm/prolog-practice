% Hechos
arriba_de(taza,libro).
se_tocan(taza,libro).
% Reglas
soporta(Y, X) :- encima_de(X, Y).
encima_de(X,Y) :- arriba_de(X,Y), se_tocan(X,Y).