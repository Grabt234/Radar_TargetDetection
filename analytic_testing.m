% %% case varibles
% 
D_lower = 0.8; 
D_upper = 0.95;
samples = 15;
D_step = (D_upper - D_lower)/samples;
% 
%array of detection probabilities over 1 scan
D = D_lower:D_step:D_upper
% 
% %converting to number of detected pulses 
% N = 10;
% 
% PFA = 10e-4;
% 
%     
% %% calcs
% %one operates with the simplification: Pfa << 1
% 
% %now one needs to solve for an individual pulses pfs
% 
% syms pfa 
% syms jj
% 
% 
% 
% assume(pfa, 'Real')
% assumeAlso(pfa>0)
% assumeAlso(pfa<0.5)
% assumptions
% 
% i = 1;
% 
% 
% 
% 
% 
% 
% % %% taking pfa and solving for snr of single pulse
% % 
% % pfa_calc = 0.070899420856138395109951223210513;
% % pfa_calc = 0.0001;
% % 
% % %creating detectibility factors
% % size = 10;
% % d = 0.01:0.001:0.999;
% % f= repmat(pfa_calc,1,length(d));
% % 
% % snr_pulse = snr_min(d,f)
% % 
% % %% PLOTTING RESULTS
% % 
% % plot(snr_pulse,d)
% % ylabel("Probability of Detection")
% % xlabel("Signal-to-Noise") %linear or dB?
% 
% 


Nt = 100
Na = 90
syms pfal ii na


Na_all = Nt*D;

%defining symbolic varibales for the analytic solver
syms pfal na

%The number of ways one can choose ii from Nt pulses
f = nchoosek(Nt,na);

%summand of the binomial distribution
summand = f*(pfal)^(na)*(1-pfal)^(Nt-na);

%should run for every detection case

for n = 1:numel(Na_all)
    
    Na = Na_all(n);
    
    %summing from Na -> Nt, with na being variable that changes
    eqn = (symsum( summand ,na ,Na,Nt) == 10^(-6) ) ;
    
    %analytically solving for particular case 
    vpasolve(eqn,pfal, [0,1])

end




