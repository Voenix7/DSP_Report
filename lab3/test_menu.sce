// Test individual exercises interactively
// Chọn bài muốn test - Có thể test nhiều bài liên tiếp

clear; clc;

// Navigate to script directory
script_path = get_absolute_file_path('test_menu.sce');
cd(script_path);

disp('========================================');
disp('DSP Lab 3 - Test Từng Bài Riêng');
disp('========================================');
disp(' ');

// Load all functions
disp('Đang load các hàm...');
funcprot(0);
exec('EX3.1.sci', -1);
exec('EX3.2.sci', -1);
exec('EX3.3.sci', -1);
exec('EX3.4.sci', -1);
exec('EX3.5.sci', -1);
exec('EX3.6.sci', -1);
funcprot(1);
disp('✓ Load xong!');
disp(' ');

// Loop để test nhiều bài
continue_testing = %t;

while continue_testing
    // Show menu
    disp('========================================');
    disp('MENU - Chọn bài muốn test:');
    disp('========================================');
    disp('1. EX3.1 - Delay');
    disp('2. EX3.2 - Advance');
    disp('3. EX3.3 - Fold');
    disp('4. EX3.4 - Add');
    disp('5. EX3.5 - Multiply');
    disp('6. EX3.6 - Convolution');
    disp('7. Test tất cả');
    disp('0. Thoát');
    disp(' ');
    
    choice = input('Nhập lựa chọn (0-7): ');

    
    select choice
    case 0
        // Exit
        disp(' ');
        disp('Kết thúc chương trình. Tạm biệt!');
        continue_testing = %f;
        
    case 1
        // TEST EX3.1 - DELAY
        disp(' ');
        disp('=== BÀI 1: DELAY (EX3.1.sci) ===');
        disp('y(n) = x(n-1) với x(n) = {1, -2, 3↑,6 }');
        disp(' ');
        scf(1);
        [yn, yorigin] = delay([1, -2, 3, 6], 3,1);
        disp('Kết quả:');
        disp('  yn = [' + strcat(string(yn), ', ') + ']');
        disp('  yorigin = ' + string(yorigin));
        disp('Mong đợi: yn = [1, -2, 3, 6], yorigin = 4');
        disp(' ');
        disp('✓ Hoàn thành! Kiểm tra Figure 1.');
        disp(' ');
        
    case 2
        // TEST EX3.2 - ADVANCE4
        disp(' ');
        disp('=== BÀI 2: ADVANCE (EX3.2.sci) ===');
        disp('y(n) = x(n+2) với x(n) = {1, -2, 3↑, 6}');
        disp(' ');
        scf(2);
        [yn, yorigin] = advance([1, -2, 3, 6], 3, 2);
        disp('Kết quả:');
        disp('  yn = [' + strcat(string(yn), ', ') + ']');
        disp('  yorigin = ' + string(yorigin));
        disp('Mong đợi: yn = [1, -2, 3, 6], yorigin = 1');
        disp(' ');
        disp('✓ Hoàn thành! Kiểm tra Figure 2.');
        disp(' ');
        
    case 3
        // TEST EX3.3 - FOLD
        disp(' ');
        disp('=== BÀI 3: FOLD (EX3.3.sci) ===');
        disp('y(n) = x(-n) với x(n) = {1, -2, 3↑, 6}');
        disp(' ');
        scf(3);
        [yn, yorigin] = fold([1, -2, 3, 6], 3);
        disp('Kết quả:');
        disp('  yn = [' + strcat(string(yn), ', ') + ']');
        disp('  yorigin = ' + string(yorigin));
        disp('Mong đợi: yn = [6, 3, -2, 1], yorigin = 2');
        disp(' ');
        disp('✓ Hoàn thành! Kiểm tra Figure 3.');
        disp(' ');
        
    case 4
        // TEST EX3.4 - ADD
        disp(' ');
        disp('=== BÀI 4: ADD (EX3.4.sci) ===');
        disp('y(n) = x1(n) + x2(n)');
        disp('x1(n) = {0↑, 1, 3, -2}, x2(n) = {1, 1↑, 2, 3}');
        disp(' ');
        scf(4);
        [yn, yorigin] = add([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);
        disp('Kết quả:');
        disp('  yn = [' + strcat(string(yn), ', ') + ']');
        disp('  yorigin = ' + string(yorigin));
        disp('Mong đợi: yn = [1, 1, 3, 6, -2], yorigin = 2');
        disp(' ');
        disp('✓ Hoàn thành! Kiểm tra Figure 4.');
        disp(' ');
        
    case 5
        // TEST EX3.5 - MULTIPLY
        disp(' ');
        disp('=== BÀI 5: MULTIPLY (EX3.5.sci) ===');
        disp('y(n) = x1(n) * x2(n)');
        disp('x1(n) = {2, 1↑, 3, 4}, x2(n) = {1, 2↑, 3}');
        disp(' ');
        scf(5);
        [yn, yorigin] = multi([2, 1, 3, 4], 2, [1, 2, 3], 2);
        disp('Kết quả:');
        disp('  yn = [' + strcat(string(yn), ', ') + ']');
        disp('  yorigin = ' + string(yorigin));
        disp(' ');
        disp('✓ Hoàn thành! Kiểm tra Figure 5.');
        disp(' ');
        
    case 6
        // TEST EX3.6 - CONVOLUTION
        disp(' ');
        disp('=== BÀI 6: CONVOLUTION (EX3.6.sci) ===');
        disp('y(n) = x(n) * h(n)');
        disp('x(n) = {1, 2↑, 3}, h(n) = {1↑, 1, 1}');
        disp(' ');
        scf(6);
        [yn, yorigin] = convolution([1, 2, 3], 2, [1, 1, 1], 1);
        disp('Kết quả:');
        disp('  yn = [' + strcat(string(yn), ', ') + ']');
        disp('  yorigin = ' + string(yorigin));
        disp(' ');
        disp('✓ Hoàn thành! Kiểm tra Figure 6.');
        disp(' ');
        
    case 7
        // Run all tests
        disp(' ');
        disp('Đang chạy tất cả tests...');
        disp(' ');
        exec('test_all.sce', -1);
        continue_testing = %f;
        
    else
        disp(' ');
        disp('✗ Lựa chọn không hợp lệ! Vui lòng nhập số từ 0-7.');
        disp(' ');
    end
end
