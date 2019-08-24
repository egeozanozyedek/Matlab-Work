function [g] = Gaussian( sig, t0, t)

g = exp(-(t - t0) .^2 ./ (2 .* sig.^2));

plot(t, g);

end