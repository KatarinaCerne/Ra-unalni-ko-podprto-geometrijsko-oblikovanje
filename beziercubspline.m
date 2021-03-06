function B = beziercubspline(u,D)
% Opis:
%   beziercubspline  izra�una  sestavljeno  Bezierjevo  krivuljo
%   stopnje 3, ki je  dvakrat  zvezno  odvedljiva v stikih
%
% Definicija:
%   B = beziercubspline(u,D)
%
% Vhodna  podatka:
%   u...seznam  parametrov  delitve  dol�ine m+1,
%   D...matrika , v kateri  vsaka  izmed m+3  vrstic  predstavlja
%eno  kontrolno  to�ko  sestavljene  krivulje
% Izhodni  podatek:
%   B...seznam  dol�ine m, v kateri  je vsak  element  matrika s
%�tirimi  vrsticami , ki  dolo�ajo  kontrolne  to�ke  kosa
%sestavljene  krivulje

dim = size(D,2);
m=size(u,2)-1;
B = cell(1,m); %vsebovala bo matrike s kontrolnimi 
%to�kami za vsak del krivulje

for i=1:m
   B{i}=zeros(4,dim); %v vsaki matriki 4 to�ke: b0, b1, b2, b3
end

%B{i}(j,:) je (j-2)-ta to�ka na i-tem delu krivulje ?
%to�ke v D grejo od -1 do m+1

%na robu:
B{1}(1,:)=D(1,:); %b_0^(1) = d_{-1}
B{1}(2,:)=D(2,:); %b_1^(1)=d_0
B{m}(4,:)=D(m+3,:); %b_3^(m)=d_{m+1}
B{m}(3,:)=D(m+2,:);%b_2^(m)=d_{m}

difer = diff(u);
%difer(i)=delta u_{i-1}

B{1}(3,:)=(difer(2)/(difer(1)+difer(2))).*D(2,:)+(difer(1)/(difer(1)+difer(2))).*D(3,:);
B{m}(2,:)=(difer(m)/(difer(m-1)+difer(m))).*D(m+1,:)+(difer(m-1)/(difer(m-1)+difer(m))).*D(m+2,:);

for i=1:m-2
   imenovalec = difer(i)+difer(i+1)+difer(i+2);
   B{i+1}(2,:)=((difer(i+1)+difer(i+2))/imenovalec).*D(i+2,:)+(difer(i)/imenovalec).*D(i+3,:);
   B{i+1}(3,:)=(difer(i+2)/imenovalec).*D(i+2,:)+((difer(i)+difer(i+1))/imenovalec).*D(i+3,:);
end

for i=1:m-1
   imenovalec1=difer(i)+difer(i+1);
   B{i}(4,:)=(difer(i+1)/imenovalec1).*B{i}(3,:)+(difer(i)/imenovalec1).*B{i+1}(2,:);
   B{i+1}(1,:)=B{i}(4,:);
end

end