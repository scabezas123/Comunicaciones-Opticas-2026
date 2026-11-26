function simbolos_modulados = miQamModCuad(x, M, phi_err)

% MODULACION QAM IDEAL CON CODIFICACION GRAY
simbolos_ideales = qammod(x, M, 'gray');

% SEPARACION DE LAS RAMAS I Y Q
I = real(simbolos_ideales);
Q = imag(simbolos_ideales);

% APLICACION DEL ERROR DE FASE EN CADA RAMA
simbolos_modulados = I .* exp(1i * phi_err/2) + ...
    1i * Q .* exp(-1i * phi_err/2);

end