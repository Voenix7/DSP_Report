// Test script for all DSP Lab 3 functions
// Digital Signal Processing - Lab 3
// Student: Vi Trieu
// Date: 2026-10-09

clear; clc;

// Navigate to script directory
script_path = get_absolute_file_path('test_all.sce');
cd(script_path);

disp('========================================');
disp('DSP Lab 3 - Testing All Functions');
disp('Bài Lab 3 - Kiểm tra tất cả các hàm');
disp('========================================');
disp(' ');

// Load all function files
disp('Đang load các file...');
funcprot(0); // Tắt cảnh báo redefining function
exec('EX3.1.sci', -1);
exec('EX3.2.sci', -1);
exec('EX3.3.sci', -1);
exec('EX3.4.sci', -1);
exec('EX3.5.sci', -1);
exec('EX3.6.sci', -1);
funcprot(1);

disp('✓ Đã load xong tất cả các hàm!');
disp(' ');

// ========================================
// TEST 1: DELAY FUNCTION (EX3.1)
// ========================================
disp('========================================');
disp('BÀI 1: DELAY FUNCTION (EX3.1.sci)');
disp('========================================');
disp('Ví dụ: y(n) = x(n-1) với x(n) = {1, -2, 3↑, 6}');
disp('Gọi hàm: [yn, yorigin] = delay([1, -2, 3, 6], 3, 1)');
disp(' ');

scf(1);
[yn, yorigin] = delay([1, -2, 3, 6], 3, 1);
disp('Kết quả:');
disp('  yn = [' + strcat(string(yn), ', ') + ']');
disp('  yorigin = ' + string(yorigin));
disp('Kết quả mong đợi:');
disp('  yn = [1, -2, 3, 6]');
disp('  yorigin = 4');
disp(' ');

if yorigin == 4 then
    disp('✓ PASS - Kết quả đúng!');
else
    disp('✗ FAIL - Kết quả sai!');
end
disp(' ');
sleep(2000);


// ========================================
// TEST 2: ADVANCE FUNCTION (EX3.2)
// ========================================
disp('========================================');
disp('BÀI 2: ADVANCE FUNCTION (EX3.2.sci)');
disp('========================================');
disp('Ví dụ: y(n) = x(n+2) với x(n) = {1, -2, 3↑, 6}');
disp('Gọi hàm: [yn, yorigin] = advance([1, -2, 3, 6], 3, 2)');
disp(' ');

scf(2);
[yn, yorigin] = advance([1, -2, 3, 6], 3, 2);
disp('Kết quả:');
disp('  yn = [' + strcat(string(yn), ', ') + ']');
disp('  yorigin = ' + string(yorigin));
disp(' ');
if yorigin == 1 then
    disp('✓ PASS');
else
    disp('✗ FAIL');
end
disp(' ');
sleep(2000);

// TEST 3: FOLD
disp('========================================');
disp('BÀI 3: FOLD FUNCTION (EX3.3.sci)');
disp('========================================');
scf(3);
[yn, yorigin] = fold([1, -2, 3, 6], 3);
disp('yn = [' + strcat(string(yn), ', ') + ']');
disp('yorigin = ' + string(yorigin));
disp(' ');
sleep(2000);

// TEST 4: ADD
disp('========================================');
disp('BÀI 4: ADD FUNCTION (EX3.4.sci)');
disp('========================================');
scf(4);
[yn, yorigin] = add([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);
disp('yn = [' + strcat(string(yn), ', ') + ']');
disp('yorigin = ' + string(yorigin));
disp(' ');
sleep(2000);

// TEST 5: MULTIPLY
disp('========================================');
disp('BÀI 5: MULTIPLY FUNCTION (EX3.5.sci)');
disp('========================================');
scf(5);
[yn, yorigin] = multi([2, 1, 3, 4], 2, [1, 2, 3], 2);
disp('yn = [' + strcat(string(yn), ', ') + ']');
disp('yorigin = ' + string(yorigin));
disp(' ');
sleep(2000);

// TEST 6: CONVOLUTION
disp('========================================');
disp('BÀI 6: CONVOLUTION FUNCTION (EX3.6.sci)');
disp('========================================');
scf(6);
[yn, yorigin] = convolution([1, 2, 3], 2, [1, 1, 1], 1);
disp('yn = [' + strcat(string(yn), ', ') + ']');
disp('yorigin = ' + string(yorigin));
disp(' ');

disp('========================================');
disp('HOÀN THÀNH! Kiểm tra Figure 1-6.');
disp('========================================');
