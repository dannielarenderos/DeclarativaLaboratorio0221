
% HOJA DE EJERCICIO 1


% Ejercicio 7

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
    calorias(Y, Y1),
    calorias(Z, Z1),
    is(V, +(X1, +(Y1, Z1))).

comida_equilibrada(X, Y, Z):-
    calorias(X, X1),
    calorias(Y, Y1),
    calorias(Z, Z1),
    is(V, +(X1, +(Y1, Z1))),
    <(V, 800),
    writeln("La comida no supera lass 800"), !.

comida_equilibrada(X, Y, Z):-
    calorias(X, X1),
    calorias(Y, Y1),
    calorias(Z, Z1),
    is(V, +(X1, +(Y1, Z1))),
    >=(V, 800),
    writeln("La comida supera lass 800"), !.


%
%
% Ejercicio 2 - Recursión

letra(N):-
    write("Escriba la letra"),
    read(P),
    imprimir(N, P).


imprimir(0, _):-!.


imprimir(N, P):-
    >(N, 0),
    writeln(P),
    is(N1, -(N, 1)),
    imprimir(N1, P).

%
%
%  Ejercicio 3 - Recursión


jugar():-
    is(N, random(100)),
    juego(N, 1).

juego(N, Y):-
    writeln(N),

    writeln("Adivina "),
    read(P),
    verificar(N,P, Y).


verificar(N,P,Y):-
    ==(N, P),
    writeln("Ganaste"),
    writeln(Y), !.

verificar(N,P,Y):-
    <(N, P),
    writeln("El numero es menor"),
    is(Y2, +(Y, 1)),
    juego(N, Y2), !.


verificar(N,P,Y):-
    >(N, P),
    writeln("El numero es mayor"),
    is(Y2, +(Y, 1)),
    juego(N, Y2), !.



%
%
%  Ejercicio 4 - Recursión


euclides(A, 0 , A):-!.

euclides(A, B , C):-
   is(R, mod(A, B)),
   euclides(B, R, C).


%
%
%  Ejercicio 5 - Recursión

% III


dig_hex(0, 0).
dig_hex(1, 1).
dig_hex(2, 2).
dig_hex(3, 3).
dig_hex(4, 4).
dig_hex(5, 5).
dig_hex(6, 6).
dig_hex(7, 7).
dig_hex(8, 8).
dig_hex(9, 9).
dig_hex(10, 'A').
dig_hex(11, 'B').
dig_hex(12, 'C').
dig_hex(13, 'D').
dig_hex(14, 'E').
dig_hex(15, 'F').


conv_b10_b16(N):-
    <(N, 16),
    dig_hex(N,X),
    write(X), !.

conv_b10_b16(N):-
    is(R, mod(N, 16)),
    dig_hex(R,X),
    is(N2, //(N, 16)),
    conv_b10_b16(N2),
    write(X).



%
%

% II

conv_b10_b8(N):-
    not(number(N)),
    writeln('Debe ingresar un numero'), !.

conv_b10_b8(N):-
    <(N, 0),
    write('El numero debe ser positivo'), !.

conv_b10_b8(N):-
    <(N, 8),
    write(N), !.

conv_b10_b8(N):-
    >=(N, 8),
    is(DigOct, mod(N, 8)),
    is(N2, //(N, 8)),
    conv_b10_b8(N2),
    write(DigOct).



%
%
%
%

% I


conv_b10_b2(N):-
    not(number(N)),
    writeln('Debe ingresar un numero'), !.

conv_b10_b2(N):-
    <(N, 0),
    write('El numero debe ser positivo'), !.

conv_b10_b2(N):-
    <(N, 2),
    write(N), !.

conv_b10_b2(N):-
    >=(N, 2),
    is(DigBin, mod(N, 2)),
    is(N2, //(N, 2)),
    conv_b10_b2(N2),
    write(DigBin).

%
%
% ÚLTIMA PARTE - PROBLEMAS

% 1

paso(1, medicion).
paso(2, corte).
paso(3, moldeado).
paso(4, pulido).
paso(5, montaje).
paso(6, empacado).
paso(7, almacenaje).

proxima_etapa(N):-
    not(number(N)),
    writeln('Debe proporcionar un valor numérico'), !, fail.

proxima_etapa(N):-
    number(N),
    (<(N, 0); >(N, 7)),
    writeln('Debe ingresar un valor entre 0 y 7'), !, fail.

proxima_etapa(N):-
    number(N),
    >=(N, 0),
    =<(N, 7),
    is(Nsig, +(N, 1)),
    mostrar_etapas(Nsig).

mostrar_etapas(N):-
    not(paso(N, _)),
    writeln('Proceso concluido'), !.

mostrar_etapas(N):-
    paso(N, X),
    writeln(X),
    is(N2, +(N, 1)),
    mostrar_etapas(N2).
