function p=generateInterp(type, Ts, dur) 
    t=-dur/2:Ts/1000:dur/2-Ts/1000; 
    p=zeros(1,length(t)); 
    if type==0 
        p(t>=-Ts/2 & t<=Ts/2)=1; 
    elseif type==1 
          p(t>=-Ts & t<=Ts)=1-abs(t(t>=-Ts & t<=Ts))/Ts;  
    elseif type==2 
        p=sin(pi*t/Ts)./(pi*t/Ts); 
        p(t==0)=1; 
    end 
end 