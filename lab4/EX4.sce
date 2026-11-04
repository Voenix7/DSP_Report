// EX4.sce - Bài 4: Khảo sát và xử lý dữ liệu âm thanh trong Scilab
// Sinh viên: Nguyễn Triều Vĩ (2313940)
// Ngày: 04/11/2026

clc; clear; close();

disp("===== BÀI 4: XỬ LÝ ÂM THANH =====");
disp("Tổng hợp tín hiệu âm thanh và khảo sát FFT");

// 1. Tạo tín hiệu âm thanh tổng hợp
Fs = 8000;         // Tần số lấy mẫu 8kHz
duration = 0.5;    // Thời lượng 0.5s
t = 0:1/Fs:duration;

// Tín hiệu tổng hợp: s(t) = 0.6·sin(2π·440·t) + 0.3·sin(2π·880·t)
// 440Hz (La - A4) và 880Hz (La - A5)
s = 0.6 * sin(2*%pi*440*t) + 0.3 * sin(2*%pi*880*t);

// 2. Ghi ra file WAV
wavwrite(s, Fs, 16, "test_audio.wav");
disp("✓ Đã ghi file: test_audio.wav (Fs=8000Hz, 16-bit)");

// 3. Đọc file WAV để kiểm tra
[data_read, Fs_read, bits] = wavread("test_audio.wav");
disp("✓ Đọc file:");
disp("   - Sample rate: " + string(Fs_read) + " Hz");
disp("   - Bit depth: " + string(bits) + "-bit");
disp("   - Samples: " + string(length(data_read)));
disp("   - Duration: " + string(length(data_read)/Fs_read) + "s");

// 4. Phát âm thanh (nếu Scilab hỗ trợ)
// playsnd(data_read, Fs_read);

// 5. Vẽ tín hiệu thời gian
figure(1);
subplot(2,1,1);
plot(t(1:100), s(1:100));  // Chỉ vẽ 100 mẫu đầu
xlabel("Thời gian (s)");
ylabel("Biên độ");
title("Dạng sóng âm thanh (100 mẫu đầu)");
grid on;

// 6. Phân tích FFT
N = length(s);
f = Fs * (0:(N/2))/N;  // Tần số từ 0 đến Fs/2
S = fft(s);
S_mag = abs(S(1:N/2+1));

subplot(2,1,2);
plot(f, S_mag);
xlabel("Tần số (Hz)");
ylabel("Biên độ FFT");
title("Phổ tần số FFT");
grid on;
xlim([0, 2000]);  // Zoom đến 2000Hz

// 7. In thông tin đỉnh phổ
[peak_mag, peak_idx] = max(S_mag);
peak_freq = f(peak_idx);
disp("✓ Phân tích FFT:");
disp("   - Đỉnh phổ chính: " + string(peak_freq) + " Hz");
disp("   - Biên độ đỉnh: " + string(peak_mag));

// 8. Kiểm tra tính đúng đắn
expected_freq = 440;  // Tần số cơ bản
freq_error = abs(peak_freq - expected_freq);
if freq_error < 10 then
    disp("✓ PASS: Phổ FFT phát hiện đúng tần số ~440Hz");
else
    disp("✗ FAIL: Phổ FFT không khớp với tần số dự kiến");
end

disp("===== HOÀN THÀNH BÀI 4 =====");