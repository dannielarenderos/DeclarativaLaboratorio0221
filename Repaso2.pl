

% d X

d(X, X, 1):- atom(X), not(number(X)), !.


% d C

d(X, C, 0):- atom(X), not(number(X)), number(C), !.

% d C*X

d(X, C*X, C):-  atom(X), not(number(X)), number(C), !.

% d log(X)
%
d(X, log(X), 1/X):-  atom(X), not(number(X)), !.

% d A^X

d(X, A^X, A^X*log(A)):- atom(X), not(number(X)),number(A), !.

% d X^N

d(X, X^N, N*(X^(N1))):- atom(X), not(number(X)), number(N), =(N1, -(N, 1)), !.

% d X^(1/N)

d(X,  X^(1/N), 1/(N*((X)^(N1/N)))):-  atom(X), not(number(X)), number(N), is(N1, -(N, 1)), !.

d(X, X^(1/N), 1/(N*(((X)^Ne)))):- atom(X), not(number(X)), number(N), is(N1, -(N, 1) ), =(Ne, /(N1, N)), !.


% C
%
i(X, C, C*X):- atom(X), not(number(X)), number(C), !.

% X
%
i(X, X, (X^(2))/2):- atom(X), not(number(X)), !.

% C*X
%

i(X, C*X, C*((X^2)/2)) :- atom(X), not(number(X)), number(C), !.

%  X^N
i(X, X^N, (X^Ne)/Ne):-  atom(X), not(number(X)), number(N), is(Ne, +(N, 1)), !.

% C*Fun
%
i(X, C*Ux, C*IUx):- atom(X), not(number(X)), number(C), i(X, Ux, IUx), !.

i(X, Ux+Vx, IUx+IVx):- atom(X), not(number(X)), i(X, Ux, IUx), i(X, Vx, IVx), !.

i(X, Ux-Vx, IUx-IVx):- atom(X), not(number(X)), i(X, Ux, IUx), i(X, Vx, IVx), !.
