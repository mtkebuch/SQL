USE [master]
GO
/****** Object:  Database [SchoolDB]    Script Date: 3/6/2025 8:02:44 PM ******/
CREATE DATABASE [SchoolDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchoolDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER06\MSSQL\DATA\SchoolDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SchoolDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER06\MSSQL\DATA\SchoolDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SchoolDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SchoolDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SchoolDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SchoolDB] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchoolDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchoolDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SchoolDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SchoolDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SchoolDB', N'ON'
GO
ALTER DATABASE [SchoolDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SchoolDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SchoolDB]
GO
/****** Object:  UserDefinedFunction [dbo].[GetClassName]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetClassName](@ClassID INT)
RETURNS VARCHAR(100)
AS
BEGIN
    RETURN (SELECT ClassName FROM Classes WHERE ClassID = @ClassID);
END;
GO
/****** Object:  UserDefinedFunction [dbo].[marik]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[marik](@classid int)
returns int
as
begin
return (select subjectid from classes where classid=@classid)
end
GO
/****** Object:  UserDefinedFunction [dbo].[myfunc]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[myfunc]()
returns int 
as
begin
return (select count(*) from students)
end
GO
/****** Object:  UserDefinedFunction [dbo].[myfunc1]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[myfunc1](@teacherid int)
returns varchar(100)
as
begin
return(select subject from teachers where teacherid=@teacherid)
end
GO
/****** Object:  UserDefinedFunction [dbo].[newfunc]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[newfunc]()
returns int 
as
begin
return (select count(*)from students)
end
GO
/****** Object:  UserDefinedFunction [dbo].[newfunc22]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[newfunc22](@grade varchar(10))
returns int
as
begin
return(select age from students where grade=@grade)
end

GO
/****** Object:  UserDefinedFunction [dbo].[ssfunc]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ssfunc](@studentid int)
returns varchar(100)
as
begin
return (select name from students where studentid=@studentid)
end

GO
/****** Object:  UserDefinedFunction [dbo].[teachersname]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[teachersname](@teacherid int)
returns varchar(100)
as
begin
return (select name from teachers where teacherid=@teacherid)
end
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Subject] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](100) NULL,
	[TeacherID] [int] NULL,
	[SubjectID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TeacherSubjectView]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TeacherSubjectView] AS
SELECT Teachers.Name AS TeacherName, Subjects.SubjectName
FROM Teachers
JOIN Classes ON Teachers.TeacherID = Classes.TeacherID
JOIN Subjects ON Classes.SubjectID = Subjects.SubjectID;
GO
/****** Object:  View [dbo].[classnsub]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[classnsub] as
select classes.classname,subjects.subjectname
from classes
join subjects
on subjects.subjectid=classes.SubjectID
GO
/****** Object:  View [dbo].[teachcl]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[teachcl] as
select classes.classname,teachers.name
from classes
join teachers
on Classes.teacherid=Teachers.TeacherID
GO
/****** Object:  View [dbo].[teachermath]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[teachermath] as
select name 
from teachers
where teacherid=1
GO
/****** Object:  View [dbo].[subssanclass]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[subssanclass] as
select subjects.subjectname,classes.classname
from subjects
join classes
on subjects.SubjectID=Classes.SubjectID
GO
/****** Object:  UserDefinedFunction [dbo].[myfunk]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[myfunk](@teacherid int)
returns table
as

return (select name,subject from teachers where teacherid=@teacherid)

GO
/****** Object:  UserDefinedFunction [dbo].[myfunk111]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[myfunk111]()
returns table
as
return (select name,subject from teachers)

GO
/****** Object:  UserDefinedFunction [dbo].[maribari]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[maribari](@classid int)
returns table
as
return (select classname,teacherid from classes where classid=@classid)

GO
/****** Object:  UserDefinedFunction [dbo].[maribari1]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[maribari1]()
returns table
as
return (select classname,teacherid from classes )
GO
/****** Object:  Table [dbo].[StudentClasses]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentClasses](
	[StudentClassID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[ClassID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Age] [int] NULL,
	[Grade] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([TeacherID])
GO
ALTER TABLE [dbo].[StudentClasses]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
GO
ALTER TABLE [dbo].[StudentClasses]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
/****** Object:  StoredProcedure [dbo].[insert_Subjects]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insert_Subjects]
@subjectname varchar (100)
as
begin
insert into subjects(subjectname)
values (@subjectname)
end
GO
/****** Object:  StoredProcedure [dbo].[studentsins]    Script Date: 3/6/2025 8:02:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[studentsins]
@name varchar(100),
@Age int
as
begin
insert into students(name,age)
values (@name,@age)
end
GO
USE [master]
GO
ALTER DATABASE [SchoolDB] SET  READ_WRITE 
GO
