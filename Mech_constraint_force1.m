function Fcon = silaOgranicenja(teta,brz, R, omega, m)

global g

Fcon = zeros(size(teta));

for i = 1:size(teta)
    row = teta(i,:);
    row1 = brz(i,:);
    Fcon(i,1) = -m * R * (row1^2) - m * R * (omega^2) * (sin(row))^2 + m * g - m * g * cos(row);
end