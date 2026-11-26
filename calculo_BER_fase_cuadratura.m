function BER_estimado = calculo_BER_fase_cuadratura(bits, simbolos, M, valores_fase, SNR_dB)

% VECTOR PARA GUARDAR LA BER
BER_estimado = zeros(size(valores_fase));

for i = 1:length(valores_fase)

    % MODULACION QAM CON ERROR DE CUADRATURA
    simbolos_modulados = miQamModCuad(simbolos, M, valores_fase(i));

    % GENERACION DE RUIDO
    [~, recibidos] = generador_ruido(simbolos_modulados, SNR_dB);

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