function b = bezier (B,t)
% Opis :
% bezier vrne to�ke na Bezierjevi krivulji pri danih
% parametrih
%
% Definicija :
% b = bezier (B,t)
%
% Vhodna podatka :
% B     matrika velikosti n+1 x d, ki predstavlja kontrolne
%       to�ke Bezierjeve krivulje stopnje n v
%       d- dimenzionalnem prostoru ,
% t     seznam parametrov dol�ine k, pri katerih ra�unamo
%       vrednost Bezierjeve krivulje
%
% Izhodni podatek :
% b     matrika velikosti k x d, kjer i-ta vrstica
%       predstavlja to�ko na Bezierjevi krivulji pri
%       parametru iz t na i- tem mestu

d=size(B,2);
k=length(t);
b=zeros(k,d);

for i=1:k
    dec_t=t(i); %trenutni parameter t, pri katerem trenutno ra�unamo
    for j=1:d %za vsako koordinato posebej moramo narediti decasteljauja
       dec_b=B(:,j);
       dec_D=decasteljau(dec_b,dec_t); %decasteljaujeva shema za j-to koordinato
       b(i,j)=dec_D(1,end); %vrednost j-te koord. to�ke na B.k.
    end
end

end