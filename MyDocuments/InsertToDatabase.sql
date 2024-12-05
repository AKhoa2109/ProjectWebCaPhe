USE WebBanCaPhe

GO

-- BEGIN TRANSACTION

INSERT INTO Voucher (MaVC, TenVC, GiaTriVC, SoLuotSuDungToiDa, SoLuotDaSuDung, NgayBatDau, NgayKetThuc, TrangThai) VALUES
('VC01', N'Giảm giá 10%', 10000, 100, 5, '2024-11-01', '2024-12-01', N'Còn hạn'),
('VC02', N'Giảm giá 20%', 20000, 50, 10, '2024-11-01', '2024-12-01', N'Còn hạn'),
<<<<<<< HEAD
('VC03', N'Giảm giá 15%', 150000, 30, 5, '2024-11-01', '2024-12-01', N'Hết hạn'),
('VC04', N'Giảm giá 5%', 50000, 20, 0, '2024-11-01', '2024-12-01', N'Còn hạn'),
=======
('VC03', N'Giảm giá 15%', 15000, 30, 5, '2024-11-01', '2024-12-01', N'Hết hạn'),
('VC04', N'Giảm giá 5%', 5000, 20, 0, '2024-11-01', '2024-12-01', N'Còn hạn'),
>>>>>>> remotes/origin/develop
('VC05', N'Giảm giá 25%', 25000, 10, 1, '2024-11-01', '2024-12-01', N'Còn hạn');

INSERT INTO NguoiDung (MaND, TenND, NamSinh, GioiTinh, SoDienThoai, Email, DiaChi, AnhND, VaiTro, TenDangNhap, MatKhau) VALUES
('ND01', N'Nguyen Van A', 1990, N'Nam', '0912345678', 'a@gmail.com', N'Hồ Chí Minh', 'Avt1.jpg', 'Admin', 'nd1', '123123'),
('ND02', N'Tran Thi B', 1992, N'Nữ', '0987654321', 'b@gmail.com', N'Hà Nội', 'Avt2.jpg', 'User', 'nd2', '123123'),
('ND03', N'Le Van C', 1985, N'Nam', '0911223344', 'c@gmail.com', N'Đà Nẵng', 'Avt3.jpg', 'User', 'nd3', '123123'),
('ND04', N'Pham Thi D', 1993, N'Nữ', '0977554433', 'd@gmail.com', N'Cần Thơ', 'Avt4.jpg', 'User', 'nd4', '123123'),
('ND05', N'Hoang Van E', 1988, N'Nam', '0966887766', 'e@gmail.com', N'Bình Dương', 'Avt5.jpg' , 'User', 'nd5', '123123');

INSERT INTO KhuVuc (MaKV, TenKV, PhiVanChuyen) VALUES
('KV01', N'Thành phố Thủ Đức', 20000),
('KV02', N'Quận 1', 15000),
('KV03', N'Quận 3', 14000),
('KV04', N'Quận 4', 13000),
('KV05', N'Quận 5', 13500),
('KV06', N'Quận 6', 14000),
('KV07', N'Quận 7', 16000),
('KV08', N'Quận 8', 15000),
('KV09', N'Quận 10', 13500),
('KV10', N'Quận 11', 14000),
('KV11', N'Quận 12', 17000),
('KV12', N'Quận Tân Bình', 14500),
('KV13', N'Quận Bình Tân', 15500),
('KV14', N'Quận Bình Thạnh', 15000),
('KV15', N'Quận Tân Phú', 16000),
('KV16', N'Quận Gò Vấp', 15500),
('KV17', N'Quận Phú Nhuận', 14500),
('KV18', N'Huyện Bình Chánh', 18000),
('KV19', N'Huyện Hóc Môn', 17500),
('KV20', N'Huyện Cần Giờ', 20000),
('KV21', N'Huyện Củ Chi', 18500),
('KV22', N'Huyện Nhà Bè', 19000);

GO

INSERT INTO DonHang (MaDH, GiaTriDH, NgayMua, TrangThai, MaKV, MaVC) VALUES
('DH01', 30000, '2024-11-01', N'Đã giao', 'KV01', 'VC01'),
('DH02', 15000, '2024-11-02', N'Đang giao', 'KV02', 'VC02'),
('DH03', 45000, '2024-11-03', N'Đã giao', 'KV03', 'VC03'),
('DH04', 60000, '2024-11-04', N'Đã giao', 'KV01', 'VC04'),
('DH05', 40000, '2024-11-05', N'Đã hủy', 'KV02', 'VC05');

INSERT INTO LoaiSanPham (MaLoaiSP, TenLoaiSP,HinhLoaiSP) VALUES
('LSP01', N'Cà phê','caphedenda.jpg'),
('LSP02', N'Trà','travai.jpg'),
('LSP03', N'Sinh tố','sinhtobo.jpg'),
('LSP04', N'Kem','kemsocola.jpg'),
('LSP05', N'Bánh kem','banhkemdau.jpg'),
('LSP06', N'Bánh','tiramisu.jpg');

INSERT INTO SanPham (MaSP, TenSP, GiaSP, AnhSP, MaLoaiSP, MoTaSP) VALUES
('SP01', N'Cà phê đen đá', 20000, 'caphedenda.jpg', 'LSP01', N'Ly cà phê đen đậm đà, không đường, với đá lạnh mang đến cảm giác sảng khoái.'),
('SP02', N'Cà phê sữa đá', 25000, 'caphesuada.jpg', 'LSP01', N'Vị ngọt ngào của sữa hòa quyện với cà phê đậm đà, kèm theo đá lạnh mát dịu.'),
('SP03', N'Bạc xỉu', 25000, 'bacxiu.jpg', 'LSP01', N'Đồ uống có vị ngọt nhẹ, lớp sữa béo thơm hòa với cà phê nhạt tạo nên hương vị dịu dàng.'),
('SP04', N'Đường đen sữa đá', 30000, 'duongdensuada.jpg', 'LSP01', N'Hương vị ngọt ngào từ đường đen kết hợp cùng sữa tươi mát lạnh, thích hợp cho ngày hè.'),
('SP05', N'Latte đá', 35000, 'latteda.jpg', 'LSP01', N'Cà phê nhẹ nhàng với lớp sữa mịn, vị ngọt thanh, uống cùng đá càng thêm sảng khoái.'),
('SP06', N'Latte nóng', 35000, 'lattenong.jpg', 'LSP01', N'Sự kết hợp hoàn hảo giữa cà phê và sữa nóng, mang đến cảm giác ấm áp và dễ chịu.'),
('SP07', N'Cappuccino đá', 35000, 'cappuccinoda.jpg', 'LSP01', N'Vị đậm đà của cà phê, lớp sữa mịn và bọt béo hòa quyện, thêm đá lạnh sảng khoái.'),
('SP08', N'Cappuccino nóng', 35000, 'cappuccinonong.jpg', 'LSP01', N'Ly cà phê đậm hương với lớp bọt sữa béo ngậy, phù hợp cho buổi sáng đầy năng lượng.'),
('SP09', N'Trà đào', 30000, 'tradao.jpg', 'LSP02', N'Trá đào thơm ngon, kèm theo lát đào tươi mọng nước, mang lại cảm giác thư giãn.'),
('SP10', N'Trà đào cam sả', 40000, 'tradaocamsa.jpg', 'LSP02', N'Sự kết hợp hài hòa giữa vị ngọt của đào, vị chua nhẹ của cam và hương thơm thanh mát của sả.'),
('SP11', N'Trà vải', 30000, 'travai.jpg', 'LSP02', N'Trá vải tươi mát, ngọt dịu, đi kèm những miếng vải giòn ngọt.'),
('SP12', N'Trà sen', 30000, 'trasen.jpg', 'LSP02', N'Hương trà nhẹ nhàng, thanh tao, mang chút vị bùi bùi từ hạt sen.'),
('SP13', N'Sinh tố bơ', 35000, 'sinhtobo.jpg', 'LSP03', N'Sinh tố bơ béo ngậy, mịn màng, cung cấp năng lượng tuyệt vời cho cơ thể.'),
('SP14', N'Sinh tố dâu', 35000, 'sinhtodau.jpg', 'LSP03', N'Sinh tố dâu tươi mát với màu sắc bắt mắt và hương vị ngọt ngào.'),
('SP15', N'Sinh tố mãng cầu', 30000, 'sinhtomangcau.jpg', 'LSP03', N'Hương vị mãng cầu chua ngọt độc đáo, sinh tố mịn màng và tươi ngon.'),
('SP16', N'Sinh tố nho', 30000, 'sinhtonho.jpg', 'LSP03', N'Sinh tố nho thơm ngọt, đậm vị, giúp bổ sung năng lượng hiệu quả.'),
('SP17', N'Kem socola', 12000, 'kemsocola.jpg', 'LSP04', N'Kem socola đậm đà, tan chảy trong miệng với vị ngọt ngào khó cưỡng.'),
('SP18', N'Kem dâu', 12000, 'kemdau.jpg', 'LSP04', N'Kem dâu ngọt dịu với hương thơm đặc trưng, thích hợp cho mọi lứa tuổi.'),
('SP19', N'Kem matcha', 12000, 'kemmatcha.jpg', 'LSP04', N'Hương vị trà xanh matcha thơm lừng, hòa quyện cùng lớp kem mát lạnh.'),
('SP20', N'Kem cà phê', 12000, 'kemcaphe.jpg', 'LSP04', N'Kem cà phê thơm ngon, mang lại trải nghiệm mới lạ cho những tín đồ cà phê.'),
('SP21', N'Bánh kem cheese', 35000, 'banhkemcheese.jpg', 'LSP05', N'Bánh mềm mịn với lớp cheese béo ngậy, thích hợp làm món tráng miệng.'),
('SP22', N'Bánh kem dâu', 35000, 'banhkemdau.jpg', 'LSP05', N'Bánh với lớp kem tươi vị dâu thơm mát, phù hợp cho các buổi tiệc ngọt.'),
('SP23', N'Bánh kem socola', 35000, 'banhkemsocola.jpg', 'LSP05', N'Bánh kem socola thơm ngon với lớp phủ socola đậm đà.'),
('SP24', N'Bánh kem matcha', 35000, 'banhkemmatcha.jpg', 'LSP05', N'Hương vị matcha thanh mát, lớp kem béo ngậy, hòa quyện hoàn hảo.'),
('SP25', N'Bánh tiramisu', 38000, 'tiramisu.jpg', 'LSP06', N'Bánh tiramisu kiểu Ý, thơm lừng mùi cà phê và rượu rum, thích hợp cho người yêu ngọt ngào.'),
('SP26', N'Bánh chà bông phô mai', 27000, 'chabongphomai.jpg', 'LSP06', N'Bánh mặn với lớp chà bông và phô mai thơm lừng, thích hợp làm món ăn nhẹ.'),
('SP27', N'Bánh croissant', 22000, 'croissant.jpg', 'LSP06', N'Bánh croissant giòn rụm, lớp bơ thơm ngậy, mang phong cách Pháp.'),
('SP28', N'Bánh chaud', 22000, 'chaud.jpg', 'LSP06', N'Bánh ngọt nhân bơ mềm mịn, hấp dẫn cho buổi chiều thư giãn.');



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