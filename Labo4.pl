/*
1 Dado un dato y un �rbol binario de b�squeda, localizar el nodo en el �rbol que contiene
el dato y retornar el sub�rbol que tiene a este nodo como ra�z.

*/


retornar_subarbol(Dato, [_, Raiz, SubArbolDer], SubArbol):-
    >(Dato, Raiz),
    retornar_subarbol(Dato, SubArbolDer, SubArbol).

retornar_subarbol(Dato, [SubArbolIz, Raiz, _], SubArbol):-
    <(Dato, Raiz),
    retornar_subarbol(Dato,SubArbolIz , SubArbol).

retornar_subarbol(Dato, [SubArbolIz,Dato, SubArbolDer], [SubArbolIz,Dato, SubArbolDer]).


/*
2 Un �rbol binario se dice que es equilibrado si el n�mero de niveles de sus sub�rboles
izquierdo y derecho no difieren en m�s de una unidad. Haga un programa en Prolog que
eval�e si un �rbol es equilibrado.

[[[[], 1, []], 3, [[], 4, []]], 5, [[], 9, [[], 11, []]]]
[[[[], 1, [4,7,0]], 3, [[], 4, []]], 5, [[], 9, [[], 11, []]]]

*/

equilibrado(Arbol):-
    diferencia_alturas(Arbol, _).

diferencia_alturas([], 0):-!.

diferencia_alturas([SubArbolIzq, _, SubArbolDer], Altura):-
    diferencia_alturas(SubArbolIzq, AlturaIzq),
    diferencia_alturas(SubArbolDer, AlturaDer),
    is(Altura, +(1, max(AlturaIzq, AlturaDer))),
    =<(abs(-(AlturaIzq, AlturaDer)),1).


/*
4 Dado un �rbol binario de b�squeda que contiene s�lo n�meros enteros, haga un
programa que coloque todos sus elementos en una lista.
*/


%[[[[],44,[]],25,[[],10,[[],-9,[]]]],7,[[[],1,[]],2,[[[],0,[]],80,[[],21,[]]]]]

arbol_a_lista([SubArbolIz,Raiz, SubArbolDer], Lista):-
    arbol_a_lista(SubArbolIz, ListaIzq),
    arbol_a_lista(SubArbolDer, ListaDer),
    append(ListaIzq, ListaDer, ListaConcat),
    =(Lista, [ Raiz | ListaConcat]).

arbol_a_lista([], []).



/*
5 Elabore un programa en Prolog que cuente la cantidad de nodos de un �rbol.
*/

reccorrer_y_contar([SubArbolIz, _ , SubArbolDer], Respuesta):-
    reccorrer_y_contar(SubArbolIz, ContadorIzq),
    reccorrer_y_contar(SubArbolDer, ContadorDer),
    is(Respuesta, +(1, +(ContadorIzq, ContadorDer))), !.

reccorrer_y_contar([], 0).


/*
6 Elabore un programa en Prolog que invierta un �rbol binario, es decir, todos los hijos
izquierdos pasan a ser hijos derechos, y viceversa.
*/

invertirArbol([SubArbolIz, Nodo , SubArbolDer], [SubArbolDerInv, Nodo, SubArbolIzInv] ):-
    invertirArbol(SubArbolIz, SubArbolIzInv),
    invertirArbol(SubArbolDer, SubArbolDerInv).

invertirArbol([], []):-!.


/*
  10) Dado un �rbol binario de b�squeda que contiene s�lo n�meros enteros, haga
un programa que devuelva la suma de todos sus elementos.
 */


sumaarbol([AI, Nodo, AD], R):-
    sumaarbol(AI, SumaI),
    sumaarbol(AD, SumaD),
    is(R, +(Nodo, +(SumaI, SumaD))), !.


sumaarbol([], 0):-!.


/*
 Dado un �rbol binario de b�squeda que contiene s�lo n�meros enteros, haga
un programa que devuelva la suma de sus hojas.

 */

sumahojas([], 0).

sumahojas([[], Nodo, []], Suma):-
    is(Suma, Nodo), !.

sumahojas([AI, _, AD], S):-
    sumahojas(AI, SumI),
    sumahojas(AD,SumD),
    is(S, +(SumI, SumD)).


/* 12
Cinco amigos estaban desesperados por ir a celebrar el fin de ex�menes al Tunco.
Acordaron que, despu�s del �ltimo examen, saldr�an volando a la playa, sin esperar a
nadie que se tardara.
El d�a del �ltimo examen, el primero en terminarlo fue Chico,
Paco sali� despu�s de Pancho,
Chepe no fue al paseo
y Jos� sali� inmediatamente antes de
Paco.
En qu� orden terminaron el examen?
*/


ordenExamen(Orden):-
    =(Orden, [_,_,_,_,_]),
    =(Orden, [[chico, 1]|_]),
    examen_finalizado([paco, OrdenPaco], Orden),
    examen_finalizado([pancho, OrdenPancho], Orden),
    >(OrdenPaco, OrdenPancho),
    last(Orden, [chepe, 5]),
    examen_finalizado([jose, OrdenJose], Orden),
    succ(OrdenJose, OrdenPaco), !.

examen_finalizado([X,2], [_,[X,2],_,_,_]).
examen_finalizado([X,3], [_,_,[X,3],_,_]).
examen_finalizado([X,4], [_,_,_,[X,4],_]).


d(X, X, 1):- atom(X), not(number(X)), !.

d(X, C, 0):- atom(X), not(number(X)), number(C), !.

d(X, C*X, C):- atom(X), not(number(X)), number(C), !.

d(X, log(X), 1/X):- atom(X), not(number(X)),!.

d(X, A^X, A^X*log(A)):- atom(X), not(number(X)), number(A), !.

% Derivada de la forma x^n
d(X, X^N, N*(X^Ne)):- atom(X), not(number(X)), number(N), is(Ne, -(N, 1)).
