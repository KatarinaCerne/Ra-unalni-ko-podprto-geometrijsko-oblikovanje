B = [1,0; 1,4; -3,2; -3,-2; 1,-4; 1,0];
w = [1, 1/5, 1/5, 1/5, 1/5, 1];
t=linspace(0,1);

B1=B;
w1=w;
for k=1:20
    Aa = rbezierelv(B1,w1);
    B1 = Aa(:,1:end-1);
    w1 = Aa(:,end)';
    plotbezier(B1,t,0);
    hold on
end
% plotbezier(B1,t,0);
% hold on
% Aa = rbezierelv(B1,w1)

r=1;
x=0;
y=0;
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit,'r');

hold off