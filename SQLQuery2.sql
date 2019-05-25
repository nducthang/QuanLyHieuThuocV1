create database QuanLyCuaHangThuoc_V2
go

use QuanLyCuaHangThuoc_V2
go

create table CuaHang
(
IdCuaHang int identity(1,1) primary key,
TenCuaHang nvarchar(200) not null,
DiaChi nvarchar(max)
)
go
insert into CuaHang values
(N'Chi nhánh Thanh Trì','Thanh Trì, Hà Nội')
go

create table DonVi
(
IdDonVi int identity(1,1) primary key,
TenDonVi nvarchar(100) not null
)
go

create table Thuoc
(
IdThuoc int identity(1,1) primary key,
TenThuoc nvarchar(200) not null,
HanSuDung Datetime,
SoLuong int default 0,
IdDonVi int,
GiaNhap money default 0,
GiaBan money default 0,
GhiChu nvarchar(max),
foreign key (IdDonVi) references DonVi(IdDonVi)
)
go

create table TaiKhoan
(
IdTaiKhoan int identity(1,1) primary key,
TenDangNhap nvarchar(200) not null,
TenHienThi nvarchar(200),
SoDienThoai nvarchar(100),
IdCuaHang int,
MatKhau nvarchar(max) not null,
foreign key (IdCuaHang) references CuaHang(IdCuaHang)
)
go

insert TaiKhoan values
(N'vietbuzz',N'Nguyen Duc Thang',N'0982828997',1,N'db69fc039dcbd2962cb4d28f5891aae1')
go

create table PhieuNhapKho
(
IdPhieuNhapKho int identity(1,1) primary key,
NgayNhap Datetime not null
)
go

create table ChiTietPhieuNhapKho
(
IdChitietPhieuNhapKho int identity(1,1) primary key,
IdPhieuNhapKho int,
IdThuoc int,
SoLuongNhap int,
foreign key (IdPhieuNhapKho) references PhieuNhapKho(IdPhieuNhapKho),
foreign key (IdThuoc) references Thuoc(IdThuoc)
)
go

create table DonBanHang
(
IdDonBanHang int identity(1,1) primary key,
NgayBan Datetime not null,
IdCuaHang int,
foreign key (IdCuaHang) references CuaHang(IdCuaHang)
)
go

create table ChiTietDonBanHang
(
IdChiTietDonBanHang int identity(1,1) primary key,
IdDonBanHang int,
IdThuoc int,
SoLuongBan int,
foreign key (IdDonBanHang) references DonBanHang(IdDonBanHang),
foreign key (IdThuoc) references Thuoc(IdThuoc)
)
go
