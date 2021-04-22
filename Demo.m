
load modelparameters.mat

blocksizerow    = 96;
blocksizecol    = 96;
blockrowoverlap = 0;
blockcoloverlap = 0;

Original_image_dir  =    'F:\ME4_11\RTTS\';
fpath = fullfile(Original_image_dir, '*.png');
im_dir  = dir(fpath);
im_num = length(im_dir);
NIQE = [];
for i = 1:im_num
    %% read clean image
    IMname = regexp(im_dir(i).name, '\.', 'split');
    IMname = IMname{1};
    im=imread(fullfile(Original_image_dir, im_dir(i).name));
        quality = computequality(im,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap, ...
            mu_prisparam,cov_prisparam);
        %imDis is a RGB colorful image
        NIQE = [NIQE quality];
end
mNIQE = mean(NIQE);
fprintf('The average NIQE = %2.4f. \n', mNIQE);
save F:\ME4_11\NIQE_Real_BM3D.mat NIQE mNIQE
