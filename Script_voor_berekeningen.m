%% Ophalen data 
%Manueel

%%
h=90;
alpha=0.2;
v0=v_WV;
v=((h/10)^alpha)*v0;

%% functie testen
D=90;
h=100;
alpha=0.2;
rho=1;
Pwv=capacity(v_WV,D,h,alpha,rho);
disp(Pwv)

%% elia omvormen
Elia=Elia';
Eliax=reshape(Elia,[],1);
Eliax=Eliax*1000;
% nu is er een kolomvector met de load elk uur voor heel 2019

%% corrigeren windsnelheden
%rechtsreeks in functie

%% berekenen capaciteit per windturbine
Donshore=135;
Doffshore=150;
honshore=130;
hoffshore=114;
alphaonshore=0.20;
alphaoffshore=0.10;
CapacityAntwerpen_WT=capacity(v_Antwerpen,Donshore, honshore,alphaonshore,ad_Antwerpen);
CapacityWestVlaanderen_WT=capacity(v_WestVlaanderen,Donshore, honshore,alphaonshore,ad_WestVlaanderen);
CapacityOostVlaanderen_WT=capacity(v_OostVlaanderen,Donshore, honshore,alphaonshore,ad_OostVlaanderen);
CapacityLimburg_WT=capacity(v_Limburg,Donshore, honshore,alphaonshore,ad_Limburg);
CapacityVlaamsBrabant_WT=capacity(v_VlaamsBrabant,Donshore, honshore,alphaonshore,ad_VlaamsBrabant);
CapacityWallonie_WT=capacity(v_Wallonie,Donshore, honshore,alphaonshore,ad_Wallonie);
CapacityOffshore_WT=capacity(v_Offshore,Doffshore, hoffshore,alphaoffshore,ad_Offshore);

%%  berekenen capaciteit per windturbine met verliezen
Verliezenonshore=0.248;
Verliezenoffshore=0.243;
RealCapacityAntwerpen_WT=CapacityAntwerpen_WT*Verliezenonshore;
RealCapacityWestVlaanderen_WT=CapacityWestVlaanderen_WT*Verliezenonshore;
RealCapacityOostVlaanderen_WT=CapacityOostVlaanderen_WT*Verliezenonshore;
RealCapacityLimburg_WT=CapacityLimburg_WT*Verliezenonshore;
RealCapacityVlaamsBrabant_WT=CapacityVlaamsBrabant_WT*Verliezenonshore;
RealCapacityWallonie_WT=CapacityWallonie_WT*Verliezenonshore;
RealCapacityOffshore_WT=CapacityOffshore_WT*Verliezenoffshore;
%output tabel
RealCapacity_WT(1)=RealCapacityAntwerpen_WT;
RealCapacity_WT(2)=RealCapacityWestVlaanderen_WT;
RealCapacity_WT(3)=RealCapacityOostVlaanderen_WT;
RealCapacity_WT(4)=RealCapacityLimburg_WT;
RealCapacity_WT(5)=RealCapacityVlaamsBrabant_WT;
RealCapacity_WT(6)=RealCapacityWallonie_WT;
RealCapacity_WT(7)=RealCapacityOffshore_WT;

%% export naar excel
filename = 'ReelecapWT.xlsx';
writematrix(RealCapacity_WT,filename,'Sheet',1)

%% Jaarlijkse capaciteit in totaal zonder verliezen
%situatie 1
AntwerpenWTs1=Situatie1(1);
WestVlaanderenWTs1=Situatie1(2);
OostVlaanderenWTs1=Situatie1(3);
LimburgWTs1=Situatie1(4);
VlaamsBrabantWTs1=Situatie1(5);
WallonieWTs1=Situatie1(6);
OffshoreWTs1=Situatie1(7);
TotcapAntwerpens1=AntwerpenWTs1*CapacityAntwerpen_WT;
TotcapWestVlaanderens1=WestVlaanderenWTs1*CapacityWestVlaanderen_WT;
TotcapOostVlaanderens1=OostVlaanderenWTs1*CapacityOostVlaanderen_WT;
TotcapLimburgs1=LimburgWTs1*CapacityLimburg_WT;
TotcapVlaamsBrabants1=VlaamsBrabantWTs1*CapacityVlaamsBrabant_WT;
TotcapWallonies1=WallonieWTs1*CapacityWallonie_WT;
TotcapOffshores1=OffshoreWTs1*CapacityOffshore_WT;
TotcapBelgies1=TotcapAntwerpens1+TotcapWestVlaanderens1+TotcapOostVlaanderens1+TotcapLimburgs1+TotcapVlaamsBrabants1+TotcapWallonies1+TotcapOffshores1;
% output tabel
TotaleCapaciteits1(1)=TotcapAntwerpens1;
TotaleCapaciteits1(2)=TotcapWestVlaanderens1;
TotaleCapaciteits1(3)=TotcapOostVlaanderens1;
TotaleCapaciteits1(4)=TotcapLimburgs1;
TotaleCapaciteits1(5)=TotcapVlaamsBrabants1;
TotaleCapaciteits1(6)=TotcapWallonies1;
TotaleCapaciteits1(7)=TotcapOffshores1;
TotaleCapaciteits1(8)=TotcapBelgies1;
TotaleCapaciteits1=TotaleCapaciteits1';

%situatie 2
AntwerpenWTs2=Situatie2(1);
WestVlaanderenWTs2=Situatie2(2);
OostVlaanderenWTs2=Situatie2(3);
LimburgWTs2=Situatie2(4);
VlaamsBrabantWTs2=Situatie2(5);
WallonieWTs2=Situatie2(6);
OffshoreWTs2=Situatie2(7);
TotcapAntwerpens2=AntwerpenWTs2*CapacityAntwerpen_WT;
TotcapWestVlaanderens2=WestVlaanderenWTs2*CapacityWestVlaanderen_WT;
TotcapOostVlaanderens2=OostVlaanderenWTs2*CapacityOostVlaanderen_WT;
TotcapLimburgs2=LimburgWTs2*CapacityLimburg_WT;
TotcapVlaamsBrabants2=VlaamsBrabantWTs2*CapacityVlaamsBrabant_WT;
TotcapWallonies2=WallonieWTs2*CapacityWallonie_WT;
TotcapOffshores2=OffshoreWTs2*CapacityOffshore_WT;
TotcapBelgies2=TotcapAntwerpens2+TotcapWestVlaanderens2+TotcapOostVlaanderens2+TotcapLimburgs2+TotcapVlaamsBrabants2+TotcapWallonies2+TotcapOffshores2;
% output tabel
TotaleCapaciteits2(1)=TotcapAntwerpens2;
TotaleCapaciteits2(2)=TotcapWestVlaanderens2;
TotaleCapaciteits2(3)=TotcapOostVlaanderens2;
TotaleCapaciteits2(4)=TotcapLimburgs2;
TotaleCapaciteits2(5)=TotcapVlaamsBrabants2;
TotaleCapaciteits2(6)=TotcapWallonies2;
TotaleCapaciteits2(7)=TotcapOffshores2;
TotaleCapaciteits2(8)=TotcapBelgies2;
TotaleCapaciteits2=TotaleCapaciteits2';

%situatie 3
AntwerpenWTs3=Situatie3(1);
WestVlaanderenWTs3=Situatie3(2);
OostVlaanderenWTs3=Situatie3(3);
LimburgWTs3=Situatie3(4);
VlaamsBrabantWTs3=Situatie3(5);
WallonieWTs3=Situatie3(6);
OffshoreWTs3=Situatie3(7);
TotcapAntwerpens3=AntwerpenWTs3*CapacityAntwerpen_WT;
TotcapWestVlaanderens3=WestVlaanderenWTs3*CapacityWestVlaanderen_WT;
TotcapOostVlaanderens3=OostVlaanderenWTs3*CapacityOostVlaanderen_WT;
TotcapLimburgs3=LimburgWTs3*CapacityLimburg_WT;
TotcapVlaamsBrabants3=VlaamsBrabantWTs3*CapacityVlaamsBrabant_WT;
TotcapWallonies3=WallonieWTs3*CapacityWallonie_WT;
TotcapOffshores3=OffshoreWTs3*CapacityOffshore_WT;
TotcapBelgies3=TotcapAntwerpens3+TotcapWestVlaanderens3+TotcapOostVlaanderens3+TotcapLimburgs3+TotcapVlaamsBrabants3+TotcapWallonies3+TotcapOffshores3;
% output tabel
TotaleCapaciteits3(1)=TotcapAntwerpens3;
TotaleCapaciteits3(2)=TotcapWestVlaanderens3;
TotaleCapaciteits3(3)=TotcapOostVlaanderens3;
TotaleCapaciteits3(4)=TotcapLimburgs3;
TotaleCapaciteits3(5)=TotcapVlaamsBrabants3;
TotaleCapaciteits3(6)=TotcapWallonies3;
TotaleCapaciteits3(7)=TotcapOffshores3;
TotaleCapaciteits3(8)=TotcapBelgies3;
TotaleCapaciteits3=TotaleCapaciteits3';

TotaleCapaciteit(:,1)=TotaleCapaciteits1;
TotaleCapaciteit(:,2)=TotaleCapaciteits2;
TotaleCapaciteit(:,3)=TotaleCapaciteits3;
%% Jaarlijkse capaciteit met verliezen
Verliezenonshore=0.248;
Verliezenoffshore=0.243;

% situatie 1
TotaleReeleCapaciteits1(1)=TotcapAntwerpens1*Verliezenonshore;
TotaleReeleCapaciteits1(2)=TotcapWestVlaanderens1*Verliezenonshore;
TotaleReeleCapaciteits1(3)=TotcapOostVlaanderens1*Verliezenonshore;
TotaleReeleCapaciteits1(4)=TotcapLimburgs1*Verliezenonshore;
TotaleReeleCapaciteits1(5)=TotcapVlaamsBrabants1*Verliezenonshore;
TotaleReeleCapaciteits1(6)=TotcapWallonies1*Verliezenonshore;
TotaleReeleCapaciteits1(7)=TotcapOffshores1*Verliezenoffshore;
TotaleReeleCapaciteits1(8)=sum(TotaleReeleCapaciteits1(1:7));
TotaleReeleCapaciteits1=TotaleReeleCapaciteits1';

% situatie 3
TotaleReeleCapaciteits2(1)=TotcapAntwerpens2*Verliezenonshore;
TotaleReeleCapaciteits2(2)=TotcapWestVlaanderens2*Verliezenonshore;
TotaleReeleCapaciteits2(3)=TotcapOostVlaanderens2*Verliezenonshore;
TotaleReeleCapaciteits2(4)=TotcapLimburgs2*Verliezenonshore;
TotaleReeleCapaciteits2(5)=TotcapVlaamsBrabants2*Verliezenonshore;
TotaleReeleCapaciteits2(6)=TotcapWallonies2*Verliezenonshore;
TotaleReeleCapaciteits2(7)=TotcapOffshores2*Verliezenoffshore;
TotaleReeleCapaciteits2(8)=sum(TotaleReeleCapaciteits2(1:7));
TotaleReeleCapaciteits2=TotaleReeleCapaciteits2';

% situatie 3
TotaleReeleCapaciteits3(1)=TotcapAntwerpens3*Verliezenonshore;
TotaleReeleCapaciteits3(2)=TotcapWestVlaanderens3*Verliezenonshore;
TotaleReeleCapaciteits3(3)=TotcapOostVlaanderens3*Verliezenonshore;
TotaleReeleCapaciteits3(4)=TotcapLimburgs3*Verliezenonshore;
TotaleReeleCapaciteits3(5)=TotcapVlaamsBrabants3*Verliezenonshore;
TotaleReeleCapaciteits3(6)=TotcapWallonies3*Verliezenonshore;
TotaleReeleCapaciteits3(7)=TotcapOffshores3*Verliezenoffshore;
TotaleReeleCapaciteits3(8)=sum(TotaleReeleCapaciteits3(1:7));
TotaleReeleCapaciteits3=TotaleReeleCapaciteits3';

TotaleReeleCapaciteit(:,1)=TotaleReeleCapaciteits1;
TotaleReeleCapaciteit(:,2)=TotaleReeleCapaciteits2;
TotaleReeleCapaciteit(:,3)=TotaleReeleCapaciteits3;

%%
TotaleReeleCapaciteitMW=TotaleReeleCapaciteit/1000000;
%% export naar excel
filename = 'Reelecap.xlsx';
writematrix(TotaleReeleCapaciteitMW,filename,'Sheet',1)
%% Jaarlijkse opgewekte elektriciteit per windturbine
Donshore=135;
Doffshore=150;
honshore=130;
hoffshore=114;
alphaonshore=0.20;
alphaoffshore=0.10;
ElectricityAntwerpen_WT=electricity(v_Antwerpen,Donshore, honshore,alphaonshore,ad_Antwerpen);
ElectricityWestVlaanderen_WT=electricity(v_WestVlaanderen,Donshore, honshore,alphaonshore,ad_WestVlaanderen);
ElectricityOostVlaanderen_WT=electricity(v_OostVlaanderen,Donshore, honshore,alphaonshore,ad_OostVlaanderen);
ElectricityLimburg_WT=electricity(v_Limburg,Donshore, honshore,alphaonshore,ad_Limburg);
ElectricityVlaamsBrabant_WT=electricity(v_VlaamsBrabant,Donshore, honshore,alphaonshore,ad_VlaamsBrabant);
ElectricityWallonie_WT=electricity(v_Wallonie,Donshore, honshore,alphaonshore,ad_Wallonie);
ElectricityOffshore_WT=electricity(v_Offshore,Doffshore, hoffshore,alphaoffshore,ad_Offshore);

%% Jaarlijkse opgewekte elektriciteit per windturbine met verliezen
Verliezenonshore=0.248;
Verliezenoffshore=0.243;
RealElectricityAntwerpen_WT=ElectricityAntwerpen_WT*Verliezenonshore;
RealElectricityWestVlaanderen_WT=ElectricityWestVlaanderen_WT*Verliezenonshore;
RealElectricityOostVlaanderen_WT=ElectricityOostVlaanderen_WT*Verliezenonshore;
RealElectricityLimburg_WT=ElectricityLimburg_WT*Verliezenonshore;
RealElectricityVlaamsBrabant_WT=ElectricityVlaamsBrabant_WT*Verliezenonshore;
RealElectricityWallonie_WT=ElectricityWallonie_WT*Verliezenonshore;
RealElectricityOffshore_WT=ElectricityOffshore_WT*Verliezenoffshore;
%output tabel
RealElectricity_WT(1)=RealElectricityAntwerpen_WT;
RealElectricity_WT(2)=RealElectricityWestVlaanderen_WT;
RealElectricity_WT(3)=RealElectricityOostVlaanderen_WT;
RealElectricity_WT(4)=RealElectricityLimburg_WT;
RealElectricity_WT(5)=RealElectricityVlaamsBrabant_WT;
RealElectricity_WT(6)=RealElectricityWallonie_WT;
RealElectricity_WT(7)=RealElectricityOffshore_WT;
RealElectricity_WTMW=RealElectricity_WT/1000000;
%% export naar excel
filename = 'Reelen_WT.xlsx';
writematrix(RealElectricity_WTMW,filename,'Sheet',1)

%% jaarlijkse opgewekte energie in totaal
%situatie 1
AntwerpenWTs1=Situatie1(1);
WestVlaanderenWTs1=Situatie1(2);
OostVlaanderenWTs1=Situatie1(3);
LimburgWTs1=Situatie1(4);
VlaamsBrabantWTs1=Situatie1(5);
WallonieWTs1=Situatie1(6);
OffshoreWTs1=Situatie1(7);
TotenAntwerpens1=AntwerpenWTs1*ElectricityAntwerpen_WT;
TotenWestVlaanderens1=WestVlaanderenWTs1*ElectricityWestVlaanderen_WT;
TotenOostVlaanderens1=OostVlaanderenWTs1*ElectricityOostVlaanderen_WT;
TotenLimburgs1=LimburgWTs1*ElectricityLimburg_WT;
TotenVlaamsBrabants1=VlaamsBrabantWTs1*ElectricityVlaamsBrabant_WT;
TotenWallonies1=WallonieWTs1*ElectricityWallonie_WT;
TotenOffshores1=OffshoreWTs1*ElectricityOffshore_WT;
TotenBelgies1=TotenAntwerpens1+TotenWestVlaanderens1+TotenOostVlaanderens1+TotenLimburgs1+TotenVlaamsBrabants1+TotenWallonies1+TotenOffshores1;
% output tabel
TotaleEnergies1(1)=TotenAntwerpens1;
TotaleEnergies1(2)=TotenWestVlaanderens1;
TotaleEnergies1(3)=TotenOostVlaanderens1;
TotaleEnergies1(4)=TotenLimburgs1;
TotaleEnergies1(5)=TotenVlaamsBrabants1;
TotaleEnergies1(6)=TotenWallonies1;
TotaleEnergies1(7)=TotenOffshores1;
TotaleEnergies1(8)=TotenBelgies1;
TotaleEnergies1=TotaleEnergies1';

%situatie 2
AntwerpenWTs2=Situatie2(1);
WestVlaanderenWTs2=Situatie2(2);
OostVlaanderenWTs2=Situatie2(3);
LimburgWTs2=Situatie2(4);
VlaamsBrabantWTs2=Situatie2(5);
WallonieWTs2=Situatie2(6);
OffshoreWTs2=Situatie2(7);
TotenAntwerpens2=AntwerpenWTs2*ElectricityAntwerpen_WT;
TotenWestVlaanderens2=WestVlaanderenWTs2*ElectricityWestVlaanderen_WT;
TotenOostVlaanderens2=OostVlaanderenWTs2*ElectricityOostVlaanderen_WT;
TotenLimburgs2=LimburgWTs2*ElectricityLimburg_WT;
TotenVlaamsBrabants2=VlaamsBrabantWTs2*ElectricityVlaamsBrabant_WT;
TotenWallonies2=WallonieWTs2*ElectricityWallonie_WT;
TotenOffshores2=OffshoreWTs2*ElectricityOffshore_WT;
TotenBelgies2=TotenAntwerpens2+TotenWestVlaanderens2+TotenOostVlaanderens2+TotenLimburgs2+TotenVlaamsBrabants2+TotenWallonies2+TotenOffshores2;
% output tabel
TotaleEnergies2(1)=TotenAntwerpens2;
TotaleEnergies2(2)=TotenWestVlaanderens2;
TotaleEnergies2(3)=TotenOostVlaanderens2;
TotaleEnergies2(4)=TotenLimburgs2;
TotaleEnergies2(5)=TotenVlaamsBrabants2;
TotaleEnergies2(6)=TotenWallonies2;
TotaleEnergies2(7)=TotenOffshores2;
TotaleEnergies2(8)=TotenBelgies2;
TotaleEnergies2=TotaleEnergies2';

%situatie 3
AntwerpenWTs3=Situatie3(1);
WestVlaanderenWTs3=Situatie3(2);
OostVlaanderenWTs3=Situatie3(3);
LimburgWTs3=Situatie3(4);
VlaamsBrabantWTs3=Situatie3(5);
WallonieWTs3=Situatie3(6);
OffshoreWTs3=Situatie3(7);
TotenAntwerpens3=AntwerpenWTs3*ElectricityAntwerpen_WT;
TotenWestVlaanderens3=WestVlaanderenWTs3*ElectricityWestVlaanderen_WT;
TotenOostVlaanderens3=OostVlaanderenWTs3*ElectricityOostVlaanderen_WT;
TotenLimburgs3=LimburgWTs3*ElectricityLimburg_WT;
TotenVlaamsBrabants3=VlaamsBrabantWTs3*ElectricityVlaamsBrabant_WT;
TotenWallonies3=WallonieWTs3*ElectricityWallonie_WT;
TotenOffshores3=OffshoreWTs3*ElectricityOffshore_WT;
TotenBelgies3=TotenAntwerpens3+TotenWestVlaanderens3+TotenOostVlaanderens3+TotenLimburgs3+TotenVlaamsBrabants3+TotenWallonies3+TotenOffshores3;
% output tabel
TotaleEnergies3(1)=TotenAntwerpens3;
TotaleEnergies3(2)=TotenWestVlaanderens3;
TotaleEnergies3(3)=TotenOostVlaanderens3;
TotaleEnergies3(4)=TotenLimburgs3;
TotaleEnergies3(5)=TotenVlaamsBrabants3;
TotaleEnergies3(6)=TotenWallonies3;
TotaleEnergies3(7)=TotenOffshores3;
TotaleEnergies3(8)=TotenBelgies3;
TotaleEnergies3=TotaleEnergies3';

TotaleEnergie(:,1)=TotaleEnergies1;
TotaleEnergie(:,2)=TotaleEnergies2;
TotaleEnergie(:,3)=TotaleEnergies3;

%% Jaarlijkse opgewekte energie met verliezen

Verliezenonshore=0.248;
Verliezenoffshore=0.243;

% situatie 1
TotaleReeleEnergies1(1)=TotenAntwerpens1*Verliezenonshore;
TotaleReeleEnergies1(2)=TotenWestVlaanderens1*Verliezenonshore;
TotaleReeleEnergies1(3)=TotenOostVlaanderens1*Verliezenonshore;
TotaleReeleEnergies1(4)=TotenLimburgs1*Verliezenonshore;
TotaleReeleEnergies1(5)=TotenVlaamsBrabants1*Verliezenonshore;
TotaleReeleEnergies1(6)=TotenWallonies1*Verliezenonshore;
TotaleReeleEnergies1(7)=TotenOffshores1*Verliezenoffshore;
TotaleReeleEnergies1(8)=sum(TotaleReeleEnergies1(1:7));
TotaleReeleEnergies1=TotaleReeleEnergies1';

% situatie 3
TotaleReeleEnergies2(1)=TotenAntwerpens2*Verliezenonshore;
TotaleReeleEnergies2(2)=TotenWestVlaanderens2*Verliezenonshore;
TotaleReeleEnergies2(3)=TotenOostVlaanderens2*Verliezenonshore;
TotaleReeleEnergies2(4)=TotenLimburgs2*Verliezenonshore;
TotaleReeleEnergies2(5)=TotenVlaamsBrabants2*Verliezenonshore;
TotaleReeleEnergies2(6)=TotenWallonies2*Verliezenonshore;
TotaleReeleEnergies2(7)=TotenOffshores2*Verliezenoffshore;
TotaleReeleEnergies2(8)=sum(TotaleReeleEnergies2(1:7));
TotaleReeleEnergies2=TotaleReeleEnergies2';

% situatie 3
TotaleReeleEnergies3(1)=TotenAntwerpens3*Verliezenonshore;
TotaleReeleEnergies3(2)=TotenWestVlaanderens3*Verliezenonshore;
TotaleReeleEnergies3(3)=TotenOostVlaanderens3*Verliezenonshore;
TotaleReeleEnergies3(4)=TotenLimburgs3*Verliezenonshore;
TotaleReeleEnergies3(5)=TotenVlaamsBrabants3*Verliezenonshore;
TotaleReeleEnergies3(6)=TotenWallonies3*Verliezenonshore;
TotaleReeleEnergies3(7)=TotenOffshores3*Verliezenoffshore;
TotaleReeleEnergies3(8)=sum(TotaleReeleEnergies3(1:7));
TotaleReeleEnergies3=TotaleReeleEnergies3';

TotaleReeleEnergie(:,1)=TotaleReeleEnergies1;
TotaleReeleEnergie(:,2)=TotaleReeleEnergies2;
TotaleReeleEnergie(:,3)=TotaleReeleEnergies3;
%%
TotaleReeleEnergieMW=TotaleReeleEnergie/1000000;
%%
filename = 'Reeleen.xlsx';
writematrix(TotaleReeleEnergieMW,filename,'Sheet',1)
%% opgewekte elektriciteit elk uur
ElectricityAntwerpen_WT_h=electricity_h(v_Antwerpen,Donshore, honshore,alphaonshore,ad_Antwerpen);
ElectricityWestVlaanderen_WT_h=electricity_h(v_WestVlaanderen,Donshore, honshore,alphaonshore,ad_WestVlaanderen);
ElectricityOostVlaanderen_WT_h=electricity_h(v_OostVlaanderen,Donshore, honshore,alphaonshore,ad_OostVlaanderen);
ElectricityLimburg_WT_h=electricity_h(v_Limburg,Donshore, honshore,alphaonshore,ad_Limburg);
ElectricityVlaamsBrabant_WT_h=electricity_h(v_VlaamsBrabant,Donshore, honshore,alphaonshore,ad_VlaamsBrabant);
ElectricityWallonie_WT_h=electricity_h(v_Wallonie,Donshore, honshore,alphaonshore,ad_Wallonie);
ElectricityOffshore_WT_h=electricity_h(v_Offshore,Doffshore, hoffshore,alphaoffshore,ad_Offshore);
%% opgewekte electricteit per uur in totaal met verliezen

Verliezenonshore=0.248;
Verliezenoffshore=0.243;

%situatie 1

AntwerpenWTs1=Situatie1(1);
WestVlaanderenWTs1=Situatie1(2);
OostVlaanderenWTs1=Situatie1(3);
LimburgWTs1=Situatie1(4);
VlaamsBrabantWTs1=Situatie1(5);
WallonieWTs1=Situatie1(6);
OffshoreWTs1=Situatie1(7);
TotenhAntwerpens1=AntwerpenWTs1*ElectricityAntwerpen_WT_h*Verliezenonshore;
TotenhWestVlaanderens1=WestVlaanderenWTs1*ElectricityWestVlaanderen_WT_h*Verliezenonshore;
TotenhOostVlaanderens1=OostVlaanderenWTs1*ElectricityOostVlaanderen_WT_h*Verliezenonshore;
TotenhLimburgs1=LimburgWTs1*ElectricityLimburg_WT_h*Verliezenonshore;
TotenhVlaamsBrabants1=VlaamsBrabantWTs1*ElectricityVlaamsBrabant_WT_h*Verliezenonshore;
TotenhWallonies1=WallonieWTs1*ElectricityWallonie_WT_h*Verliezenonshore;
TotenhOffshores1=OffshoreWTs1*ElectricityOffshore_WT_h*Verliezenoffshore;
TotenhBelgies1=TotenhAntwerpens1+TotenhWestVlaanderens1+TotenhOostVlaanderens1+TotenhLimburgs1+TotenhVlaamsBrabants1+TotenhWallonies1+TotenhOffshores1;
%situatie 2

AntwerpenWTs2=Situatie2(1);
WestVlaanderenWTs2=Situatie2(2);
OostVlaanderenWTs2=Situatie2(3);
LimburgWTs2=Situatie2(4);
VlaamsBrabantWTs2=Situatie2(5);
WallonieWTs2=Situatie2(6);
OffshoreWTs2=Situatie2(7);
TotenhAntwerpens2=AntwerpenWTs2*ElectricityAntwerpen_WT_h*Verliezenonshore;
TotenhWestVlaanderens2=WestVlaanderenWTs2*ElectricityWestVlaanderen_WT_h*Verliezenonshore;
TotenhOostVlaanderens2=OostVlaanderenWTs2*ElectricityOostVlaanderen_WT_h*Verliezenonshore;
TotenhLimburgs2=LimburgWTs2*ElectricityLimburg_WT_h*Verliezenonshore;
TotenhVlaamsBrabants2=VlaamsBrabantWTs2*ElectricityVlaamsBrabant_WT_h*Verliezenonshore;
TotenhWallonies2=WallonieWTs2*ElectricityWallonie_WT_h*Verliezenonshore;
TotenhOffshores2=OffshoreWTs2*ElectricityOffshore_WT_h*Verliezenoffshore;
TotenhBelgies2=TotenhAntwerpens2+TotenhWestVlaanderens2+TotenhOostVlaanderens2+TotenhLimburgs2+TotenhVlaamsBrabants2+TotenhWallonies2+TotenhOffshores2;
%situatie 3
AntwerpenWTs3=Situatie3(1);
WestVlaanderenWTs3=Situatie3(2);
OostVlaanderenWTs3=Situatie3(3);
LimburgWTs3=Situatie3(4);
VlaamsBrabantWTs3=Situatie3(5);
WallonieWTs3=Situatie3(6);
OffshoreWTs3=Situatie3(7);
TotenhAntwerpens3=AntwerpenWTs3*ElectricityAntwerpen_WT_h*Verliezenonshore;
TotenhWestVlaanderens3=WestVlaanderenWTs3*ElectricityWestVlaanderen_WT_h*Verliezenonshore;
TotenhOostVlaanderens3=OostVlaanderenWTs3*ElectricityOostVlaanderen_WT_h*Verliezenonshore;
TotenhLimburgs3=LimburgWTs3*ElectricityLimburg_WT_h*Verliezenonshore;
TotenhVlaamsBrabants3=VlaamsBrabantWTs3*ElectricityVlaamsBrabant_WT_h*Verliezenonshore;
TotenhWallonies3=WallonieWTs3*ElectricityWallonie_WT_h*Verliezenonshore;
TotenhOffshores3=OffshoreWTs3*ElectricityOffshore_WT_h*Verliezenoffshore;
TotenhBelgies3=TotenhAntwerpens3+TotenhWestVlaanderens3+TotenhOostVlaanderens3+TotenhLimburgs3+TotenhVlaamsBrabants3+TotenhWallonies3+TotenhOffshores3;




%% Vraag naar elektriciteit opgevangen door kernenergie
% vraag naar elektriciteit maal percentage nuclear --> 0.3933
Vraagkernenergie=Eliax*0.3933;

%% vergelijking productie windenergie voor opvangen vraag naar kernenergie situatie 1
plot(Vraagkernenergie,'r')
hold on
plot(TotenhBelgies1,'c')
hold off

Verschil_s1=TotenhBelgies1-Vraagkernenergie;
sign_s1=sign(Verschil_s1);
negativehs1=sum(sign_s1(:)==-1);
percentage_onvoldoende_s1=negativehs1/8760;

%% vergelijking productie windenergie voor opvangen vraag naar kernenergie situatie 2
plot(Vraagkernenergie,'r')
hold on
plot(TotenhBelgies2,'c')
hold off

Verschil_s2=TotenhBelgies2-Vraagkernenergie;
sign_s2=sign(Verschil_s2);
negativehs2=sum(sign_s2(:)==-1);
percentage_onvoldoende_s2=negativehs2/8760;

%% vergelijking productie windenergie voor opvangen vraag naar kernenergie situatie 3
plot(Vraagkernenergie,'r')
hold on
plot(TotenhBelgies3,'c')
hold off

Verschil_s3=TotenhBelgies3-Vraagkernenergie;
sign_s3=sign(Verschil_s3);
negativehs3=sum(sign_s3(:)==-1);
percentage_onvoldoende_s3=negativehs3/8760;






