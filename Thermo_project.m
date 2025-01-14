clear all;
clc;

a= Solution('liquidvapor.xml', 'water');

p1= 10E+3;
x1=0;
setState_Psat(a, [p1; x1]);
h1= enthalpy_mass(a);
s1= entropy_mass(a);

s2=s1;
p2= 0.5E+6;
setState_SP(a, [s2; p2]);
h2= enthalpy_mass(a);

p3=p2;
x3=0;
setState_Psat(a, [p3; x3]);
h3= enthalpy_mass(a);
s3= entropy_mass(a);

s4=s3;
p4= 15E+6;
setState_SP(a, [s4; p4]);
h4= enthalpy_mass(a);

p6= 4E+6;
x6=0;
setState_Psat(a, [p6; x6]);
h6= enthalpy_mass(a);
s6= entropy_mass(a);

h5=h6;

s7=s6;
p7=p4;
setState_SP(a, [s7; p7]);
h7= enthalpy_mass(a);

T9= 500+273.15;
p9=p4;
set(a, 'T', T9, 'P', p9);
h9= enthalpy_mass(a);
s9= entropy_mass(a);

s10=s9;
p10= p6;
setState_SP(a, [s10; p10]);
h10= enthalpy_mass(a);

p11=p6;
T11=T9;
set(a, 'T', T11, 'P', p11);
h11= enthalpy_mass(a);
s11= entropy_mass(a);

p12=p2;
s12=s11;
setState_SP(a, [s12; p12]);
h12= enthalpy_mass(a);

p13=p1;
s13=s11;
setState_SP(a, [s13; p13]);
h13= enthalpy_mass(a);
x13=0;
setState_Psat(a, [p13; x13]);
hf13= enthalpy_mass(a);
sf13= entropy_mass(a);
xg13=1;
setState_Psat(a, [p13; xg13]);
hg13= enthalpy_mass(a);
sg13= entropy_mass(a);

y= (h5-h4)/((h10-h6)+(h5-h4));

z= ((1-y)*(h3-h2))/(h12-h2);

h8= (1-y)*h5 + y*h7;

Qin= (h9-h8) + (1-y)*(h11-h10);

Qout= (1-y-z)*(h13-h1);

efficiency= 1-(Qout/Qin);

Quality= (s13 - sf13)/(sg13 - sf13);
