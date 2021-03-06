function b = rdecasteljau(B,w,t)
% Opis:
%   rdecasteljau  vrne  to�ko  na  racionalni  Bezierjevi
%   krivulji , ki je  izra�unana z de  Casteljaujevim
%   postopkom , prirejenim  za  racionalni  primer
%
% Definicija:
%   b = rdecasteljau(B,w,t)
%
% Vhodni  podatki:
%   B   matrika , katere  vrstica  predstavlja  koordinate
%   kontrolne  to�ke  racionalne  Bezierjeve  krivulje ,
%   w   seznam  ute�i  racionalne  Bezierjeve  krivulje ,
%   t   �tevilo , ki  dolo�a  vrednost  delilnega  parametra v
%   de  Casteljaujevem  postopku
%
% Izhodni  podatek:
%   b   vrstica , ki  predstavlja  to�ko  na  racionalni
%   Bezierjevi  krivulji  pri  parametru t

dim = size(B,2);
n = size(B,1) -1;

D = cell(n+1,n+1);
W = zeros(n+1,n+1);

for i=1:n+1
    D{i,1}=B(i,:);
    W(i,1)=w(i);
end

for r=2:n+1
    for i=1:n-r+2
        W(i,r)=(1-t)*W(i,r-1)+t*W(i+1,r-1);
        D{i,r}=(1-t)*W(i,r-1)/W(i,r).*D{i,r-1}+t*W(i+1,r-1)/W(i,r).*D{i+1,r-1};
    end
    for i=n-r+3:n+1
       D{i,r}=NaN;
       W(i,r)=NaN;
    end
end

b=D{1,n+1};

end