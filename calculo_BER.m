
function BER_estimado = calculo_BER(bits, simbolos_complejos, M)

valores_SNR = 1:30;
BER_estimado = zeros(size(valores_SNR));

for i = 1:length(valores_SNR)

    % GENERACION DE RUIDO
    [~, recibidos] = generador_ruido(simbolos_complejos, valores_SNR(i));

    % DEMODULACION
    simbolos_detectados = demodulador(recibidos, M);

    % CONVERSION DE SIMBOLOS A BITS
    if M == 2
        bits_detectados = simbolos_detectados;

    elseif M == 4
        bits_agrupados = de2bi(simbolos_detectados, 2, 'left-msb');
        bits_detectados = reshape(bits_agrupados.', [], 1);
    end

    % CALCULO DE BER
    errores = sum(bits ~= bits_detectados);
    BER_estimado(i) = errores / length(bits);

end

end
