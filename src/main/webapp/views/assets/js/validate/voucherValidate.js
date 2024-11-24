function validateForm() { 
       var tenVC = document.forms["formVoucher"]["tenVC"].value;
       var giaTriVC = document.forms["formVoucher"]["giaTriVC"].value;
       var soLuotSuDungToiDa = document.forms["formVoucher"]["soLuotSuDungToiDa"].value;
       var soLuotDaSuDung = document.forms["formVoucher"]["soLuotDaSuDung"].value;
       var ngayBatDau = document.forms["formVoucher"]["ngayBatDau"].value;
       var ngayKetThuc = document.forms["formVoucher"]["ngayKetThuc"].value; 

       // Kiểm tra các trường có giá trị hay không
       if (tenVC == "" || giaTriVC == "" || soLuotSuDungToiDa == "" || soLuotDaSuDung == "" || ngayBatDau == "" || ngayKetThuc == "") {
           alert("Vui lòng điền đầy đủ tất cả các trường!");
           return false; // Dừng việc gửi form nếu có trường bị bỏ trống
       }

       // Kiểm tra số lượt sử dụng tối đa và số lượt đã sử dụng không âm
       if (parseInt(soLuotSuDungToiDa) < 0 || parseInt(soLuotDaSuDung) < 0) {
           alert("Số lượt sử dụng phải là số dương.");
           return false;
       }

       // Kiểm tra ngày bắt đầu phải trước ngày kết thúc
       if (new Date(ngayBatDau) > new Date(ngayKetThuc)) {
           alert("Ngày bắt đầu không thể sau ngày kết thúc.");
           return false;
       }

       return true; // Cho phép gửi form nếu tất cả kiểm tra đều hợp lệ
   }