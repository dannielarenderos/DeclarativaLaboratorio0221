
% LABORATORIO 3
% EJERCICIO 1

digito(0).
digito(1).
digito(2).
digito(3).
digito(4).
digito(5).
digito(6).
digito(7).
digito(8).
digito(9).

clave_secreta(Clave):-
	Clave = [N1, N2, N3, N4, N5],
	digito(N5),
	digito(N3),
	plus(N5, N3, 14),
	digito(N4),
        digito(N2),
	succ(N2, N4),
	digito(N1),
	=:=(N1, -(  *(2, N2), 1 )),
	plus(N2, N3, 10),
	=:=(+(N1, +(N2, +(N3, +(N4, N5)))), 30), !.


% EJERCICIO 2


color_cabello(blanco).
color_cabello(rubio).
color_cabello(castano).


colorCabello(S):-
	=(S, [SraBlanco, SraRubio, SraCastano]),
	color_cabello(SraBlanco),
	\==(SraBlanco, blanco),
	\==(SraBlanco, castano),
	color_cabello(SraRubio),
	\==(SraRubio, rubio),
	\==(SraRubio, SraBlanco),
	color_cabello(SraCastano),
	\==(SraCastano, castano),
	\==(SraCastano, SraRubio),
	\==(SraCastano, SraBlanco),!.


color_cabello_v2(blanco).
color_cabello_v2(rubio).
color_cabello_v2(castano).


colorCabello_v2(Solucion):-
	Solucion = [[srablanco, B], [srarubio, R], [sracastano, C]],

% Color de cabello de la señora Blanco:
	color_cabello_v2(B),
	\==(B, blanco),
	\==(B, castano), %Se afirma que la señora Blanco no
				 %tiene el pelo de color castaño.
% Color de cabello de la señora Rubio:
	color_cabello_v2(R),
	\==(R, rubio),
	\==(R, B),
% Color de cabello de la señora Castano:
	color_cabello_v2(C),
	\==(C, castano),
	\==(C, B),
	\==(C, R), !.




% EJERCICIO 3


asignar_casa([1, X], [[1, X], _, _, _]).
asignar_casa([2, X], [_, [2, X], _, _]).
asignar_casa([3, X], [_, _, [3, X], _]).
asignar_casa([4, X], [_, _, _, [4, X]]).


cuatro_casas(Hilera_casas):-
	=(Hilera_casas, [[1, _], [2, _], [3, _], [4, _]]),
	asignar_casa([V, vasquez], Hilera_casas),
	asignar_casa([M, moreno], Hilera_casas),
	(succ(M, V);
	 succ(V, M)),
	asignar_casa([G, gonzalez], Hilera_casas),
	( >(V, +(G, 1));
	  <(V, -(G, 1))),
	asignar_casa([F, flores], Hilera_casas),
	(>(G, +(F, 1));
	<(G, -(F, 1))).

