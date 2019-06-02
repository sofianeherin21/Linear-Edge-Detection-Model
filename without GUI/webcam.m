view=videoinput('winvideo',1);
SE=strel('diamond',2);

figure('Position', [100 40 1000 600]);

for i=1:5
    img=getsnapshot(view);
    img2= im2bw(img);
    img_gray=rgb2gray(img);
    img21=img_gray;
    img3= edge(img21,'Sobel');
    img3_1= imdilate(img3,SE);
    subplot(1,2,1), imshow(img21);
    title('Gray Image');
    subplot(1,2,2), imshow(img3_1);
    title('Sobel');
    pause(0.1);
end

figure('Position', [100 40 1000 600]);

for i=1:5
    img=getsnapshot(view);
    img2= im2bw(img);
    img_gray=rgb2gray(img);
    img21=imclose(img_gray,SE);
    img3= edge(img21,'Roberts');
    img3_1= imdilate(img3,SE);
    subplot(1,2,1), imshow(img21);
    title('Gray Image');
    subplot(1,2,2), imshow(img3_1);
    title('Roberts');
    pause(0.1);
end

figure('Position', [100 40 1000 600]);
for i=1:5
    img=getsnapshot(view);
    img2= im2bw(img);
    img_gray=rgb2gray(img);
    img21=imclose(img_gray,SE);
    img3= edge(img21,'Prewitt');
    img3_1= imdilate(img3,SE);
    subplot(1,2,1), imshow(img21);
    title('Gray Image');
    subplot(1,2,2), imshow(img3_1);
    title('Prewitt');
    pause(0.1);
    
end

figure('Position', [100 40 1000 600]);
for i=1:5
    img=getsnapshot(view);
    img2= im2bw(img);
    img_gray=rgb2gray(img);
    img21=imclose(img_gray,SE);
    img3= edge(img21,'Canny');
    img3_1= imdilate(img3,SE);
    subplot(1,2,1), imshow(img21);
    title('Gray Image');
    subplot(1,2,2), imshow(img3_1);
    title('Canny');
    pause(0.1);
end

