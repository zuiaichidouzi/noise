clc; % ��������
clear all; % ������б���
%% ȡ��ͼƬ����
image_path = 'E:\ZCH\zch_algorithm\��������\original_imag\PIE32x32\'; % ͼ��·��
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
 
    % ��ӽ�������
    J = imnoise(B, 'salt & pepper', 0.15);
   
    % ����ͼ��
    imwrite(J, strcat('E:\ZCH\zch_algorithm\��������\salt_pepper\other_class\PIE32x32\0.15\', img_name, '.png'));
end