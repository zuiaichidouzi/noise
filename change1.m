clc;
clear;
datasets_name={'PIE_32x32'};
for ds=1:length(datasets_name)
    dataset=datasets_name{ds};  %���ݼ�
    dataset
    file=strcat('D:\MATLAB\bin\duan\MDRST\datasets\',dataset,'.mat');
    load(file);
    C=unique(Y);
    l=length(C);
    
    for i=1:1:l
        idxC=find(Y==C(i));
        ll=length(idxC);
        imgX=X(idxC,:);%ȡ��ÿ������
        for j=1:1:ll
            iimgX=imgX(j,:);
            im=sqrt(size(X,2));
            newImg = reshape(iimgX,im,[]);
            newImg = uint8(newImg);
            imwrite(newImg,strcat('E:\ZCH\zch_algorithm\��������\original_imag\PIE32x32\',string(i),'-',string(j),'.png'));
        end
    end
end
