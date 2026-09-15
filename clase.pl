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
