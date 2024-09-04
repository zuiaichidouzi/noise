clc; % 清除命令窗口
clear all; % 清除所有变量
%% 取样图片函数
image_path = 'E:\ZCH\zch_algorithm\椒盐噪声\original_imag\PIE32x32\'; % 图像路径
Files = dir(strcat(image_path, '*.png')); % 获取所有.png文件
N = length(Files); % 文件数量
%% 处理图像
for k = 1:N
    % 获取第k副图像的名字
    FileName = string(Files(k).name); % 将文件名转换为字符串
    B = imread(strcat(image_path, FileName)); % 读取图像
    
    % 获取第k张图像的前缀名
    r = FileName.split('.'); % 分割字符串
    img_name = r(1,1); % 提取前缀名
 
    % 添加椒盐噪声
    J = imnoise(B, 'salt & pepper', 0.15);
   
    % 保存图像
    imwrite(J, strcat('E:\ZCH\zch_algorithm\椒盐噪声\salt_pepper\other_class\PIE32x32\0.15\', img_name, '.png'));
end