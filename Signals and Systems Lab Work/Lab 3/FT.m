function output=FT(input)
M=length(input);
t=exp(j*pi*(M-1)/M*[0:1:M-1]);

output=exp(-j*pi*(M-1)^2/(2*M))*t.*1/(M)^0.5.*fft(input.*t);
output = output';