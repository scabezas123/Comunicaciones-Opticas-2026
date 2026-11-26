
function [ruido, simbolos_recibidos] = generador_ruido(simbolos, SNR_dB)

% Conversion snr a lineal
SNR_lineal = 10^(SNR_dB/10);

%calculo de la potencia promedio de los simbolos
potencia_simbolos = mean(abs(simbolos).^2);

% CALCULO DE LA DEP DEL RUIDO
N0 = potencia_simbolos / SNR_lineal;

% DESVIO ESTANDAR DE LAS COMPONENTES DEL RUIDO
sigma = sqrt(N0/2);

% GENERACION de ruido gaussiano complejo
ruido_real = randn(size(simbolos));
ruido_imaginario = randn(size(simbolos));

ruido = sigma * (ruido_real + 1j*ruido_imaginario);

% SIMULACION DEL CANAL
simbolos_recibidos = simbolos + ruido;

end
