function nnplotmatthew(nn,fhandle,L,opts,i)
%NNPLOTMATTHEW Used with matthew correlation coefficient. 
% Plots all coefficients and training error. Used with opts.errfun set to
% @matthew.
    nplots = size(L.train.e_errfun,2) + 1;
    n_cols = 4.0;
    n_rows = ceil(nplots / n_cols);
    

    %    plotting
    figure(fhandle); 
    
    x_ax = 1:i;
    
    if opts.validation == 1
        subplot(n_rows,n_cols,1);
        p = plot(x_ax, L.train.e, 'b', ...
                 x_ax, L.val.e, 'r');
        legend(p, {'Training', 'Validation'},'Location','SouthEast');
        xlabel('Number of epochs'); ylabel('Error');title('Error');    
        set(gca, 'Xlim',[0,opts.numepochs + 1])
        %create subplots of correlations
        for b = 1:nplots-1
            subplot(n_rows,n_cols,b+1);
            p = plot(x_ax, L.train.e_errfun(:,b), 'b', ...
                     x_ax, L.val.e_errfun(:,b),   'm');
            ylabel('MCC'); xlabel('Epoch'); 
            title(sprintf('Matthew correlation: Class %i',b))
            legend(p, {'Training', 'Validation'},'Location','SouthEast');
            set(gca, 'Xlim',[0,opts.numepochs + 1])
        end
        
    else
        subplot(n_rows,n_cols,1);
        p = plot(x_ax,L.train.e,'b');
        legend(p, {'Training'},'Location','NorthEast');
        xlabel('Number of epochs'); ylabel('Error');title('Error');    
        set(gca, 'Xlim',[0,opts.numepochs + 1])
        
        for b = 1:nplots-1
            subplot(n_rows,n_cols,b+1);
            p = plot(x_ax, L.train.e_errfun(:,b), 'b');
            ylabel('MCC'); xlabel('Epoch'); 
            title(sprintf('Class %i',b))
            legend(p, {'Training'},'Location','NorthEast');
            set(gca, 'Xlim',[0,opts.numepochs + 1])
        end
        
    end    
    
    drawnow;
    

    
end