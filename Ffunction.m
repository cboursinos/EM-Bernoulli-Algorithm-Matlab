function [ Fper L ] = Ffunction( X, p , M,SizeOfTrain,K )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

        

        F = zeros(SizeOfTrain,K);
        goal = zeros(SizeOfTrain,K);
        for n = 1:SizeOfTrain
            for k = 1:K
                for d = 1:784
                        if X(n,d) == 1
                            goal(n,k) = goal(n,k) + log(M(k,d));
                        else
                            goal(n,k) = goal(n,k) + log(1-M(k,d));
                        end
                end 
                F(n,k) = F(n,k) + ( log(p(k)) + goal(n,k) );
            end
        end
       
        
       %edw de mou douleuei swsta prepei na pernoume kathe grammis to max
       g = zeros(SizeOfTrain,1);
       for n=1:SizeOfTrain
                g(n) = max(F(n,:));
       end

       Fper = zeros(SizeOfTrain,K);
       for n=1:SizeOfTrain
           for j=1:K
               Fper(n,j)=F(n,j)-g(n);
           end
       end
      size(Fper);
       
       
       L = 0;
        for n=1:SizeOfTrain
            sport=0;
            for j=1:K
                sport = sport + exp(Fper(n,j));
            end
          L = L + g(n) + log(sport);
        end
              
        
        
end

