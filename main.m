clear all
load mnist_all.mat

K  = 32
eterations = 200
posflor = 0.000006
D=784;
SizeOfTrain = 100



for k =1:K
    for i=1:10

        X = eval(['train' num2str(i-1)]);
        X=double(X);
        
        %epilegw tuxaia 100 stoixeia apo kathe pinaka
        c=randperm(size(X,1));
        X=X(c(1:SizeOfTrain),:);
        
              
        %kanw kanonikopoiisi twn timwn
        X(X<3)=0;
        X(X>0)=1;
        X=double(X);
       
        %edw mpainw gia na kalesw ton EM algorithmo
        [p M ]=  EMb(X, K,D, eterations, posflor,SizeOfTrain);  

       
        model{k,i}.M = M;
        model{k,i}.p = p;
        
    end
    k
end

%edw tha balw ton Naive Bayes! na dw an douleuei
TestSet= [test0;test1;test2;test3;test4;test5;test6;test7;test8;test9];
[N T] = size(TestSet);
X=TestSet;
X=double(X);
X(X<3)=0;
X(X>0)=1;
X=double(X);

    fid = fopen('exp.txt','w');
for k=1:K
    counter0=0;
    counter1=0;
    counter2=0;
    counter3=0;
    counter4=0;
    counter5=0;
    counter6=0;
    counter7=0;
    counter8=0;
    counter9=0;
    for n=1:2115+1032
        for i =1:10
          M  = model{k,i}.M;
          p =  model{k,i}.p;
            %prepei na pairnw ti kathe grammi tou test kai na upologizw
            % to L
            [Fper L]=  Ffunction(X(n,:), p , M,1,K);
             Y(i)=L;
             %elegxw pio L einai megalutero kai bazw se auto
             %me to megalutero tin omada pou einai
        end
            [max_val, position] = max(Y(:));
        if n<=980
            if position ~= 1
                counter0 = counter0 +1;
                n;
            end    
        end
        if 980<n && n<=980+1135
            if position ~= 2
                counter1 = counter1 +1;
                n;
            end    
        end
        if 2115<n && n<=2115+1032
            if position ~= 3
                counter2 = counter2 +1;
                n;
                 n
                position
            end    
        end
        if 3147<n && n<=3147+1010
            if position ~= 4
                counter3 = counter3 +1;
                n;
            end    
        end
        if 4157<n && n<=4157+982
            if position ~= 5
                counter4 = counter4 +1;
                n;
            end    
        end
        if 5139<n && n<=5139+892
            if position ~= 6
                counter5 = counter5 +1;
                n;
            end    
        end
        if 6031<n && n<=6031+958
            if position ~= 7
                counter6 = counter6 +1;
                n;
               
            end    
        end
        if 6989<n && n<=6989+1028
            if position ~= 8
                counter7 = counter7 +1;
                n;
                
            end    
        end
        if 8017<n && n<=8017+974
            if position ~= 9
                counter8 = counter8 +1;
                n;
               
            end    
        end
        if 8991<n && n<=8991+1009
            if position ~= 10
                counter9 = counter9 +1;
                n;
            end    
        end
    end
    c0 = counter0/980
    c1 = counter1/1135
    c2 = counter2/1032
    c3 = counter3/1010
    c4 = counter4/982
    c5 = counter5/892
    c6 = counter6/958
    c7 = counter7/1028
    c8 = counter8/974
    c9 = counter9/1009
    C = counter0+counter1+counter2+counter3+counter4+counter5+counter6+counter7+counter8+counter9
    dif = C/N
     fprintf(fid,'%6.2f  %12.8f\n',k,dif);
end

