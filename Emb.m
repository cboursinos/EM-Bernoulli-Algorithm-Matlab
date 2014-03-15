function [ p M ] = EMb(X, K,D,eterations,posflor,SizeOfTrain )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes her

%arxikopoiisi
p=(1/K)*ones(1,K);
M=(0.55-0.45)*rand(K,D)+0.45;
  
    [Fper L]=  Ffunction(X, p , M,SizeOfTrain,K);
    Lold = L;
    for i=1:eterations
       
    %E-step
        G = GamaFunction(Fper,SizeOfTrain,K);
        
    %M-step
        for k= 1:K
            for d = 1:784
                sumM=0;
                for n=1:SizeOfTrain
                    sumM = sumM + G(n,k)*X(n,d);
                end
                if sum(G(:,k)) > 0
                    M(k,d) = sumM/sum(G(:,k));
                end
            end

            p(k)=sum(G(:,k))/SizeOfTrain;
        end
    
        [Fper L]=  Ffunction(X, p , M,SizeOfTrain,K);
        Lnew = L;
        Lnew-Lold
            if Lnew - Lold > 0 
               Lold = Lnew;
            end    

            if Lnew - Lold< posflor
               return; 
            end   
      
    end
end

