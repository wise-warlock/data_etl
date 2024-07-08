-- create database ElectronicCompany

create table Supplier(
	SupNum int not null,
	SupName nvarchar(255) not null,
	SupPhone varchar(11) UNIQUE CHECK(SupPhone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR SupPhone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
	SupEmail nvarchar(50) CHECK(SupEmail LIKE '%@gmail.com') not null,
	primary key(SupNum)
)
create table Product(
	ProdNum int not null,
	ProdName nvarchar(255) not null,
	ProdCategory nvarchar(50) not null,
	ProdPrice decimal not null,
	ProdImportPrice decimal not null, 
	SupNum int not null,
	primary key(ProdNum),
	foreign key (SupNum) references Supplier(SupNum)
)
create table Storage(
	StgNum int not null,
	StgLocation nvarchar(50) not null,
	primary key(StgNum)
)
create table Departments(
	DepNum int not null,
	DepName nvarchar(255) not null,
	MgrSSn decimal ,
	MgrAssDate date ,
	primary key(DepNum)
)
create table Employee(
	EmpSSN decimal not null,
	EmpNAme nvarchar(255) not null,
	EmpSex char(1) CHECK(EmpSex IN('F','M')) not null,
	EmpBOD date not null,
	EmpAddress nvarchar(255) not null,
	EmpEmail nvarchar(50) CHECK(EmpEmail LIKE '%@gmail.com') not null,
	EmpPhone varchar(11) UNIQUE CHECK(EmpPhone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR EmpPhone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
	EmpSalary decimal not null,
	EmpRole nvarchar(20) not null,
	SupervisorSSN decimal ,
	Depnum int not null,
	EmpStartDate date not null,
	primary key(EmpSSN),
	foreign key (Depnum) references Departments(Depnum),
	foreign key (SupervisorSSN) references Employee(EmpSSN)
)
create table Store(
	StoNum int not null,
	StoLocation nvarchar(255) not null,
	MgrSSN decimal not null,
	MgrAssDate date not null,
	StrOpenDate date ,
	primary key(StoNum),
	foreign key(MgrSSN) references Employee(EmpSSN)
)
create table StoreAssignment(
	AssignmentNo nvarchar(30) not null,
	StoNum int not null,
	EmpSSN decimal not null,
	StartDate date not null,
	primary key (AssignmentNo),
	foreign key (StoNum) references Store(StoNum),
	foreign key (EmpSSN) references Employee(EmpSSN)
)
create table Customer(
	CusSSN decimal not null,
	CusName nvarchar(255) not null,
	CusSex char(1) CHECK(CusSex IN('F','M')) not null,
	CusBOD date not null,
	CusEmail nvarchar(50) CHECK(CusEmail LIKE '%@gmail.com') not null,
	CusPhone varchar(11) UNIQUE CHECK(CusPhone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR CusPhone LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
	CusAddress nvarchar(255) not  null,
	primary key(CusSSN)
	
)
create table Invoices(
	InvNum int not null,
	CusSSN decimal not null,
	EmpSSn decimal not null,
	StoNum int not null,
	BuyDate date not null,
	primary key (InvNum),
	foreign key(CusSSN) references Customer(CusSSN),
	foreign key(EmpSSN) references Employee(EmpSSN),
	foreign key(StoNum) references Store(StoNum)
)
create table DetailedInvoices(
	InvNum int not null,
	ProdNum int not null,
	Amount int not null,
	primary key (InvNum,ProdNum),
	foreign key (ProdNum) references Product(ProdNum),
	foreign key (InvNum) references Invoices(InvNum)
)
create table Import(	
	ImportNum int not null,
	StoNum int not null,
	StgNum int not null,
	ProdNum int not null,
	Amount int not null,
	ImportDate date not null,
	primary key(ImportNum),
	foreign key (ProdNum) references Product(ProdNum),
	foreign key (StgNum) references Storage(StgNum),
	foreign key (StoNum) references Store(StoNum)
)
create table Export(
	ExportNum int not null,
	StgNum int not null,
	SupNum int not null,
	ProdNum int not null,
	Amount int not null,
	ExportDate date not null,
	primary key(ExportNum),
    foreign key (ProdNum) references Product(ProdNum),
	foreign key (StgNum) references Storage(StgNum),
	foreign key (SupNum ) references Supplier(SupNum )
)
create table ProdStorage(
	StgNum int not null,
	ProdNum int not null,
	Amount int not null,
	primary key (StgNum,ProdNum),
	foreign key (ProdNum) references Product(ProdNum),
	foreign key (StgNum) references Storage(StgNum)
)
create table ProdStore(
	StoNum int not null,
	ProdNum int not null,
	Amount int not null,
	primary key(StoNum,ProdNum),
    foreign key (StoNum) references Store(StoNum),
    foreign key (ProdNum) references Product(ProdNum)
)









