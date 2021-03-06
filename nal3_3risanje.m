B1=[-2/3,-4/5;1/3,1/5;0,0;-1/3,1/5;2/3,-4/5];
t1=linspace(0,1);

n=size(B1,1)-1;
dim=size(B1,2);

%plotbezier(B1,t1);

%----------------------------------------------------------
%konstrukcija x in y-koordinat odvodov:
r1=1;
odv_b1=bezierder(B1,r1,t1); %prvi odvod, to�ke na krivulji
x1=odv_b1(:,1); %x-koordinate to�k na krivulji
y1=odv_b1(:,2);
%plot(x1,y1);

r2=2;
odv_b2=bezierder(B1,r2,t1); %drugi odvod, to�ke na krivulji
x2=odv_b2(:,1);
y2=odv_b2(:,2);
%plot(x2,y2)

%---------------------------------------------------------
%konstrukcija kontrolnih poligonov odvodov:
a1=[0,0];
dif_x1=factorial(n)/factorial(n-r1)*diff(B1(:,1),1)+a1(1); %x-koord. kontrolnih to�k za prvi odvod
dif_y1=factorial(n)/factorial(n-r1)*diff(B1(:,2),1)+a1(2); %ali se a tudi mno�i z n??

dif_x2=factorial(n)/factorial(n-r2)*diff(B1(:,1),2)+a1(1); %x-koord. kontrolnih to�k za drugi odvod
dif_y2=factorial(n)/factorial(n-r2)*diff(B1(:,2),2)+a1(2); %to sta stolpca

%----------------------------------------------------------
%preverjanje enakosti metod
bez_odv1=bezier([dif_x1,dif_y1],t1);
%plotbezier(Bodv1,t1,1)
%pause
bez_odv2=bezier([dif_x2,dif_y2],t1);
%plotbezier(Bodv2,t1,1)

%pause

%----------------------------------------------------------

plotbezier(B1,t1,1)
hold on
priparametru=bezier(B1,1/2);
scatter(priparametru(1),priparametru(2),'filled','g')
hold off

pause

plot(x1,y1)
hold on
plot(dif_x1,dif_y1,'-')
hold on
scatter(dif_x1,dif_y1,'filled')
% hold on 
% plotbezier(Bodv1,t1,1)
hold on
priparametru=bezierder(B1,1,1/2);
scatter(priparametru(1),priparametru(2),'filled','g')
hold off

pause

plot(x2,y2)
hold on
plot(dif_x2,dif_y2,'-')
hold on
scatter(dif_x2,dif_y2,'filled')
% hold on
% plotbezier(Bodv2,t1,1)
hold on
priparametru=bezierder(B1,2,1/2);
scatter(priparametru(1),priparametru(2),'filled','g')
hold off 

%------------------------------------------------
BB1=[0,0;0,2;8,2;4,0];
tt1=1/4;
aa1=bezierder(BB1,1,tt1);

%risanje grafov:
% figure
% subplot(2,3,1)       % 1. graf v polju z 2 vrsticama in 3 stolpci
% plotbezier(B1,t1,1)
% title('krivulja')
% 
% subplot(2,3,2)       
% plot(x1,y1)
% hold on
% plot(dif_x1,dif_y1,'-')
% hold on
% scatter(dif_x1,dif_y1,'filled')
% hold off
% title('prvi odvod krivulje') %kako se ra�una poligon odvoda???
% 
% subplot(2,3,3)       
% plot(x2,y2)
% hold on
% plot(dif_x2,dif_y2,'-')
% hold on
% scatter(dif_x2,dif_y2,'filled')
% hold off
% title('drugi odvod krivulje')
