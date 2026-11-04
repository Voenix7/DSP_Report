// EX7.sce - Bài 7: Tích chập vòng và năng lượng tín hiệu
// Sinh viên: Nguyễn Triều Vĩ (2313940)
// Ngày: 04/11/2026

clc; clear; close();

disp("===== BÀI 7: TÍCH CHẬP VÒNG =====");
disp("Thực hiện tích chập vòng bằng 2 phương pháp");

// 1. Định nghĩa tín hiệu đầu vào và đáp ứng xung
x = [1, 2, -3, 2, 1];    // Tín hiệu đầu vào x(n), n = 0..4
h = [1, 0, -1, -1, 1];   // Đáp ứng xung h(n), n = 0..4
N = length(x);           // Độ dài tín hiệu (cả x và h đều độ dài N)

disp("Tín hiệu đầu vào x(n): " + string(x));
disp("Đáp ứng xung h(n): " + string(h));
disp("Độ dài N = " + string(N));

// 2. Phương pháp 1: Folding & Shifting (tuần hoàn)
disp("--- Phương pháp 1: Folding & Shifting ---");
y_method1 = zeros(1, N);

for n = 0:N-1
    sum_val = 0;
    for k = 0:N-1
        // Tính chỉ số tuần hoàn: (n-k) mod N
        idx = modulo(n - k, N);
        sum_val = sum_val + h(k+1) * x(idx+1);
    end
    y_method1(n+1) = sum_val;
end

disp("Kết quả y(n) [Folding & Shifting]: " + string(y_method1));

// 3. Phương pháp 2: Circulant Matrix
disp("--- Phương pháp 2: Circulant Matrix ---");

// Tạo ma trận circulant H từ h(n)
H = zeros(N, N);
for i = 0:N-1
    for j = 0:N-1
        // H(i,j) = h((i-j) mod N)
        idx = modulo(i - j, N);
        H(i+1, j+1) = h(idx+1);
    end
end

// Tính tích chập: y = H * x'
x_column = x';  // Chuyển x thành vector cột
y_method2 = H * x_column;

disp("Ma trận circulant H:");
disp(H);
disp("Kết quả y(n) [Circulant Matrix]: " + string(y_method2'));

// 4. So sánh kết quả 2 phương pháp
if norm(y_method1 - y_method2') < 1e-10 then
    disp("✓ Hai phương pháp cho kết quả GIỐNG NHAU");
    y = y_method1;  // Dùng kết quả chung
else
    disp("✗ Hai phương pháp cho kết quả KHÁC NHAU");
    y = y_method1;
end

// 5. Tính năng lượng tín hiệu
Ex = sum(x.^2);  // Năng lượng tín hiệu đầu vào
Ey = sum(y.^2);  // Năng lượng tín hiệu đầu ra

disp("--- NĂNG LƯỢNG TÍN HIỆU ---");
disp("Năng lượng tín hiệu đầu vào Ex = Σ|x(n)|²:");
for i = 1:N
    disp("  x(" + string(i-1) + ")² = " + string(x(i)) + "² = " + string(x(i)^2));
end
disp("  Tổng Ex = " + string(Ex));

disp("Năng lượng tín hiệu đầu ra Ey = Σ|y(n)|²:");
for i = 1:N
    disp("  y(" + string(i-1) + ")² = " + string(y(i)) + "² = " + string(y(i)^2));
end
disp("  Tổng Ey = " + string(Ey));

// 6. Phân tích kết quả
disp("--- PHÂN TÍCH ---");
disp("1. Tích chập vòng cho kết quả:");
disp("   y = " + string(y));
disp("2. So sánh năng lượng:");
disp("   Ex = " + string(Ex));
disp("   Ey = " + string(Ey));
if Ey > Ex then
    disp("   → Ey > Ex: Hệ thống KHUẾCH ĐẠI năng lượng");
elseif Ey < Ex then
    disp("   → Ey < Ex: Hệ thống SUY GIẢM năng lượng");
else
    disp("   → Ey = Ex: Hệ thống BẢO TOÀN năng lượng");
end

// 7. Vẽ đồ thị
figure(1);
subplot(3,1,1);
stem(0:N-1, x, 'b', 'filled');
xlabel("n");
ylabel("x(n)");
title("Tín hiệu đầu vào x(n)");
grid on;

subplot(3,1,2);
stem(0:N-1, h, 'r', 'filled');
xlabel("n");
ylabel("h(n)");
title("Đáp ứng xung h(n)");
grid on;

subplot(3,1,3);
stem(0:N-1, y, 'g', 'filled');
xlabel("n");
ylabel("y(n)");
title("Tín hiệu đầu ra y(n) = x(n) ⊛ h(n)");
grid on;

disp("===== HOÀN THÀNH BÀI 7 =====");