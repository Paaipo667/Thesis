function [P] = capacity(v0,D,h, alpha, rho)
% correctie voor hoogte
v=((h/10)^alpha)*v0;
% rated windspeed
vr=mean(v)*1.75;
% oppervlakte berekening
A=(pi/4)*D^2;
%rho gemiddelde
rhomean=mean(rho);
% capaciteit berekenen
P=0.5*rhomean*A*vr.^3;
end

