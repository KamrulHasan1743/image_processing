clc
close all
clear all

M=readtable('english.csv');
MM=table2cell(M);
labl=[];
for i=1:10
   labl=[labl ones(1,55)*i]; 
end
cnt=1;
    for i=1:length(labl)
    %for i=1:1
        if mod(i,100)==0
            [i ]
        end
        img=rgb2gray(imread(MM{i+550,1}));
        img=255-img;
         img=imresize(img,[512,512]);
         figure,imshow(img)
        if sum(sum(img))
            feat(cnt,:)=RCDT_features(img);
            cnt=cnt+1;
        end
    end
    %return
    size(feat)
    save 'feat.mat' feat labl