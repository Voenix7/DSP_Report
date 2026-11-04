// EX5.sce - Bài 5: Khảo sát và xử lý ảnh số trong Scilab
// Sinh viên: Nguyễn Triều Vĩ (2313940)
// Ngày: 04/11/2026

clc; clear; close();

disp("===== BÀI 5: XỬ LÝ ẢNH =====");
disp("Cài đặt IPCV toolbox và thực nghiệm xử lý ảnh");

// 1. Cài đặt IPCV toolbox nếu chưa có
if ~atomsIsInstalled('IPCV') then
    disp("Cài đặt IPCV toolbox...");
    atomsInstall('IPCV');
    atomsLoad('IPCV');
    disp("✓ Đã cài đặt IPCV toolbox");
else
    disp("✓ IPCV toolbox đã được cài đặt");
end

// 2. Tạo ảnh test (100x100 pixel) với độ tương phản thấp
rows = 100;
cols = 100;
test_image = uint8(zeros(rows, cols));

// Tạo gradient từ 30 đến 110 (dải mức xám hẹp)
for i = 1:rows
    for j = 1:cols
        // Tạo gradient ngang kết hợp gradient dọc
        gray_val = 30 + (i/rows * 40) + (j/cols * 40);
        test_image(i,j) = uint8(gray_val);
    end
end

// 3. Hiển thị ảnh gốc
figure(1);
subplot(2,3,1);
imshow(test_image);
title("Ảnh gốc (tương phản thấp)");

// 4. Tính histogram của ảnh gốc
hist_original = imhist(test_image);
subplot(2,3,2);
bar(0:255, hist_original);
xlabel("Mức xám");
ylabel("Số lượng pixel");
title("Histogram ảnh gốc");
xlim([0, 255]);

// 5. Histogram Equalization (Cân bằng histogram)
equalized_image = histeq(test_image);
subplot(2,3,3);
imshow(equalized_image);
title("Ảnh sau equalization");

// 6. Histogram của ảnh đã cân bằng
hist_equalized = imhist(equalized_image);
subplot(2,3,4);
bar(0:255, hist_equalized);
xlabel("Mức xám");
ylabel("Số lượng pixel");
title("Histogram sau equalization");
xlim([0, 255]);

// 7. Áp dụng blur filter (box averaging 3x3)
kernel_size = 3;
box_kernel = ones(kernel_size, kernel_size) / (kernel_size*kernel_size);
blurred_image = imfilter(test_image, box_kernel);

subplot(2,3,5);
imshow(blurred_image);
title("Ảnh sau blur filter 3x3");

// 8. Tính các thông số thống kê
original_mean = mean(double(test_image(:)));
original_std = stdev(double(test_image(:)));
equalized_mean = mean(double(equalized_image(:)));
equalized_std = stdev(double(equalized_image(:)));

disp("✓ Thông số thống kê:");
disp("   Ảnh gốc:");
disp("   - Mean: " + string(original_mean));
disp("   - Std Dev: " + string(original_std));
disp("   Ảnh sau equalization:");
disp("   - Mean: " + string(equalized_mean));
disp("   - Std Dev: " + string(equalized_std));

// 9. Kiểm tra tính đúng đắn
if equalized_std > original_std then
    disp("✓ PASS: Equalization làm tăng độ tương phản (std tăng)");
else
    disp("✗ FAIL: Equalization không hiệu quả");
end

disp("===== HOÀN THÀNH BÀI 5 =====");