% 21048: General Physics
% Solution of EfolioB
% 2100455 - Hugo Silva

clc;      %clear terminal
close all; %close open graph windows

%Creation of variables
p=1.28; %air density - value given in the statement
cd=0.1; %aerodynamic coefficient - value given in the statement
a=pi*(0.3^2); %Frontal area of the sphere - value given in the statement - radius rounded to meters to be in international units
l=1; %length of the string - value given in the statement
m=0.0026; %mass of the object - value given in the statement - value rounded to kg to be in international units
b=0.5*(p*cd*a); %drag coefficient - formula given in the statement
i=0; %initialization of the variable that will serve as a counter and index for performing the calculations
g=9.8; %gravity value
h=0.1; %step - value given in the statement

%Definition of formulas
angle(1)=0.05; %Creation of angle vector to store angle values up to 100s. 2 - initially, the angle was 0.05 rad (angle(1)=0.05)
velocity(1)=0; %Creation of velocity vector to store angular velocity values up to 100s. 2 - initially, the velocity was 0 rad/s (velocity(1)=0)
k1x=velocity(i+1);  %Creation of the variable k1x to store the respective value up to 100s. 2 - it always has the same value as the angular velocity at that instant.
k1v=-(sign(velocity(i+1)))*((b*l)/m)*(velocity(i+1)^2)-(g/l)*angle(i+1); %Creation of the variable k1v to store the respective value up to 100s. 2 - it has the value given by the differential equation in the statement
k2x=velocity(i+1)+k1v*h; %Creation of the variable k2x to store the respective value up to 100s.
k2v=-sign(velocity(i+1)+k1v*h)*((b*l)/m)*((velocity(i+1)+k1v*h)^2)-((g/l)*angle(i+1)+k1x*h); %Creation of the variable k2v to store the respective value up to 100s.

%note: the index value is (i+1) because vectors in Octave only start at index 1, which did not allow me to start the loop as intended.

%printing the table and reproducing the graph
printf(" t  angle   velocity    k1x       k1v       k2x       k2v\n"); %printing the table header
printf(" %d    %d       %d          %d       %d     %d   %d\n",i/10, angle(i+1), velocity(i+1),k1x,k1v,k2x,k2v); %printing the first line of the table. It had to be done separately due to the initial values given in the statement

hold on; %configurations to display subsequent commands on a single graph
grid; %activate grid for table
title('Heun Integration - Real Pendulum with Drag'); %graph title
axis([0, 100, -0.14, 0.14]); %definition of graph limits from 0 to 100 seconds (x) and between -0.25 and 0.25 radians (y).
%axis([0, 100, -0.055, 0.055]); configuration to obtain the angle graph

for i=1:1000 %initialization of the loop from i = 1 (since zero was used in the first line of the table) to i=1000 (100 seconds)
angle(i+1)=angle(i)+0.5*(k1x+k2x)*h; %assigning the angle value. formula given on page 16 of the support book
velocity(i+1)=velocity(i)+0.5*(k1v+k2v)*h; %assigning the velocity value. formula given on page 16 of the support text
k1x=velocity(i+1); %k1x has the same value as the velocity of that same line
k1v=(-sign(velocity(i+1)))*((b*l)/m)*(velocity(i+1)^2)-(g/l)*angle(i+1); %assigning the value of k1v. formula given on page 16 of the support text
k2x=velocity(i+1)+(k1v*h); %assigning k2x. formula given on page 16 of the support book
k2v=-sign(velocity(i+1)+(k1v*h))*((b*l)/m)*((velocity(i+1)+(k1v*h))^2)-(g/l)*(angle(i+1)+(k1x*h)); %assigning k2v. formula given on page 16 of the support text
printf("%d %d %d %d %d %d %d\n",i/10, angle(i+1), velocity(i+1),k1x,k1v,k2x,k2v); %printing the table with all values

endfor %end of loop

r=0:0.1:100; %variable r from 0 to 100 with step 0.1
y=0:1:1000; %variable y from 0 to 1000 with step 1

plot(r,angle(y+1),'red'); %displaying the graph of the angle value
plot(r,velocity(y+1),'blue'); %displaying the graph of the velocity value
legend("angle (rads)","velocity (rads/s)"); %displaying the graph legend


