function b = power2bernstein(p)
% Opis: 
% power2bernstein pretvori polinom, predstavljen s 
% koeficienti v poten�ni bazi, v polinom, predstavljen 
% v Bernsteinovi bazi 
% 
% Definicija: 
% b = power2bernstein(p) 
% 
% Vhodni podatek: 
% p seznam koeficientov dol�ine n+1, ki po vrsti 
% pripadajo razvoju polinoma stopnje n v poten�ni 
% bazi od x^n do 1 
% 
% Izhodni podatek: 
% b seznam koeficientov dol�ine n+1, ki po vrsti 
% pripadajo razvoju polinoma stopnje n v Bernsteinovi 
% bazi od 0-tega do n-tega Bernsteinovega baznega 
% polinoma

n = length(p)-1; %stopnja polinoma
b=zeros(1,n+1);
p=fliplr(p); 
for i=1:n+1
    for j=i:n+1 
        b(j)=b(j)+p(i)*nchoosek(j-1,i-1)/nchoosek(n,i-1);
        %imamo i-1, ker je p(i) koeficient pred x^{i-1}
        %imamo j-1, ker v formuli prestavimo indekse j-->j+1, zato gre tudi
        %od i do n+1 in ne od i-1 do n
    end
    
end

if n==0
    b=b(1);
end
end