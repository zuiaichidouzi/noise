clc; % 清除命令窗口
clear all; % 清除所有变量
%% 取样图片函数
image_path = 'E:\ZCH\zch_algorithm\椒盐噪声\original\ORL\'; % 图像路径
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
 
    %转化为双精度，范围在0和1之间
    img = im2double(B);
    %图像尺寸
    [rows, cols, channels] = size(img);
    % 设置噪声块的参数 
    blockSize = rows/2; % 噪声块的大小 
    numBlocks = 1; % 噪声块的数量 
    blockColor = 0; % 噪声块的颜色，1为白色，0为黑色 
    % 随机生成噪声块 
    for i = 1:numBlocks 
        % 随机选择噪声块的起始位置 
        x = randi(rows - blockSize + 1); 
        y = randi(cols - blockSize + 1);
        
        % 在指定位置放置噪声块 
        for m = x:(x+blockSize-1) 
            for n = y:(y+blockSize-1) 
                img(m, n, :) = blockColor; 
            end
        end
    end 
    % 添加椒盐噪声块
%     J = imnoise(B, 'salt & pepper', 0.01);
   
    % 保存图像
    imwrite(img, strcat('E:\ZCH\zch_algorithm\椒盐噪声\salt_pepper\block_class\ORL_all\0.5ORL\', img_name, '.png'));
end


% 读取原始图像 
% originalImage = imread('your_image.jpg'); 
% 替换为你的图像路径
% img = im2double(originalImage); % 转换为双精度型，范围在0到1之间 % 图像尺寸 [rows, cols, channels] = size(img); 
% 设置噪声块的参数 blockSize = 10; % 噪声块的大小 numBlocks = 20; % 噪声块的数量 blockColor = 1; % 噪声块的颜色，1为白色，0为黑色 % 随机生成噪声块 for i = 1:numBlocks % 随机选择噪声块的起始位置 x = randi(rows - blockSize + 1); y = randi(cols - blockSize + 1); % 在指定位置放置噪声块 for m = x:(x+blockSize-1) for n = y:(y+blockSize-1) img(m, n, :) = blockColor; end end end % 显示原始图像和添加噪声块后的图像 subplot(1, 2, 1); imshow(originalImage); title('Original Image'); subplot(1, 2, 2); imshow(img, []); title('Image with Salt and Pepper Noise Blocks');