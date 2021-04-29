clc;
clear all;
close all;

DLT_V = [0.00, 0.01, 0.03, 0.05, 0.07, 0.10];
W_V = [0.0,1.0;
       0.1,0.9;
       0.2,0.8;
       0.3,0.7;
       0.4,0.6;
       0.5,0.5;
       0.6,0.4;
       0.7,0.3;
       0.8,0.2;
       0.9,0.1;
       1.0,0.0];
   
for k = 6 : 6
    delta = DLT_V(k);
    j = 11;
    while j <= 11
        alphaw = W_V(j, 1);
        betaw = W_V(j, 2);
        
        disp("-----------------------------------------");
        disp("delta = " + delta + ", alphaw = " + alphaw + ", betaw = " + betaw);
        
        RI_V = zeros(1, 10);
        FS_V = zeros(1, 10);
        KP_V = zeros(1, 10);
        RT_V = zeros(1, 10);
        
        for i = 1 : 10
            % disp(i + "-th loop start...");
            [EEG, Label_EEG] = shuffle();
            M = create_sim_matrix(EEG);
            y_hat = Label_EEG(:, 1);
            % Spveegc clustering algorithm 
            % clustering result set
            S = ini_s(EEG, Label_EEG, delta);
            % labeled eeg set
            % S(1, 1 : 10) = [14, 22, 56, 94, 126, 153, 171, 209, 228, 264];
            % S(2, 1 : 10) = [266, 241, 203, 188, 170, 150, 120, 90, 51, 20];

            tic;
            [y, S] = spveegc(EEG, 4, S, M, alphaw, betaw);
            run_time = toc;
            RT_V(i) = run_time;
%             disp(i + "-th iterator...");
%             disp("spveegc Completed, runtime = " + run_time + "s!");

            % Result evaluation
            % Rand Index
            [AR,RI,~,~] = randindex(y, y_hat);  % F-score
            RI_V(i) = RI;
            [~, macro] = micro_macro_PR(y, y_hat);
            FS_V(i) = macro.fscore;
            % kappa
            kappa = kappaindex(y, y_hat, 4);
            KP_V(i) = kappa;
          %     disp(i + "-th loop over...");
         end

         ri_mean = mean(RI_V);
         fs_mean = mean(FS_V);
         kp_mean = mean(KP_V);
         rt_mean = mean(RT_V);
        
         AVG_V = [ri_mean; fs_mean; kp_mean; rt_mean]
         if isnan(fs_mean)
             disp("fs_mean = NaN, new avg of FS_V is below: ");
             t = myavg(FS_V)
         end
         j = j + 1;
    end
end
