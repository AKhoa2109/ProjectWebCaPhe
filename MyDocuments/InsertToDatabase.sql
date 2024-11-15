USE WebBanCaPhe

GO

-- BEGIN TRANSACTION

INSERT INTO Voucher (MaVC, TenVC, GiaTriVC, SoLuotSuDungToiDa, SoLuotDaSuDung, NgayBatDau, NgayKetThuc, TrangThai) VALUES
('VC01', N'Giảm giá 10%', 0.1, 100, 5, '2024-11-01', '2024-12-01', N'Còn hạn'),
('VC02', N'Giảm giá 20%', 0.2, 50, 10, '2024-11-01', '2024-12-01', N'Còn hạn'),
('VC03', N'Giảm giá 15%', 0.15, 30, 5, '2024-11-01', '2024-12-01', N'Hết hạn'),
('VC04', N'Giảm giá 5%', 0.05, 20, 0, '2024-11-01', '2024-12-01', N'Còn hạn'),
('VC05', N'Giảm giá 25%', 0.25, 10, 1, '2024-11-01', '2024-12-01', N'Còn hạn');

INSERT INTO NguoiDung (MaND, TenND, NamSinh, GioiTinh, SoDienThoai, Email, DiaChi, AnhND, VaiTro, TenDangNhap, MatKhau) VALUES
('ND01', N'Nguyen Van A', 1990, N'Nam', '0912345678', 'a@gmail.com', N'Hồ Chí Minh', 'nd1.jpg', 'Admin', 'nd1', '123123'),
('ND02', N'Tran Thi B', 1992, N'Nữ', '0987654321', 'b@gmail.com', N'Hà Nội', 'nd2.jpg', 'Client', 'nd2', '123123'),
('ND03', N'Le Van C', 1985, N'Nam', '0911223344', 'c@gmail.com', N'Đà Nẵng', 'nd3.jpg', 'Client', 'nd3', '123123'),
('ND04', N'Pham Thi D', 1993, N'Nữ', '0977554433', 'd@gmail.com', N'Cần Thơ', 'nd4.jpg', 'Client', 'nd4', '123123'),
('ND05', N'Hoang Van E', 1988, N'Nam', '0966887766', 'e@gmail.com', N'Bình Dương', 'nd5.jpg' , 'Client', 'nd5', '123123');

INSERT INTO KhuVuc (MaKV, TenKV, PhiVanChuyen) VALUES
('KV01', N'Hồ Chí Minh', 10000),
('KV02', N'Hà Nội', 20000),
('KV03', N'Đà Nẵng', 15000),
('KV04', N'Cần Thơ', 18000),
('KV05', N'Bình Dương', 12000);

INSERT INTO DonHang (MaDH, GiaTriDH, NgayMua, TrangThai, MaKV) VALUES
('DH01', 30000, '2024-11-01', N'Đã giao', 'KV01'),
('DH02', 15000, '2024-11-02', N'Đang giao', 'KV02'),
('DH03', 45000, '2024-11-03', N'Chờ xác nhận', 'KV03'),
('DH04', 60000, '2024-11-04', N'Đã giao', 'KV01'),
('DH05', 40000, '2024-11-05', N'Đã hủy', 'KV02');

INSERT INTO DonHangApDungVoucher (MaDH, MaVC) VALUES
('DH01', 'VC01'),
('DH02', 'VC02'),
('DH03', 'VC03'),
('DH04', 'VC04'),
('DH05', 'VC05');

INSERT INTO LoaiSanPham (MaLoaiSP, TenLoaiSP,HinhLoaiSP) VALUES
('LSP01', N'Cà phê','caphedenda.jpg'),
('LSP02', N'Trà','travai.jpg'),
('LSP03', N'Sinh tố','sinhtobo.jpg'),
('LSP04', N'Kem','kemsocola.jpg'),
('LSP05', N'Bánh kem','banhkemdau.jpg'),
('LSP06', N'Bánh','tiramisu.jpg');

INSERT INTO SanPham (MaSP, TenSP, GiaSP, AnhSP, MaLoaiSP, MoTaSP) VALUES
('SP01', N'Cà phê đen đá', 20000, 'caphedenda.jpg', 'LSP01',''),
('SP02', N'Cà phê sữa đá', 25000, 'caphesuada.jpg', 'LSP01',''),
('SP03', N'Bạc xỉu', 25000, 'bacxiu.jpg', 'LSP01',''),
('SP04', N'Đường đen sữa đá', 30000, 'duongdensuada.jpg', 'LSP01',''),
('SP05', N'Latte đá', 35000, 'latteda.jpg', 'LSP01',''),
('SP06', N'Latte nóng', 35000, 'lattenong.jpg', 'LSP01',''),
('SP07', N'Cappuccino đá', 35000, 'cappuccinoda.jpg', 'LSP01',''),
('SP08', N'Cappuccino nóng', 35000, 'cappuccinonong.jpg', 'LSP01',''),
('SP09', N'Trà đào', 30000, 'tradao.jpg', 'LSP02',''),
('SP10', N'Trà đào cam sả', 40000, 'tradaocamsa.jpg', 'LSP02',''),
('SP11', N'Trà vải', 30000, 'travai.jpg', 'LSP02',''),
('SP12', N'Trà sen', 30000, 'trasen.jpg', 'LSP02',''),
('SP13', N'Sinh tố bơ', 35000, 'sinhtobo.jpg', 'LSP03',''),
('SP14', N'Sinh tố dâu', 35000, 'sinhtodau.jpg', 'LSP03',''),
('SP15', N'Sinh tố mãng cầu', 30000, 'sinhtomangcau.jpg', 'LSP03',''),
('SP16', N'Sinh tố nho', 30000, 'sinhtonho.jpg', 'LSP03',''),
('SP17', N'Kem socola', 12000, 'kemsocola.jpg', 'LSP04',''),
('SP18', N'Kem dâu', 12000, 'kemdau.jpg', 'LSP04',''),
('SP19', N'Kem matcha', 12000, 'kemmatcha.jpg', 'LSP04',''),
('SP20', N'Kem cà phê', 12000, 'kemcaphe.jpg', 'LSP04',''),
('SP21', N'Bánh kem cheese', 35000, 'banhkemcheese.jpg', 'LSP05',''),
('SP22', N'Bánh kem dâu', 35000, 'banhkemdau.jpg', 'LSP05',''),
('SP23', N'Bánh kem socola', 35000, 'banhkemsocola.jpg', 'LSP05',''),
('SP24', N'Bánh kem matcha', 35000, 'banhkemmatcha.jpg', 'LSP05',''),
('SP25', N'Bánh tiramisu', 38000, 'tiramisu.jpg', 'LSP06',''),
('SP26', N'Bánh chà bông phô mai', 27000, 'chabongphomai.jpg', 'LSP06',''),
('SP27', N'Bánh croissant', 22000, 'croissant.jpg', 'LSP06',''),
('SP28', N'Bánh chaud', 22000, 'chaud.jpg', 'LSP06','');


INSERT INTO GioHang (MaND, MaSP, SoLuongMua) VALUES
('ND03', 'SP01', 2),
('ND02', 'SP02', 1),
('ND03', 'SP03', 3),
('ND04', 'SP04', 4),
('ND05', 'SP05', 2);

INSERT INTO DonVi (MaDV, TenDV) VALUES
('DV01', N'gam'),
('DV02', N'kg'),
('DV03', N'ml'),
('DV04', N'lít'),
('DV05', N'muỗng'),
('DV06', N'lon'),
('DV07', N'túi'),
('DV08', N'trái');

INSERT INTO PhuongThucThanhToan (MaPTTT, TenPTTT) VALUES
('PT01', N'Tiền mặt'),
('PT02', N'MoMo'),
('PT03', N'ZaloPay'),
('PT04', N'ShopeePay'),
('PT05', N'Thẻ ngân hàng');

INSERT INTO NguyenLieu (MaNL, TenNL, SoLuongTonKho, MaDV) VALUES
('NL01', N'Cà phê hạt', 100, 'DV01'),
('NL02', N'Đường', 50, 'DV01'),
('NL03', N'Sữa', 200, 'DV03'),
('NL04', N'Cam', 30, 'DV08'),
('NL05', N'Trà', 40, 'DV07');

INSERT INTO PhaChe (MaSP, MaNL, SoLuong) VALUES
('SP01', 'NL01', 1),
('SP02', 'NL02', 1),
('SP03', 'NL03', 2),
('SP04', 'NL04', 1),
('SP05', 'NL05', 1);

INSERT INTO Slide (MaSlide, TenSlide, AnhSlide, ViTri, TrangThai, MaND) VALUES
('SL01', N'Slide 1', 'slide1.jpg', '1', N'Hiển thị', 'ND01'),
('SL02', N'Slide 2', 'slide2.jpg', '2', N'Hiển thị', 'ND01'),
('SL03', N'Slide 3', 'slide3.jpg', '3', N'Ẩn', 'ND01'),
('SL04', N'Slide 4', 'slide4.jpg', '4', N'Hiển thị', 'ND01'),
('SL05', N'Slide 5', 'slide5.jpg', '5', N'Ẩn', 'ND01');

INSERT INTO ThanhToan (MaND, MaDH, MaPTTT) VALUES
('ND04', 'DH01', 'PT01'),
('ND02', 'DH02', 'PT02'),
('ND03', 'DH03', 'PT03'),
('ND04', 'DH04', 'PT04'),
('ND05', 'DH05', 'PT05');

INSERT INTO ChiTietHoaDon (MaDH, MaSP, SoLuong, TongTien) VALUES
('DH01', 'SP01', 2, 30000),
('DH02', 'SP02', 1, 15000),
('DH03', 'SP03', 3, 45000),
('DH04', 'SP04', 4, 60000),
('DH05', 'SP05', 2, 40000);

INSERT INTO DanhGia (MaND, MaSP, SoSao, NhanXet) VALUES 
('ND02', 'SP02', 4, N'Chất lượng ổn'),
('ND03', 'SP03', 3, N'Sản phẩm bình thường'),
('ND04', 'SP04', 5, N'Rất hài lòng'),
('ND05', 'SP05', 2, N'Không hài lòng');

--  COMMIT

--  ROLLBACK