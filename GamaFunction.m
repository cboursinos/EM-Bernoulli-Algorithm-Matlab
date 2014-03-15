function [ G ] = GamaFunction( Fper,SizeOfTrain,K )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


      % edw tha paw na ftoiaksw to athroisma tou arithmiti
      %auto einai to g pou thelw
        G = zeros(SizeOfTrain,K);
        for n=1:SizeOfTrain
            for k=1:K
               G(n,k) = exp(Fper(n,k))/sum(exp(Fper(n,:)));
            end
        end
         
     %alla de mporw na ftoiaksw to sum   
end

