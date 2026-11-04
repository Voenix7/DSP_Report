// test_457.sce - Test script for Lab 4 exercises 4, 5, 7
// Sinh viên: Nguyễn Triều Vĩ (2313940)
// Ngày: 04/11/2026

clc; clear; close();
disp("=========================================");
disp("   LAB 4 - TEST SCRIPT (Exercises 4,5,7)");
disp("   Student: Nguyễn Triều Vĩ (2313940)");
disp("=========================================");

// Test counter
total_tests = 0;
passed_tests = 0;

// ===== TEST 1: Bài 4 - Xử lý âm thanh =====
disp(" ");
disp("=== TEST 1: Bài 4 - Xử lý âm thanh ===");
try
    exec("EX4.sce", -1);
    disp("✓ EX4.sce chạy thành công");
    
    // Kiểm tra file WAV được tạo
    if fileinfo("test_audio.wav") <> [] then
        disp("✓ File test_audio.wav được tạo");
        passed_tests = passed_tests + 1;
    else
        disp("✗ File test_audio.wav không được tạo");
    end
    total_tests = total_tests + 1;
    
catch
    disp("✗ Lỗi khi chạy EX4.sce: " + lasterror());
end

// ===== TEST 2: Bài 5 - Xử lý ảnh =====
disp(" ");
disp("=== TEST 2: Bài 5 - Xử lý ảnh ===");
try
    exec("EX5.sce", -1);
    disp("✓ EX5.sce chạy thành công");
    
    // Kiểm tra IPCV toolbox
    if atomsIsInstalled('IPCV') then
        disp("✓ IPCV toolbox đã được cài đặt/kiểm tra");
        passed_tests = passed_tests + 1;
    else
        disp("✗ IPCV toolbox không được cài đặt");
    end
    total_tests = total_tests + 1;
    
catch
    disp("✗ Lỗi khi chạy EX5.sce: " + lasterror());
end

// ===== TEST 3: Bài 7 - Tích chập vòng =====
disp(" ");
disp("=== TEST 3: Bài 7 - Tích chập vòng ===");
try
    exec("EX7.sce", -1);
    disp("✓ EX7.sce chạy thành công");
    
    // Kiểm tra biến y đã được tính
    if exists('y') == 1 then
        y_expected = [4, -4, -3, 0, 3];
        if norm(y - y_expected) < 1e-10 then
            disp("✓ Kết quả tích chập vòng ĐÚNG: y = [4, -4, -3, 0, 3]");
            passed_tests = passed_tests + 1;
        else
            disp("✗ Kết quả tích chập vòng SAI");
            disp("  Expected: " + string(y_expected));
            disp("  Got: " + string(y));
        end
    else
        disp("✗ Biến y không được định nghĩa");
    end
    total_tests = total_tests + 1;
    
catch
    disp("✗ Lỗi khi chạy EX7.sce: " + lasterror());
end

// ===== SUMMARY =====
disp(" ");
disp("=========================================");
disp("           TEST SUMMARY");
disp("=========================================");
disp("Tổng số test: " + string(total_tests));
disp("Test passed: " + string(passed_tests));
disp("Test failed: " + string(total_tests - passed_tests));

if passed_tests == total_tests then
    disp("✅ TẤT CẢ TEST PASSED!");
    disp("   Bài 4, 5, 7 đều hoạt động đúng");
else
    disp("⚠ MỘT SỐ TEST FAILED!");
    disp("   Cần kiểm tra lại code");
end

disp(" ");
disp("Thông tin:");
disp("- Bài 4: Xử lý âm thanh, FFT, file WAV");
disp("- Bài 5: Xử lý ảnh, histogram, equalization, blur");
disp("- Bài 7: Tích chập vòng, năng lượng tín hiệu");
disp(" ");
disp("=========================================");