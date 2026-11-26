function [bits, simbolos, simbolos_complejos] = generador_simbolos(N, M)

% Cantidad de bits por simbolo
k = log2(M);

% GENERACION DE BITS
bits = randi([0 1], N*k, 1);

% AGRUPACION DE BITS
bits_agrupados = reshape(bits, k, []).';

% CONVERSION DE BITS A SIMBOLOS
simbolos = bi2de(bits_agrupados, 'left-msb');

% MODULACION QAM CON CODIFICACION GRAY
simbolos_complejos = qammod(simbolos, M, 'gray');

end