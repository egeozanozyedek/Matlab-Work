function [h] = createRespose(B , H)

h = zeros(H,H);

    for m = 1:H
        for n = 1:H
            h(m, n) = (B / pi)^2 * sinc((m - ((H - 1) / 2) ) * B / 2) * sinc((n - (H - 1) / 2 ) * B / 2);
        end 
    end
end