conn system/manager

create user speedage identified by speedage;

grant dba to speedage;

conn speedage/speedage;



 DROP TABLE branches; 

CREATE TABLE branches (BranchID varchar(10),RequestID varchar(10),DealerName varchar(20) ,BranchName varchar(20) ,BranchLocation varchar(20) ,Pincode varchar(10) ,BranchAddress varchar(55),PhoneNo varchar(15),CONSTRAINT Branch_ID_pk PRIMARY KEY (BranchID));



insert  into branches(BranchID,RequestID,DealerName,BranchName,BranchLocation,Pincode,BranchAddress,PhoneNo) values('B0001','R0001','Raju','RajCouriers','Hyderabad','500049','Ameerpet,Hyderabad','9954654655');
insert  into branches(BranchID,RequestID,DealerName,BranchName,BranchLocation,Pincode,BranchAddress,PhoneNo) values('B0002','R0002','Harsha','HarshaCouriers','Bangalore','560087','Koramangal,Banglore','9986967576');
insert  into branches(BranchID,RequestID,DealerName,BranchName,BranchLocation,Pincode,BranchAddress,PhoneNo) values('B0003','R0003','James','JamesCouries','Chennai','600023','BeachRoad,chennai','9883734545');
insert  into branches(BranchID,RequestID,DealerName,BranchName,BranchLocation,Pincode,BranchAddress,PhoneNo) values('B0004','R0004','Krishna','KrishnaCouriers','Hyderabad','500069','SR.Nagar,Hyderabad','65435945');
insert  into branches(BranchID,RequestID,DealerName,BranchName,BranchLocation,Pincode,BranchAddress,PhoneNo) values('B0005','R0005','Dasu','DasuInc','Mysore','570001','H.No-3/67,Mysore','9965865656');




DROP TABLE corporatemaster;

CREATE TABLE corporatemaster(CorporateId varchar(10),UserId varchar(18),Password varchar(15),CompanyName varchar(30),Address varchar(40),CompanyCode varchar(15),ActiveStatus number(1) default 1,constraint Corporate_Id_PK  PRIMARY KEY(CorporateId));





insert  into corporatemaster(CorporateId,UserId,Password,CompanyName,Address,CompanyCode,ActiveStatus) values ('CID001','kalyan','kalyan','Frendz Computers','Madapur,Hyderabad','FZC9999',1);
insert  into corporatemaster(CorporateId,UserId,Password,CompanyName,Address,CompanyCode,ActiveStatus) values ('CID002','SiriTech','SiriTech','Siri Technologies Ltd','Road No 12, Jublee Hills, Hyderabad','CCFS900A1',1);
insert  into corporatemaster(CorporateId,UserId,Password,CompanyName,Address,CompanyCode,ActiveStatus) values ('CID003','ChandanaBros','ChandanaBros','Chandana Bros','Chandana Bros, Amerpet, Hyderabad','DFU9902A1',1);
insert  into corporatemaster(CorporateId,UserId,Password,CompanyName,Address,CompanyCode,ActiveStatus) values ('CID004','suresh','suresh','Inetsolv','S R Nagar','UUY8897999S',1);




DROP TABLE dealershiprequests;

CREATE TABLE dealershiprequests (RequestID varchar(10),ApplicantName varchar(20),ApplicantAddress varchar(50),PhoneNo varchar(15) ,DateOfApply varchar(10),AmountDeposited number(10,2),BranchLocation varchar(15),OfficeAddress varchar(50),Pincode varchar(15),Status varchar(20),constraint Request_ID_PK PRIMARY KEY  (RequestID)); 


insert  into dealershiprequests(RequestID,ApplicantName,ApplicantAddress,PhoneNo,DateOfApply,AmountDeposited,BranchLocation,OfficeAddress,Pincode,Status) values ('R0001','Raju','Raju,ameerpet,hyd','9885463434','2007-12-05',50000,'Hyderabad','Ameerpet,hyderabad','500049','Granted');
insert  into dealershiprequests(RequestID,ApplicantName,ApplicantAddress,PhoneNo,DateOfApply,AmountDeposited,BranchLocation,OfficeAddress,Pincode,Status) values('R0002','Harsha','Bangalore','9986967576','2007-11-07',45000,'Banglore','Koramangal,Bangalore','000000','Granted');
insert  into dealershiprequests(RequestID,ApplicantName,ApplicantAddress,PhoneNo,DateOfApply,AmountDeposited,BranchLocation,OfficeAddress,Pincode,Status) values('R0003','James','sdfdf,dskfdsh','9833734545','2007-12-04',50000,'Chennai','shfjhd,sdfkhjk,chennai','11111','Granted');
insert  into dealershiprequests(RequestID,ApplicantName,ApplicantAddress,PhoneNo,DateOfApply,AmountDeposited,BranchLocation,OfficeAddress,Pincode,Status) values('R0004','Krishna','Krishna,hyderabad','65435945','2007-12-10',50000,'Hyderabad','SR.Nagar,Hyderabad','500069','Granted');
insert  into dealershiprequests(RequestID,ApplicantName,ApplicantAddress,PhoneNo,DateOfApply,AmountDeposited,BranchLocation,OfficeAddress,Pincode,Status) values('R0005','Dasu','Venkatesh,C/o Sunil,Mysore','9965865656','2007-12-04',50000,'Mysore','H.No-3/67,Mysore','570001','Granted');





DROP TABLE deliveries;

CREATE TABLE deliveries(DeliveryID varchar(10),CCN varchar(10),BookedAtBranch varchar(10),ShipperName varchar(15),DeliveredAtBranch varchar(20),DealerName varchar(15),DateOfDelivery varchar(10),Status varchar(15),constraint Delivery_ID_PK PRIMARY KEY  (DeliveryID));



insert  into deliveries(DeliveryID,CCN,BookedAtBranch,ShipperName,DeliveredAtBranch,DealerName,DateOfDelivery,Status) values ('D0001','99901','B0001','Jony','Koramangal,Banglore','Harsha','2007-12-22','Delivered');
insert  into deliveries(DeliveryID,CCN,BookedAtBranch,ShipperName,DeliveredAtBranch,DealerName,DateOfDelivery,Status) values ('D0002','99903','B0002','Srinu','Koramangal,Banglore','Harsha','2008-01-01','Delivered');
insert  into deliveries(DeliveryID,CCN,BookedAtBranch,ShipperName,DeliveredAtBranch,DealerName,DateOfDelivery,Status) values ('D0003','99904','B0001','Jony','Koramangal,Banglore','Harsha','2008-01-01','Delivered');




DROP TABLE dispatches;

CREATE TABLE dispatches (DispatchID varchar(10),CCN varchar(10),BranchName varchar(15),ShipperName varchar(15),PhoneNo varchar(15),SenderAddress varchar(40),ReceiverName varchar(10),RecPhoneNo varchar(15),RecAddress varchar(40),AssignedTo varchar(15),DispatcherID varchar(10),Status varchar(10),CONSTRAINT Dispatch_ID_pk PRIMARY KEY  (DispatchID));



insert  into dispatches(DispatchID,CCN,BranchName,ShipperName,PhoneNo,SenderAddress,ReceiverName,RecPhoneNo,RecAddress,AssignedTo,DispatcherID,Status) values ('D0001','99901','RajCouriers','Jony','9845435435','Jony,C/o Joseph,Ameerpet,hyderabad','James','9945454545','James,H.No22/4A-110,Koramangal,Banglore','Krishna','SA00011','Dispatched');
insert  into dispatches(DispatchID,CCN,BranchName,ShipperName,PhoneNo,SenderAddress,ReceiverName,RecPhoneNo,RecAddress,AssignedTo,DispatcherID,Status) values ('D0002','99904','RajCouriers','Jony','9800099999','Jony,Hyderabad','Subhas','988898889','Subhas,Bangalore','Krishna','SA00011','Dispatched');





DROP TABLE employeemaster;

CREATE TABLE employeemaster(EmpID varchar(10),EmployeeName varchar(15),Role varchar(15),BranchID varchar(10),BranchName varchar(20),BranchLocation varchar(21),DateOfJoin VARCHAR(10),Salary NUMBER(10,2) ,CONSTRAINT Emp_ID_pk  PRIMARY KEY  (EmpID));



insert  into employeemaster(EmpID,EmployeeName,Role,BranchID,BranchName,BranchLocation,DateOfJoin,Salary) values ('SA00011','Krishna','DeliveryBoy','B0002','HarshaCouriers','Bangalore','2007-12-20',6000);
insert  into employeemaster(EmpID,EmployeeName,Role,BranchID,BranchName,BranchLocation,DateOfJoin,Salary) values ('SA00012','Jony','DeliveryBoy','B0001','RajCouriers','Hyderabad','2007-12-21',6000);
insert  into employeemaster(EmpID,EmployeeName,Role,BranchID,BranchName,BranchLocation,DateOfJoin,Salary) values ('SA00013','James','DeliveryBoy','B0003','JamesCouriers','Chennai','2007-12-20',6000);
insert  into employeemaster(EmpID,EmployeeName,Role,BranchID,BranchName,BranchLocation,DateOfJoin,Salary) values ('SA00014','Gpoi','DeliveryBoy','B0003','JamesCouries','Chennai','2007-12-31',5000);




DROP TABLE feedback;

CREATE TABLE feedback (FId NUMBER(5),UserID varchar(27),Feedback VARCHAR(60),DateSubmitted VARCHAR(10),CONSTRAINT F_ID_PK  PRIMARY KEY(FId));


insert  into feedback(FId,UserID,Feedback,DateSubmitted) values (1,'xyz@rediffmail.com','Hi, it is very secure to send documents through this\r\n ','2007-11-19');
insert  into feedback(FId,UserID,Feedback,DateSubmitted) values (2,'Rajesh@gmail.com','Good Services are available here','2007-11-19');
insert  into feedback(FId,UserID,Feedback,DateSubmitted) values (3,'RajuSrivastav@Zapakmail.com','One best courier service that we can trust','2007-11-19');
insert  into feedback(FId,UserID,Feedback,DateSubmitted) values (7,'raj@raj.com','Good service providers in time','2007-11-19');
insert  into feedback(FId,UserID,Feedback,DateSubmitted) values (8,'Srinu@hotmail.com','Good service','2000-01-01');


DROP TABLE login;

CREATE TABLE login(UserID varchar(20),Password varchar(20),Auth NUMBER(4),CONSTRAINT User_ID_PK PRIMARY KEY(UserID));


insert  into login(UserID,Password,Auth) values ('admin','admin',0);
insert  into login(UserID,Password,Auth) values ('ChandanaBros','ChandanaBros',2);
insert  into login(UserID,Password,Auth) values ('Dasu','Dasu',1);
insert  into login(UserID,Password,Auth) values ('dealer','dealer',1);
insert  into login(UserID,Password,Auth) values ('Harsha','Harsha',1);
insert  into login(UserID,Password,Auth) values ('James','James',1);
insert  into login(UserID,Password,Auth) values ('kalyan','kalyan',2);
insert  into login(UserID,Password,Auth) values ('Krishna','Krishna',1);
insert  into login(UserID,Password,Auth) values ('Raju','Raju',1);
insert  into login(UserID,Password,Auth) values ('SiriTech','SiriTech',2);
insert  into login(UserID,Password,Auth) values ('suresh','suresh',2);


DROP TABLE consignmentbooking;

CREATE TABLE consignmentbooking (BookingID varchar(10),CCN varchar(10),ShipperName varchar(20),ShipperAddress varchar(55),PhoneNo varchar(15),MaterialDescription varchar(60),NoOfItems number(25),BranchID varchar(10),BookedAtBranch varchar(50),BranchLocation varchar(40),DateOfBooking varchar(10),Destination varchar(40),ReceiverName varchar(20),RecAddress varchar(55),RecPhoneNo varchar(15),Category varchar(20),ShipmentCharges number(10,2),Status varchar(85),CONSTRAINT Booking_ID_pk PRIMARY KEY (BookingID));

insert  into consignmentbooking(BookingID,CCN,ShipperName,ShipperAddress,PhoneNo,MaterialDescription,NoOfItems,BranchID,BookedAtBranch,BranchLocation,DateOfBooking,Destination,ReceiverName,RecAddress,RecPhoneNo,Category,ShipmentCharges,Status) values ('CB0001','99901','Jony','Jony,C/o Joseph,Ameerpet,hyderabad','9845435435','Documents',2,'B0001','RajCouriers','Hyderabad','2008-09-01','Koramangal,Banglore','James','James,H.No22/4A-110,Koramangal,Banglore','9945454545','Special',23,'Consignment Received by JosephRelation:Brother');
insert  into consignmentbooking(BookingID,CCN,ShipperName,ShipperAddress,PhoneNo,MaterialDescription,NoOfItems,BranchID,BookedAtBranch,BranchLocation,DateOfBooking,Destination,ReceiverName,RecAddress,RecPhoneNo,Category,ShipmentCharges,Status) values ('CB0002','99902','Kumar','kumar,dkgh,fdkjfgg,hyderabad','9845435455','SpecialItems',4,'B0001','RajCouriers','Hyderabad','2008-09-13','BeachRoad,chennai','Gopal','Gopal,c/o Ayyar,chennai','93444444444','Normal',72,'Booked');
insert  into consignmentbooking(BookingID,CCN,ShipperName,ShipperAddress,PhoneNo,MaterialDescription,NoOfItems,BranchID,BookedAtBranch,BranchLocation,DateOfBooking,Destination,ReceiverName,RecAddress,RecPhoneNo,Category,ShipmentCharges,Status) values ('CB0003','99903','Srinu','Srinu, Hyderabad','900000011','Documents',5,'B0002','HarshaCouriers','Bangalore','2008-09-18','Koramangal,Bangalore','Sainath','Sainath, Koramangala,Bangalore','988898889','Speed',5,'Delivered to Koramangal,Banglore Branch');
insert  into consignmentbooking(BookingID,CCN,ShipperName,ShipperAddress,PhoneNo,MaterialDescription,NoOfItems,BranchID,BookedAtBranch,BranchLocation,DateOfBooking,Destination,ReceiverName,RecAddress,RecPhoneNo,Category,ShipmentCharges,Status) values ('CB0004','99904','Jony','Jony,Hyderabad','9800099999','SpecialItems',10,'B0001','RajCouriers','Hyderabad','2008-09-20','Koramangal,Banglore','Subhas','Subhas,Bangalore','988898889','Normal',40,'Consignment Received by Ragini Relation:Wife');
insert  into consignmentbooking(BookingID,CCN,ShipperName,ShipperAddress,PhoneNo,MaterialDescription,NoOfItems,BranchID,BookedAtBranch,BranchLocation,DateOfBooking,Destination,ReceiverName,RecAddress,RecPhoneNo,Category,ShipmentCharges,Status) values ('CB0005','99905','Raju','Raju','9899890000','Documents',1000,'B0002','HarshaCouriers','Bangalore','2008-09-22','','Mani','Mani,Hyderabad','9898000000','Speed',40,'Booked');
insert  into consignmentbooking(BookingID,CCN,ShipperName,ShipperAddress,PhoneNo,MaterialDescription,NoOfItems,BranchID,BookedAtBranch,BranchLocation,DateOfBooking,Destination,ReceiverName,RecAddress,RecPhoneNo,Category,ShipmentCharges,Status) values ('CB0006','99906','active','active','9899899990','Documents',1000,'B0003','HarshaCouriers','Bangalore','2008-09-22','','Mani','Mani,Hyderabad','9898000000','Speed',40,'Booked');





DROP TABLE materialparticulars;

CREATE TABLE materialparticulars(MaterialID varchar(10),CCN varchar(10),MaterialDescription varchar(20),NoOfItems number(10),TotalWeight number(10,2),Category  varchar(20),ShipmentCharges number(10,2),CorporateId varchar(10),Constraint Material_ID_PK PRIMARY KEY(MaterialID));


insert  into materialparticulars(MaterialID,CCN,MaterialDescription,NoOfItems,TotalWeight,Category,ShipmentCharges,CorporateId) values ('M0001','99901','Documents',2,500,'Special',23,'CID001');
insert  into materialparticulars(MaterialID,CCN,MaterialDescription,NoOfItems,TotalWeight,Category,ShipmentCharges,CorporateId) values ('M0002','99902','SpecialItems',4,1800,'Normal',72,'0');
insert  into materialparticulars(MaterialID,CCN,MaterialDescription,NoOfItems,TotalWeight,Category,ShipmentCharges,CorporateId) values ('M0003','99903','Documents',5,100,'Speed',5,'CID002');
insert  into materialparticulars(MaterialID,CCN,MaterialDescription,NoOfItems,TotalWeight,Category,ShipmentCharges,CorporateId) values ('M0004','99904','SpecialItems',10,1000,'Normal',40,'CID001');
insert  into materialparticulars(MaterialID,CCN,MaterialDescription,NoOfItems,TotalWeight,Category,ShipmentCharges,CorporateId) values ('M0005','99905','Documents',1000,1000,'Speed',40,'CID002');
insert  into materialparticulars(MaterialID,CCN,MaterialDescription,NoOfItems,TotalWeight,Category,ShipmentCharges,CorporateId) values ('M0006','99906','Documents',1000,1000,'Speed',40,'CID006');

DROP TABLE receivers;

CREATE TABLE receivers (ReceiversID varchar(10),CCN varchar(10),ReceiversName varchar(20),ReceiversPhoneNo varchar(15),BookedAt varchar(15),MaterialDescription varchar(20),NoOfItems number(10),DateOfReceive varchar(10),NameOfReceiver varchar(20),Relation varchar(20),DispatcherName varchar(20),DispatcherID varchar(10),CONSTRAINT Receivers_ID_PK  PRIMARY KEY(ReceiversID));



insert  into receivers(ReceiversID,CCN,ReceiversName,ReceiversPhoneNo,BookedAt,MaterialDescription,NoOfItems,DateOfReceive,NameOfReceiver,Relation,DispatcherName,DispatcherID) values ('D0001','99901','James','9945454545','RajCouriers','Documents',2,'2007-12-22','Joseph','Brother','Krishna','SA00011');
insert  into receivers(ReceiversID,CCN,ReceiversName,ReceiversPhoneNo,BookedAt,MaterialDescription,NoOfItems,DateOfReceive,NameOfReceiver,Relation,DispatcherName,DispatcherID) values ('D0002','99904','Subhas','988898889','RajCouriers','SpecialItems',10,'2008-01-02','Ragini','Wife','Krishna','SA00011');



