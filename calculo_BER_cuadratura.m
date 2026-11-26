function BER_estimado = calculo_BER_cuadratura(bits, simbolos, M, phi_err, valores_SNR)

% MODULACION QAM CON ERROR DE CUADRATURA
simbolos_modulados = miQamModCuad(simbolos, M, phi_err);

% VECTOR PARA GUARDAR LA BER
BER_estimado = zeros(size(valores_SNR));

for i = 1:length(valores_SNR)

    % GENERACION DE RUIDO
    [~, recibidos] = generador_ruido(simbolos_modulados, valores_SNR(i));

    % DEMODULACION
    simbolos_detectados = qamdemod(recibidos, M, 'gray');

    % CONVERSION DE SIMBOLOS A BITS
    bits_agrupados = de2bi(simbolos_detectados, log2(M), 'left-msb');
    bits_detectados = reshape(bits_agrupados.', [], 1);

    % CALCULO DE BER
    errores = sum(bits ~= bits_detectados);
    BER_estimado(i) = errores / length(bits);

end

end