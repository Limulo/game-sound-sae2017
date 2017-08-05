function out = NWavePoint(t,c,l,r,Phi,B,angle);

tau = (c*t-r)/l;

pulsePos = (Phi^2 - (tau + abs(sin(angle)))^2)/abs(sin(angle));
    if (pulsePos <= 0) 
        pulsePos=0; 
    end
    
pulseNeg = (Phi^2 - (tau - abs(sin(angle)))^2)/abs(sin(angle));
    if (pulseNeg <= 0) 
        pulseNeg=0; 
    end

out = B*pulsePos - B*pulseNeg;