clc
clearvars

%mast properties
L_mast = 80; %(m) lentgh of mast
stiff = 4*1e9; %(N*m^2)
gamma = 0.0005; %(no units) γ - damping ratio

%mass on top of mast properties 
m = 5*1e3; %(Kg)
B = 3; %(m) width 
L_mass = 10; %(m) Length of mass

%wind properties
St = 0.15; % Strouhal number
Clv = 0.3; % vortex shedding force coefficient 
density = 1.225; %(Kg/m^3)

%finding sway stiffnes & natural frequency of whole system, ignoring mass
%of mast
stiff_sway = (3*stiff)/((L_mast)^3); %sway stiffness
f_natural = (1/(2*pi))*sqrt(stiff_sway/m); %%natural frequency
omega_nat = sqrt(stiff_sway/m);

%finding the critical wind speed for vortex induced vibrations of the mast
%( U_crit)
%the critical condition is ofcourse when the system reaches resonanse
%frequency --> when f_natural == f_vortex == (St*U)/B

U_crit = (f_natural*B)/St;

%finding steady state amplitude of vortex induced vibration during U_crit, neglecting any change in the aerodynamic forcing due
%to the motion of the mast
U = U_crit;
P_lv = 0.5*density*(U^2)*B*L_mass*Clv; %across-wind force 

omega = omega_nat; % since at U_crit --> we have hit resonance
trans_fun = 1/(m*sqrt((((omega_nat^2)-(omega^2))^2)+((2*gamma*omega_nat*omega)^2))); %magnitude of transfwe function







