
function simbolos_modulados = miQamMod(x, M, theta_err)

% MODULACION QAM IDEAL CON CODIFICACION GRAY
simbolos_ideales = qammod(x, M, 'gray');

% APLICACION DEL ERROR DE ROTACION DE FASE
simbolos_modulados = simbolos_ideales .* exp(1i * theta_err);

end
