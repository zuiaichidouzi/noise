image_path = strcat('E:\ZCH\zch_algorithm\Ω∑—Œ‘Î…˘\salt_pepper\other_class\PIE32x32\0.15\');
X = [];
file=strcat('D:\MATLAB\bin\duan\MDRST\datasets\PIE_32x32.mat');
load(file);
X = [];
for i = 1:length(unique(Y))
    for j = 1:length(find(Y == i))
        B = imread(strcat(image_path, string(i), '-', string(j), '.png'));
        C = reshape(B, 1, length(B(:)));
        X = [X; C];
    end
end
X=double(X);
save(strcat('E:\ZCH\zch_algorithm\Ω∑—Œ‘Î…˘\change_dataset\salt_dataset\PIE32x32\','0.15PIE_32x32.mat'), 'X', 'Y');
