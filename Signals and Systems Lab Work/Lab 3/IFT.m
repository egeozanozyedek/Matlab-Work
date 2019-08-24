function output=IFT(input)
M = length(input);

t=exp(-j*pi*(M-1)/M*[0:1:M-1]);
output=real(exp(j*pi*(M-1)^2/(2*M))*t.*(M)^0.5.*ifft(input.*t));
output = output';
