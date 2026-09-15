% Personajes (nombre, nivel, vida)  
personaje('Elara', 5, 100).
personaje('Kael', 3, 80).
personaje('Rin', 7, 120).
personaje('Allancito', 1, 30).

%Misiones(id, nombre, dificultad, xp) 
mision(m1, 'Bosque de Sombras', 2, 50).
mision(m2, 'Cueva del Dragon', 5, 120).
mision(m3, 'Torre Arcana', 7, 200).

%Inventarios(Personaje, lista de objetos)
inventario('Elara', [espada, escudo, pocion]).
inventario('Kael', [arco, flechas]).
inventario('Rin', [varita, grimorio, pocion, amuleto]).
inventario('Allancito', [manos, palos]).

%Objetos requeridos por mision 
requiere(m2, escudo). requiere(m2, pocion).
requiere(m3, grimorio). requiere(m3, pocion).

%arma(nombre, daño, elemento)
arma(espada, 15, fuego).
tiene('Allancito', arma(espada, 15, fuego)).



xp_para_subir_nivel(NivelActual, XP) :-
    XP is NivelActual * 30.

vida_restante(VidaMax, Danio, Final) :-
    Final is VidaMax - Danio.

% Caso base; 0 misiones = 0 XP
xp_acumulada(0, 0).
% Caso recursivo: XP(N) = XP (N-1) + (30 * N)
xp_acumulada(N, Total) :-
    N > 0,
    N1 is N - 1,
    xp_acumulada(N1, Prev),
    Total is Prev + (30 * N).

dano_acumulado(0, 0).
dano_acumulado(N, Total) :-
    N > 0,
    N1 is N - 1,
    dano_acumulado(N1, Prev),
    Total is Prev + (10 * N).

%Dos personajes distintos con el mismo nivel exacto
mismo_nivel(P1, P2) :-
    personaje(P1, N, _),
    personaje(P2, N, _),
    P1 \= P2.
%Un personaje con la vida perfectamente balanceada (vida = 100)
vida_balanceada(P) :-
    personaje(P, _, Vida),
    Vida =:= 100.

mas_fuerte(P1, P2) :-
    personaje(P1, N1, _),
    personaje(P2, N2, _),
    N1 > N2.

mismo_objeto(P1, P2, Obj) :-
    inventario(P1, Lista1),
    inventario(P2, Lista2),
    member(Obj, Lista1),
    member(Obj, Lista2).
