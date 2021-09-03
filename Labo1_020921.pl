%LABO 1

% EJERCICIO 4

juego(juego1).
juego(juego2).
juego(juego3).
juego(juego4).
tiene(javito,juego2).
tiene(javito,juego2).
tiene(rodri,juego3).
tiene(rodri,juego1).
tiene(pepito,juego3).
tiene(pepito,juego2).


comprar_juego(X):-
   not(juego(X)),
   writeln("No está en tienda"), !.

comprar_juego(X):-

    juego(X),
    (tiene(rodri, X); tiene(pepito, X); tiene(javito, X)),
    writeln("No puede comprar"), !.


comprar_juego(X):-
    juego(X),
    not(tiene(javito,X)),
    not(tiene(rodri,X)),
    not(tiene(pepito,X)),
    writeln("Se puede comprar"), !.



% EJERCICIO 6

enemigo(made, fati).
enemigo(fati, made).
enemigo(dir, fati).
enemigo(fati, dir).
enemigo(thanos, capi).
enemigo(thanos, ironman).
enemigo(ironman, thanos).
enemigo(capi, thanos).
enemigo(thanos, fati).
enemigo(fati, thanos).


aliado(X,Y,Z):-
    enemigo(X,Y),
    enemigo(Y,X),
    enemigo(Z,Y),
    not(enemigo(X,Z)),
    not(enemigo(Z,X)),
    \==(Z,X).

% Posible caso aliado(made, fati, Z).

% EJERCICIO 7

calorias(pollo, 200).
calorias(gazpacho, 150).
calorias(consome, 300).
calorias(filetecerdo, 400).
calorias(polloasado, 280).
calorias(trucha, 160).
calorias(bacalao, 300).
calorias(flan, 200).
calorias(nueces, 500).
calorias(naranja, 50).

valor_calorico(X, Y, Z, V):-
  calorias(X, X1),
  calorias(Y, X2),
  calorias(Z, X3),
  is(V, +(X1, +(X2, X3) )).


comida_equilibrada(X, Y, Z):-
  calorias(X, X1),
  calorias(Y, X2),
  calorias(Z, X3),
  is(V, +(X1, +(X2, X3) )),
  <(V, 800),
  writeln("La comida no supera las 800 calorías"),!.


comida_equilibrada(X, Y, Z):-
  calorias(X, X1),
  calorias(Y, X2),
  calorias(Z, X3),
  is(V, +(X1, +(X2, X3) )),
  >=(V, 800),
  writeln("La comida supera las 800 calorías"),!.


% EJERCICIO CONTAR RECURSIVA

contar(N, N):-
    writeln(N), !.

contar(A, N):-
    <(A, N),
    writeln(A),
    is(A2, +(A, 1)),
    contar(A2, N).


% EJERCICIO FACTORIAL RECURSIVA


factorial(1,1):- !.

factorial(X,Y):-
   >(X,1),
   is(X1, -(X,1)),
   factorial(X1, Y1),
   is(Y, *(X, Y1)),
   writeln(Y), !.



% EJERCICIO FIBO RECURSIVA

fibo(0,0):- !.
fibo(1,1):- !.

fibo(N, R):-
   is(N1, -(N, 1)),
   fibo(N1, R1),
   is(N2, -(N, 2)),
   fibo(N2, R2),
   is(R, +(R1, R2)), !.
