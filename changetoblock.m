clc; % ��������
clear all; % ������б���
%% ȡ��ͼƬ����
image_path = 'E:\ZCH\zch_algorithm\��������\original\ORL\'; % ͼ��·��
Files = dir(strcat(image_path, '*.png')); % ��ȡ����.png�ļ�
N = length(Files); % �ļ�����
%% ����ͼ��
for k = 1:N
    % ��ȡ��k��ͼ�������
    FileName = string(Files(k).name); % ���ļ���ת��Ϊ�ַ���
    B = imread(strcat(image_path, FileName)); % ��ȡͼ��
    
    % ��ȡ��k��ͼ���ǰ׺��
    r = FileName.split('.'); % �ָ��ַ���
    img_name = r(1,1); % ��ȡǰ׺��
 
    %ת��Ϊ˫���ȣ���Χ��0��1֮��
    img = im2double(B);
    %ͼ��ߴ�
    [rows, cols, channels] = size(img);
    % ����������Ĳ��� 
    blockSize = rows/2; % ������Ĵ�С 
    numBlocks = 1; % ����������� 
    blockColor = 0; % ���������ɫ��1Ϊ��ɫ��0Ϊ��ɫ 
    % ������������� 
    for i = 1:numBlocks 
        % ���ѡ�����������ʼλ�� 
        x = randi(rows - blockSize + 1); 
        y = randi(cols - blockSize + 1);
        
        % ��ָ��λ�÷��������� 
        for m = x:(x+blockSize-1) 
            for n = y:(y+blockSize-1) 
                img(m, n, :) = blockColor; 
            end
        end
    end 
    % ��ӽ���������
%     J = imnoise(B, 'salt & pepper', 0.01);
   
    % ����ͼ��
    imwrite(img, strcat('E:\ZCH\zch_algorithm\��������\salt_pepper\block_class\ORL_all\0.5ORL\', img_name, '.png'));
end


% ��ȡԭʼͼ�� 
% originalImage = imread('your_image.jpg'); 
% �滻Ϊ���ͼ��·��
% img = im2double(originalImage); % ת��Ϊ˫�����ͣ���Χ��0��1֮�� % ͼ��ߴ� [rows, cols, channels] = size(img); 
% ����������Ĳ��� blockSize = 10; % ������Ĵ�С numBlocks = 20; % ����������� blockColor = 1; % ���������ɫ��1Ϊ��ɫ��0Ϊ��ɫ % ������������� for i = 1:numBlocks % ���ѡ�����������ʼλ�� x = randi(rows - blockSize + 1); y = randi(cols - blockSize + 1); % ��ָ��λ�÷��������� for m = x:(x+blockSize-1) for n = y:(y+blockSize-1) img(m, n, :) = blockColor; end end end % ��ʾԭʼͼ��������������ͼ�� subplot(1, 2, 1); imshow(originalImage); title('Original Image'); subplot(1, 2, 2); imshow(img, []); title('Image with Salt and Pepper Noise Blocks');