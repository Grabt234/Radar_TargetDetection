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

%% DEFENITIONS

%array of detection probabilities
D_lower = 0.8; 
D_upper = 0.95;
samples = 15;
D_step = (D_upper - D_lower)/samples;
%array of detection probabilities over 1 scan
D = D_lower:D_step:D_upper;

%number of transmitted pulses
Nt = 100;

%probability of false alarm over one dwell (across all pulses)
PFA = 10e-4;

%symbolic variables for binomial solver
syms pfal ii na

%array of the number of alarmed pulses
Na_all = Nt*D;

%defining symbolic varibales for the analytic solver
syms pfal na


%% SOLVING BINOMIAL

%The number of ways one can choose ii from Nt pulses
f = nchoosek(Nt,na);

%summand of the binomial distribution
summand = f*(pfal)^(na)*(1-pfal)^(Nt-na);

%preallocating memory for storing individual pulse pfa's
pfa_pulse = zeros(1,samples);

%should run for every detection case
for n = 1:numel(Na_all)
    
    %number of alarmed pulses
    Na = Na_all(n);
    
    %summing from Na -> Nt, with na being variable that changes
    eqn = (symsum( summand ,na ,Na,Nt) == 10^(-6) ) ;
    
    %analytically solving for particular case 
    pfa_pulse(1,n) = vpasolve(eqn,pfal, [0,1]);

end

pfa_pulse


