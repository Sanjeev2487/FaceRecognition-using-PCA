clc;clear all;
%% input data
count=0;data=[]';
for i=1:40 %chossing character 
    path=pwd;
    addpath([path '\gallery\s' num2str(i)]);
%  adding directory for input
    for k=1:5
    count=count+1;
    temp1=imread([num2str(k) '.pgm']);
    temp2=temp1(:);
    data(count,:)=temp2';
    end
    rmpath([path '\gallery\s' num2str(i)]);
%   removing directory after use
 end
%% PCA
mu=mean(data);
X=detrend(double(data),'constant');
B=X*X'/200;

%% Getting Eigen-values and Eigenvector
[V,D]=eig(B);lamda=zeros(1,200);
for j=1:200
    lamda(200-j+1)=D(j,j);
end
V2=X'*V;
V1=normc(V2);


%% Part #1
fprintf('Display Eigenfaces corrosponding to top 5 EigenValues\n')
figure();
for i=200:-1:196
    subplot(str2num(['15' num2str(200-i+1)]))
    imshow(mat2gray(reshape(V2(:,i),[112,92])))
end

 %% Part #02
tot_var=sum(lamda);
var_percntg=[]';NoDR=0;tmp1=0;flag=0;
for i=1:200
    tmp1=tmp1+lamda(i);
    tmp=(tmp1/tot_var)*100;
    var_percntg(i)=tmp;
    if (tmp>=95)&&(flag==0)
        NoDR=i;
        flag=1;
    end
end
figure
plot(var_percntg);
title('Percentage of Total Variance  Captured of Data vs No. of Dimension')
xlabel('No. of Dimension takeng')
ylabel('Percentage of Total Variance Covered')
fprintf('No. of Required Dimension = %d \n',NoDR)
% 
% Part #03
 %a part
q1=imread('face_input_1.pgm');
f= figure('name','Reconstruction of face_input_1.pgm ');
set(gcf,'Color',[1,0.6,0.5])
subplot(141)
imshow(q1)
title('Actual Image')
X2=double(q1(:));
X1=X2-mu';
t1=zeros(10304,1);

n=1;
 for i=200:-1:200-n+1
    t1=t1+X1'*V1(:,i)*V1(:,i);
 end
 b1=t1+mu';
 error=(X2-b1)'*(X2-b1)/10304;
 fprintf('Error in reconstruction from #01 Eigenvector : %d\n' ,error)
 subplot(142)
 imshow(mat2gray(reshape(b1,[112,92])))
 title('#01')
 
% b part
n=15;t1=zeros(10304,1);
 for i=200:-1:200-n+1
    t1=t1+X1'*V1(:,i)*V1(:,i);
 end
b1=t1+mu';
error=(X2-b1)'*(X2-b1)/10304;
fprintf('Error in reconstruction from #15 Eigenvector : %d\n' ,error)
subplot(143)
imshow(mat2gray(reshape(b1,[112,92])))
title('#15')
 % c part
n=200;t1=zeros(10304,1);
 for i=200:-1:200-n+1
    t1=t1+X1'*V1(:,i)*V1(:,i);
 end
 b1=t1+mu';
error=(X2-b1)'*(X2-b1)/10304;
fprintf('Error in reconstruction from #200 Eigenvector : %d\n' ,error)
 subplot(144)
 imshow(mat2gray(reshape(b1,[112,92])))
title('#200')

%% Part #04
error1=zeros(1,200);
for j=1:200
n=j;t1=zeros(10304,1);
 for i=200:-1:200-n+1
    t1=t1+X1'*V1(:,i)*V1(:,i);
 end
 b1=t1+mu';
error1(j)=(X2-b1)'*(X2-b1)/10304;
end
f= figure('name','Mean Squared  Error Vs No. of EigenFaces for face_input_1.pgm ');
set(gcf,'Color',[1,0.5,0.6])
x=1:200;
plot(x,error1)
title('Mean Squared Error with Varying no. of Eigen Faces')
xlabel('No. of EigenFaces Choosen')
ylabel('Mean Squared Error')

fprintf('Part V \n')
%% Part V
q1=imread('face_input_2.pgm');
f= figure('name','Reconstruction of face_input_2.pgm ');
set(gcf,'Color',[1,0.6,0.5])
subplot(141)
imshow(q1)
title('Actual Image')
X2=double(q1(:));
X1=X2-mu';
t1=zeros(10304,1);

n=1;
 for i=200:-1:200-n+1
    t1=t1+X1'*V1(:,i)*V1(:,i);
 end
 b1=t1+mu';
 error=(X2-b1)'*(X2-b1)/10304;
 fprintf('Error in reconstruction from #01 Eigenvector : %d\n' ,error)
 subplot(142)
 imshow(mat2gray(reshape(b1,[112,92])))
 title('#01')
 
% b part
n=15;t1=zeros(10304,1);
 for i=200:-1:200-n+1
    t1=t1+X1'*V1(:,i)*V1(:,i);
 end
b1=t1+mu';
error=(X2-b1)'*(X2-b1)/10304;
fprintf('Error in reconstruction from #15 Eigenvector : %d\n' ,error)
subplot(143)
imshow(mat2gray(reshape(b1,[112,92])))
title('#15')
 % c
n=200;t1=zeros(10304,1);
 for i=200:-1:200-n+1
    t1=t1+X1'*V1(:,i)*V1(:,i);
 end
 b1=t1+mu';
error=(X2-b1)'*(X2-b1)/10304;
fprintf('Error in reconstruction from #200 Eigenvector : %d\n' ,error)
 subplot(144)
 imshow(mat2gray(reshape(b1,[112,92])))
title('#200')

%part 4
error1=zeros(1,200);
for j=1:200
n=j;t1=zeros(10304,1);
 for i=200:-1:200-n+1
    t1=t1+X1'*V1(:,i)*V1(:,i);
 end
 b1=t1+mu';
error1(j)=(X2-b1)'*(X2-b1)/10304;
end
f= figure('name','Mean Squared  Error Vs No. of EigenFaces for face_input_2.pgm ');
set(gcf,'Color',[1,0.5,0.6])
plot(error1)
title('Mean Squared Error with Varying no. of Eigen Faces')
xlabel('No. of EigenFaces Choosen')
ylabel('Mean Squared Error')

