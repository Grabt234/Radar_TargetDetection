%% BARTONS METHOD PARAMETERS

%probability of false alarm
pfa = 0.5e-1;

%probability of detection
pd = 0.8;

%coherently integrated pulses
Nt = 100;

%% MIN SNR FOR SINGLE PULSE

min_snr = snr_min(pfa,pd);

%% GAIN DUE TO INTEGRATION

int_gain = 10*log10(Nt);

%% LOSS DUE TO NON-COHERENT INTEGRATION

nc_loss = 0;

%% LOSS DUE TO FLUCTUATIONS

lf0 = min_snr - 