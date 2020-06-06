/*
SQLyog Community Edition- MySQL GUI v5.23 RC2
Host - 4.0.18-nt : Database - CourierSystem
*********************************************************************
Server version : 4.0.18-nt
*/


create database if not exists `CourierSystem`;

USE `CourierSystem`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `branches` */

DROP TABLE IF EXISTS `branches`;

CREATE TABLE `branches` (
  `BranchID` varchar(100) NOT NULL default '',
  `RequestID` varchar(100) NOT NULL default '',
  `DealerName` varchar(100) default NULL,
  `BranchName` varchar(50) NOT NULL default '',
  `BranchLocation` varchar(100) default NULL,
  `Pincode` varchar(100) default NULL,
  `BranchAddress` varchar(150) default NULL,
  `PhoneNo` varchar(50) default NULL,
  PRIMARY KEY  (`BranchID`)
) TYPE=MyISAM;

/*Data for the table `branches` */

insert  into `branches`(`BranchID`,`RequestID`,`DealerName`,`BranchName`,`BranchLocation`,`Pincode`,`BranchAddress`,`PhoneNo`) values ('B0001','R0001','Raju','RajCouriers','Hyderabad','500049','Ameerpet,Hyderabad','9954654655'),('B0002','R0002','Harsha','HarshaCouriers','Bangalore','560087','Koramangal,Banglore','9986967576'),('B0003','R0003','James','JamesCouries','Chennai','600023','BeachRoad,chennai','9883734545'),('B0004','R0004','Krishna','KrishnaCouriers','Hyderabad','500069','SR.Nagar,Hyderabad','65435945'),('B0005','R0005','Dasu','Dasu Inc','Mysore','570001','H.No-3/67,Mysore','9965865656');

/*Table structure for table `consignmentbooking` */

DROP TABLE IF EXISTS `consignmentbooking`;

CREATE TABLE `consignmentbooking` (
  `BookingID` varchar(100) NOT NULL default '',
  `CCN` varchar(100) NOT NULL default '',
  `ShipperName` varchar(50) default NULL,
  `ShipperAddress` varchar(100) default NULL,
  `PhoneNo` varchar(50) default NULL,
  `MaterialDescription` varchar(100) default NULL,
  `NoOfItems` int(50) default NULL,
  `BranchID` varchar(100) default NULL,
  `BookedAtBranch` varchar(100) default NULL,
  `BranchLocation` varchar(100) default NULL,
  `DateOfBooking` date default NULL,
  `Destination` varchar(100) default NULL,
  `ReceiverName` varchar(100) default NULL,
  `RecAddress` varchar(100) default NULL,
  `RecPhoneNo` varchar(100) default NULL,
  `Category` varchar(100) default NULL,
  `ShipmentCharges` float default NULL,
  `Status` varchar(100) default NULL,
  PRIMARY KEY  (`BookingID`)
) TYPE=MyISAM;

/*Data for the table `consignmentbooking` */

insert  into `consignmentbooking`(`BookingID`,`CCN`,`ShipperName`,`ShipperAddress`,`PhoneNo`,`MaterialDescription`,`NoOfItems`,`BranchID`,`BookedAtBranch`,`BranchLocation`,`DateOfBooking`,`Destination`,`ReceiverName`,`RecAddress`,`RecPhoneNo`,`Category`,`ShipmentCharges`,`Status`) values ('CB0001','99901','Jony','Jony,C/o Joseph,Ameerpet,hyderabad','9845435435','Documents',2,'B0001','RajCouriers','Hyderabad','2007-12-21','Koramangal,Banglore','James','James,H.No22/4A-110,Koramangal,Banglore','9945454545','Special',23,'Consignment Received by Joseph Relation:Brother'),('CB0002','99902','Kumar','kumar,dkgh,fdkjfgg,hyderabad','9845435455','SpecialItems',4,'B0001','RajCouriers','Hyderabad','2007-12-20','BeachRoad,chennai','Gopal','Gopal,c/o Ayyar,chennai','93444444444','Normal',72,'Booked'),('CB0003','99903','Srinu','Srinu, Hyderabad','900000011','Documents',5,'B0002','HarshaCouriers','Bangalore','2007-12-31','Koramangal,Bangalore','Sainath','Sainath, Koramangala,Bangalore','988898889','Speed',5,'Delivered to Koramangal,Banglore Branch'),('CB0004','99904','Jony','Jony,Hyderabad','9800099999','SpecialItems',10,'B0001','RajCouriers','Hyderabad','2007-12-24','Koramangal,Banglore','Subhas','Subhas,Bangalore','988898889','Normal',40,'Consignment Received by Ragini Relation:Wife'),('CB0005','99905','Raju','Raju','9899890000','Documents',1000,'B0002','HarshaCouriers','Bangalore','2000-01-31','','Mani','Mani,Hyderabad','9898000000','Speed',40,'Booked');

/*Table structure for table `corporatemaster` */

DROP TABLE IF EXISTS `corporatemaster`;

CREATE TABLE `corporatemaster` (
  `CorporateId` varchar(50) NOT NULL default '0',
  `UserId` varchar(50) NOT NULL default '',
  `Password` varchar(50) default NULL,
  `CompanyName` varchar(100) default NULL,
  `Address` tinytext,
  `CompanyCode` varchar(100) default NULL,
  `ActiveStatus` int(1) default '1',
  PRIMARY KEY  (`CorporateId`)
) TYPE=MyISAM;

/*Data for the table `corporatemaster` */

insert  into `corporatemaster`(`CorporateId`,`UserId`,`Password`,`CompanyName`,`Address`,`CompanyCode`,`ActiveStatus`) values ('CID001','kalyan','kalyan','Frendz Computers','Madapur,Hyderabad','FZC9999',1),('CID002','SiriTech','SiriTech','Siri Technologies Ltd','Road No 12, Jublee Hills, Hyderabad','CCFS900A1',1),('CID003','ChandanaBros','ChandanaBros','Chandana Bros','Chandana Bros, Amerpet, Hyderabad','DFU9902A1',1),('CID004','suresh','suresh','Inetsolv','S R Nagar','UUY8897999S',1);

/*Table structure for table `dealershiprequests` */

DROP TABLE IF EXISTS `dealershiprequests`;

CREATE TABLE `dealershiprequests` (
  `RequestID` varchar(100) NOT NULL default '',
  `ApplicantName` varchar(100) NOT NULL default '',
  `ApplicantAddress` varchar(150) default NULL,
  `PhoneNo` varchar(100) default NULL,
  `DateOfApply` date default NULL,
  `AmountDeposited` float default NULL,
  `BranchLocation` varchar(150) default NULL,
  `OfficeAddress` varchar(100) default NULL,
  `Pincode` varchar(100) default NULL,
  `Status` varchar(100) default NULL,
  PRIMARY KEY  (`RequestID`)
) TYPE=MyISAM;

/*Data for the table `dealershiprequests` */

insert  into `dealershiprequests`(`RequestID`,`ApplicantName`,`ApplicantAddress`,`PhoneNo`,`DateOfApply`,`AmountDeposited`,`BranchLocation`,`OfficeAddress`,`Pincode`,`Status`) values ('R0001','Raju','Raju,ameerpet,hyd','9885463434','2007-12-05',50000,'Hyderabad','Ameerpet,hyderabad','500049','Granted'),('R0002','Harsha','Bangalore','9986967576','2007-11-07',45000,'Banglore','Koramangal,Bangalore','000000','Granted'),('R0003','James','sdfdf,dskfdsh','9833734545','2007-12-04',50000,'Chennai','shfjhd,sdfkhjk,chennai','11111','Granted'),('R0004','Krishna','Krishna,hyderabad','65435945','2007-12-10',50000,'Hyderabad','SR.Nagar,Hyderabad','500069','Granted'),('R0005','Dasu','Venkatesh,C/o Sunil,Mysore','9965865656','2007-12-04',50000,'Mysore','H.No-3/67,Mysore','570001','Granted');

/*Table structure for table `deliveries` */

DROP TABLE IF EXISTS `deliveries`;

CREATE TABLE `deliveries` (
  `DeliveryID` varchar(100) NOT NULL default '',
  `CCN` varchar(100) default NULL,
  `BookedAtBranch` varchar(100) default NULL,
  `ShipperName` varchar(100) default NULL,
  `DeliveredAtBranch` varchar(100) default NULL,
  `DealerName` varchar(100) default NULL,
  `DateOfDelivery` varchar(100) default NULL,
  `Status` varchar(100) default NULL,
  PRIMARY KEY  (`DeliveryID`)
) TYPE=MyISAM;

/*Data for the table `deliveries` */

insert  into `deliveries`(`DeliveryID`,`CCN`,`BookedAtBranch`,`ShipperName`,`DeliveredAtBranch`,`DealerName`,`DateOfDelivery`,`Status`) values ('D0001','99901','B0001','Jony','Koramangal,Banglore','Harsha','2007-12-22','Delivered'),('D0002','99903','B0002','Srinu','Koramangal,Banglore','Harsha','2008-01-01','Delivered'),('D0003','99904','B0001','Jony','Koramangal,Banglore','Harsha','2008-01-01','Delivered');

/*Table structure for table `dispatches` */

DROP TABLE IF EXISTS `dispatches`;

CREATE TABLE `dispatches` (
  `DispatchID` varchar(100) NOT NULL default '',
  `CCN` varchar(100) default NULL,
  `BranchName` varchar(100) default NULL,
  `ShipperName` varchar(100) default NULL,
  `PhoneNo` varchar(100) default NULL,
  `SenderAddress` varchar(100) default NULL,
  `ReceiverName` varchar(100) default NULL,
  `RecPhoneNo` varchar(100) default NULL,
  `RecAddress` varchar(100) default NULL,
  `AssignedTo` varchar(100) default NULL,
  `DispatcherID` varchar(100) default NULL,
  `Status` varchar(100) default NULL,
  PRIMARY KEY  (`DispatchID`)
) TYPE=MyISAM;

/*Data for the table `dispatches` */

insert  into `dispatches`(`DispatchID`,`CCN`,`BranchName`,`ShipperName`,`PhoneNo`,`SenderAddress`,`ReceiverName`,`RecPhoneNo`,`RecAddress`,`AssignedTo`,`DispatcherID`,`Status`) values ('D0001','99901','RajCouriers','Jony','9845435435','Jony,C/o Joseph,Ameerpet,hyderabad','James','9945454545','James,H.No22/4A-110,Koramangal,Banglore','Krishna','SA00011','Dispatched'),('D0002','99904','RajCouriers','Jony','9800099999','Jony,Hyderabad','Subhas','988898889','Subhas,Bangalore','Krishna','SA00011','Dispatched');

/*Table structure for table `employeemaster` */

DROP TABLE IF EXISTS `employeemaster`;

CREATE TABLE `employeemaster` (
  `EmpID` varchar(100) NOT NULL default '',
  `EmployeeName` varchar(100) NOT NULL default '',
  `Role` varchar(100) default NULL,
  `BranchID` varchar(100) default NULL,
  `BranchName` varchar(100) default NULL,
  `BranchLocation` varchar(100) default NULL,
  `DateOfJoin` date default NULL,
  `Salary` float default NULL,
  PRIMARY KEY  (`EmpID`)
) TYPE=MyISAM;

/*Data for the table `employeemaster` */

insert  into `employeemaster`(`EmpID`,`EmployeeName`,`Role`,`BranchID`,`BranchName`,`BranchLocation`,`DateOfJoin`,`Salary`) values ('SA00011','Krishna','DeliveryBoy','B0002','HarshaCouriers','Bangalore','2007-12-20',6000),('SA00012','Jony','DeliveryBoy','B0001','RajCouriers','Hyderabad','2007-12-21',6000),('SA00013','James','DeliveryBoy','B0003','JamesCouriers','Chennai','2007-12-20',6000),('SA00014','Gpoi','DeliveryBoy','B0003','JamesCouries','Chennai','2007-12-31',5000);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `FId` int(10) NOT NULL auto_increment,
  `UserID` varchar(100) default NULL,
  `Feedback` text,
  `DateSubmitted` date default NULL,
  PRIMARY KEY  (`FId`)
) TYPE=MyISAM;

/*Data for the table `feedback` */

insert  into `feedback`(`FId`,`UserID`,`Feedback`,`DateSubmitted`) values (1,'xyz@rediffmail.com','Hi, it is very secure to send documents through this\r\n ','2007-11-19'),(2,'Rajesh@gmail.com','Good Services are available here','2007-11-19'),(3,'RajuSrivastav@Zapakmail.com','One best courier service that we can trust','2007-11-19'),(7,'raj@raj.com','Good service providers in time','2007-11-19'),(8,'Srinu@hotmail.com','Good service','2000-01-01');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `UserID` varchar(50) NOT NULL default '',
  `Password` varchar(50) NOT NULL default '',
  `Auth` int(11) NOT NULL default '0',
  PRIMARY KEY  (`UserID`)
) TYPE=MyISAM;

/*Data for the table `login` */

insert  into `login`(`UserID`,`Password`,`Auth`) values ('admin','admin',0),('ChandanaBros','ChandanaBros',2),('Dasu','Dasu',1),('dealer','dealer',1),('Harsha','Harsha',1),('James','James',1),('kalyan','kalyan',2),('Krishna','Krishna',1),('Raju','Raju',1),('SiriTech','SiriTech',2),('suresh','suresh',2);

/*Table structure for table `materialparticulars` */

DROP TABLE IF EXISTS `materialparticulars`;

CREATE TABLE `materialparticulars` (
  `MaterialID` varchar(100) NOT NULL default '',
  `CCN` varchar(100) default NULL,
  `MaterialDescription` varchar(100) default NULL,
  `NoOfItems` int(10) default NULL,
  `TotalWeight` int(10) default NULL,
  `Category` varchar(20) default NULL,
  `ShipmentCharges` float default NULL,
  `CorporateId` varchar(50) default '0',
  PRIMARY KEY  (`MaterialID`)
) TYPE=MyISAM;

/*Data for the table `materialparticulars` */

insert  into `materialparticulars`(`MaterialID`,`CCN`,`MaterialDescription`,`NoOfItems`,`TotalWeight`,`Category`,`ShipmentCharges`,`CorporateId`) values ('M0001','99901','Documents',2,500,'Special',23,'CID001'),('M0002','99902','SpecialItems',4,1800,'Normal',72,'0'),('M0003','99903','Documents',5,100,'Speed',5,'CID002'),('M0004','99904','SpecialItems',10,1000,'Normal',40,'CID001'),('M0005','99905','Documents',1000,1000,'Speed',40,'CID002');

/*Table structure for table `receivers` */

DROP TABLE IF EXISTS `receivers`;

CREATE TABLE `receivers` (
  `ReceiversID` varchar(100) NOT NULL default '',
  `CCN` varchar(50) NOT NULL default '',
  `ReceiversName` varchar(100) default NULL,
  `ReceiversPhoneNo` varchar(100) default NULL,
  `BookedAt` varchar(100) default NULL,
  `MaterialDescription` varchar(100) default NULL,
  `NoOfItems` int(50) default NULL,
  `DateOfReceive` date default NULL,
  `NameOfReceiver` varchar(100) default NULL,
  `Relation` varchar(100) default NULL,
  `DispatcherName` varchar(100) default NULL,
  `DispatcherID` varchar(100) default NULL,
  PRIMARY KEY  (`ReceiversID`)
) TYPE=MyISAM;

/*Data for the table `receivers` */

insert  into `receivers`(`ReceiversID`,`CCN`,`ReceiversName`,`ReceiversPhoneNo`,`BookedAt`,`MaterialDescription`,`NoOfItems`,`DateOfReceive`,`NameOfReceiver`,`Relation`,`DispatcherName`,`DispatcherID`) values ('D0001','99901','James','9945454545','RajCouriers','Documents',2,'2007-12-22','Joseph','Brother','Krishna','SA00011'),('D0002','99904','Subhas','988898889','RajCouriers','SpecialItems',10,'2008-01-02','Ragini','Wife','Krishna','SA00011');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;