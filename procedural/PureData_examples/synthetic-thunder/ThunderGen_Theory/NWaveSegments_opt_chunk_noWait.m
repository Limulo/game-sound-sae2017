function out = NWaveSegments_opt_chunk_noWait(numSegs,segLength,xDistance,maxAmp,minAngle,maxAngle,attenuation,stretching);
%Generate a thunder signature
%INPUTS:
%numSegs: number of lightning segments
%segLength: length of each segment (m)
%xDistance: horizontal distance to observer (m)
%maxAmp: maximum amplitude (arbitrary, since amplitude is normalized in this version)
%minAngle: minimum allowable N-wave angle (degrees)
%maxAngle: maximum allowable N-wave angle (degrees)
%attenuation: attenuation per km (arbitrary in current version, the amp. is normalized anyways)
%stretching: duration stretch per km (percentage per km -- this is also arbitrary at the moment)
%soundLength: duration of the sound file (s)

%NOTE: The amplitude should be based on the energy per meter of the lightning strike (not yet implemented) 
%   and should be normalized to decibels
%ALSO: The shape of the lightning is only approximated as a vertical line right now, with randomized angles for each segment
%   but without proper "linking" of the segments together (ie. x values are shared and there is no loss of
%   height due to the angle of the segment.

%uses midpoint of each segment for parameter calculations
l = segLength/2;

%speed of sound
c = 344;

%randomize the angle of each segment
angle = pi/180*abs(rand(1,numSegs)*(maxAngle-minAngle) + minAngle);

disp('Calculating time-invariant parameters...'); %DEBUG

for i = 1:numSegs
   %calculate the distance from observer of each segment
   r(i) = sqrt(xDistance^2 + (segLength*i-l)^2);
   
   %compute time taken to reach observer
   timeToObserver(i) = r(i)/c;
   
   %compute the amplitudes and wave durations of each segment (at the observer's position)
   %amplitude(i) = maxAmp - attenuation*r(i)/1000; %linear decay over distance (unrealistic)
   %amplitude(i) = maxAmp*(1 - r(i)*attenuation/1000); %percentage decay over distance (slightly more realistic)
   amplitude(i) = 1; %DEBUG -- amplitude doesn't affect anything at this time due to normalization of results
   duration(i) = (l/c)*(1+(stretching/1000)*r(i)); %wave will stretch out over distance
   
   %compute partial-solution parameters for each segment
   B(i) = (amplitude(i)*l^2)/(2*r(i)*c*duration(i));
   Phi(i) = c*duration(i)/l;
   absSine = abs(sin(angle(i)));
   
   %compute the zero-crossings of each wave
   %start with the coefficients of the quadratic formula
   %positive pulse...
   A = -(c^2)/(l^2);
   C = (2*c/l)*(r(i)/l - absSine);
   D = Phi(i)^2 - (r(i)^2)/(l^2) + (2*r(i)*absSine)/l - absSine^2;
   %negative pulse...
   E = A;
   F = (2*c/l)*(r(i)/l + absSine);
   G = Phi(i)^2 - (r(i)^2)/(l^2) - (2*r(i)*absSine)/l - absSine^2;
   
   %then calculate the zero-crossings of each pulse using the quadratic formula
   zeroCross(i,1) = (-C + sqrt(C^2 - 4*A*D))/(2*A);
   zeroCross(i,2) = (-C - sqrt(C^2 - 4*A*D))/(2*A);
   zeroCross(i,3) = (-F + sqrt(F^2 - 4*E*G))/(2*E);
   zeroCross(i,4) = (-F - sqrt(F^2 - 4*E*G))/(2*E);
end %i

%sort the zero crossings to make sure they are ascending
zeroCross = sortrows(zeroCross);

%start point of file will be first zero crossing
soundStart = round(min(min(zeroCross)) * 44100 - 0.5);
%end point of file will be last zero crossing
soundEnd = round(max(max(zeroCross)) * 44100 + 0.5);
soundLength = soundEnd - soundStart; %length of sound file, in samples

disp('Computing thunder signature...'); %DEBUG

%compute the thunder signature in chunks
chunks = [];
chunkSize = 0.05; %(seconds)
chunkSamps = chunkSize * 44100;
numChunks = round(soundLength/chunkSamps - 0.5) + 1;

for k = 1:numChunks
	for j = 1:chunkSamps
        
        %init the sample value to 0
        thunder(j) = 0;
        
        %Increment time variable with offset for chunk and for starting time
        t = (j-1+soundStart)/(44100) + (k-1)*chunkSize;

        %Calculate the current sample for each component pulse wave
        for i = 1:numSegs
            %Only calculate the current NWave if there is significant data at this sample
            if (((t > zeroCross(i,1)) & (t < zeroCross(i,2))) | ((t > zeroCross(i,3)) & (t < zeroCross(i,4))))             
                segPoints(i) = NWavePoint(t,c,l,r(i),Phi(i),B(i),angle(i));
                thunder(j) = thunder(j) + segPoints(i);
            else
                segPoints(i) = 0;
            end %if
        end %i
	end %j
    disp([num2str(round(100*k/numChunks)) '% complete']); %DEBUG
    
    %append current results to total file
    chunks = [chunks thunder];
end %k

disp('Complete!'); %DEBUG

%normalize and output
out = chunks/abs(max(chunks));