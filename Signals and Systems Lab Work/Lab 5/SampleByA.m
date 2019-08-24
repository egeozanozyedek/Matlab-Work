
function [XaZ, XaL, XaI] = SampleByA(X, Ts, a) 

    dur=length(X)*Ts; 
    t=0:Ts/1000:2-Ts/1000; 
    XZ=DtoA(0, Ts, dur, X); 
    XL=DtoA(1, Ts, dur, X); 
    XI=DtoA(2, Ts, dur, X); 
     
    if a>=1 
        newX=X(1:a:length(X)); 
    elseif a>0 & a<1 
        newX(1:1/a:length(X)/a)=X(1:1:length(X)); 
    else 
        newX = linspace(0,0,(length(X)*a)) 
         
    end 
         
    figure(1);     
    
    [num, den] = rat(a * Ts);
    
    stem(linspace(0,2,length(newX)),newX);
    xlabel('t') 
    ylabel('signal sampled with a') 
    title(['Sampled signal by ' num2str(num) '/' num2str(den)]) ;
     
    XaZ =DtoA(0, a*Ts, dur, newX); 
    XaL =DtoA(1, a*Ts, dur, newX); 
    XaI =DtoA(2, a*Ts, dur, newX); 
     
           
    figure(2);
    
    subplot(3,1,1); 
    plot(t,XZ); 
    title('Zero-Hold Interpolation'); 
    xlabel('t'); 
    ylabel('XZ(t)'); 
     
     
    subplot(3,1,2); 
    plot(t,XL); 
    title('Linear Interpolation'); 
    xlabel('t'); 
    ylabel('XL(t)'); 
     
    subplot(3,1,3); 
    plot(t,XI); 
    title('Ideal Interpolation'); 
    xlabel('t'); 
    ylabel('XI(t)'); 
     
    figure(3);
     
    subplot(3,1,1); 
    plot(linspace(0,2,length(XaZ)),XaZ); 
    title(['Zero-Hold Interpolation with sample period ' num2str(num) '/' num2str(den)]); 
    xlabel('t'); 
    ylabel('XaZ(t)'); 
     
    subplot(3,1,2); 
    plot(linspace(0,2,length(XaL)),XaL); 
    title(['Linear Interpolation with sample period ' num2str(num) '/' num2str(den)]); 
    xlabel('t'); 
    ylabel('XaL(t)'); 
     
    subplot(3,1,3); 
    plot(linspace(0,2,length(XaI)),XaI); 
    title(['Ideal Interpolation with sample period ' num2str(num) '/' num2str(den)]); 
    xlabel('t'); 
    ylabel('XaI(t)'); 
     
    

end
