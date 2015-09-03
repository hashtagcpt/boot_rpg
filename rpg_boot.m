% read in toy data for 2013-2015 (to Sept-1-2015)
d = csvread('rpg_toy_data.csv');

nteams = 15; % how get a sample of 15 teams from the data

% set up dummy vars
rpg_mean = [];
rpg_std = [];

rng(00); % set the random number generator to a constant for demonstration
% bootstrap 999 (magic bootstrapping number) samples of 15 teams with replacement
for nsamples = 1:999
    % get sample
    samp = ceil(rand(nteams,1).*(length(d)-1))'; % can be done more elegantly with sample f
    % calculate the mean of the sample
    rpg_mean(nsamples) = mean(d(samp));
    % calculate the std of the sample
    rpg_std(nsamples) = std(d(samp));
end

% get mean and standard deviation of bootstrap samples
boot_rpg_mean = mean(rpg_mean)
boot_rpg_std = std(rpg_std)

