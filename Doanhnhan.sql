CREATE DATABASE QuanLyNhanvien
USE QuanLyNhanvien

CREATE TABLE DOANHNHAN(
 MaDN CHAR(2) NOT NULL PRIMARY KEY, 
 TenDN nvarchar(40)
)


CREATE TABLE NHANVIEN
(
    MaNV CHAR(4) NOT NULL PRIMARY KEY,
    TenNV nvarchar(150) NOT NULL,
    GT nvarchar(10),
	NamSinh CHAR(4),
	MaDN CHAR(2), 
	Constraint fk_DN FOREIGN Key(MaDN)references DOANHNHAN(MaDN)
)

CREATE TABLE Users(
 TenTK nvarchar(25) primary key,
 MatKhau nvarchar(25)
)




insert into DOANHNHAN values('KD',N'Kinh doanh')
insert into DOANHNHAN values('KT',N'Kế toán')
insert into DOANHNHAN values('NS',N'Nhân sự')
insert into DOANHNHAN values('IT',N'Công nghệ Thông tin')
insert into DOANHNHAN values('MK',N'Marketing')
GO


INSERT INTO NHANVIEN VALUES('MV01', N'Trần Thị Phượng', N'Nữ','1997','KD')
INSERT INTO NHANVIEN VALUES('MV02', N'Nguyễn Hào Nam', N'Nam','2003','KT')
INSERT INTO NHANVIEN VALUES('MV03', N'Nguyễn Trần Ngọc Thu', N'Nữ','2000','IT')
INSERT INTO NHANVIEN VALUES('MV04', N'Mạch Quốc Bảo', N'Nam','2001','MK')
GO


insert into Users(TenTK, MatKhau) values('admin','123456')
insert into Users(TenTK, MatKhau) values('nguoidung','121412')
insert into Users(TenTK, MatKhau) values('cavang','020202')



CREATE PROCEDURE Usp_InsertNHANVIEN

	@PMaNV char(4), 
	@PTenNV nvarchar(100),
	@PGT nvarchar(10),
	@PNamSinh char(4),
	@PMaDN CHAR(2)
AS
BEGIN

	INSERT INTO NHANVIEN VALUES(@PMaNV,@PTenNV,@PGT,@PNamSinh,@PMaDN)
END


CREATE PROCEDURE Usp_DeleteNHANVIEN

	@PMaNV char(4) 
AS
BEGIN

	DELETE FROM NHANVIEN WHERE MaNV=@PMaNV
END

CREATE PROCEDURE Usp_UpdateNHANVIEN

	@PMaNV char(4), 
	@PTenNV nvarchar(100),
	@PGT nvarchar(10),
	@PNamSinh char(4),
	@PMaDN CHAR(2)
AS
BEGIN

	UPDATE NHANVIEN SET TenNV=@PTenNV, GT=@PGT, NamSinh=@PNamSinh,MaDN=@PMaDN WHERE MaNV=@PMaNV
END

CREATE PROCEDURE Usp_SelectAllNHANVIEN

AS
BEGIN

	SELECT * FROM NHANVIEN
END
