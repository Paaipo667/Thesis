function [Watt] = electricity_h(v0,D,h, alpha, rho)
% correctie voor hoogte
v=((h/10)^alpha)*v0;
uren=size(v,1);
for i=1:uren
    if v(i)>25 || v(i)<3
    v(i)=0;
    end
end
% oppervlakte berekening
A=(pi/4)*D^2;
%rho gemiddelde
rhomean=mean(rho);
% capaciteit berekenen
f=0.5*rhomean*A*v.^3;
Watt=f;
end
