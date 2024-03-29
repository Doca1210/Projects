function Fcon1 = silaOgranicenja2(teta,brz, R, omega, m)

Fcon1 = zeros(size(teta));

for i = 1:size(teta)
    row = teta(i,:);
    row1 = brz(i,:);
    Fcon1(i,1) = 2*m*R^2*omega*row1*sin(row)*cos(row);
end