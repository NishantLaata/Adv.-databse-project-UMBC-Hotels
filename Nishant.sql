drop sequence C_ID_seq;
drop sequence R_ROOM_ID_seq;
drop sequence H_ID_SEQ;
drop sequence S_ID_SEQ;
drop sequence R_ID_SEQ;
drop sequence B_ID_seq;
drop sequence M_ID_seq;

drop Trigger Customer_ID_increment;
drop trigger rooms_ID_increment;
drop trigger Hotel_ID_increment;
drop trigger Services_ID_increment;
Drop trigger Reservation_ID_increment;
drop trigger billings_ID_increment;
drop trigger mappings_ID_increment;

drop table Mappings;
drop table billing;
drop table reservation;
drop table services;
drop table hotel;
drop table rooms;
drop table Customer_Details;


create table Customer_Details(
C_Id integer primary key,
C_FName varchar(50) not null,
C_LName varchar(50) not null,
C_Address varchar(250) not null,
C_PhoneNO int not null,
C_Gender varchar(50),
C_DOB date,
C_Nationality varchar(50) not null,
C_CardDetails int not null,
C_VarificationId varchar(50)
);


create sequence C_ID_seq;
/* creating triggers */

CREATE OR REPLACE TRIGGER Customer_ID_increment -- creating trigger for auto incrementation of primary key
  BEFORE INSERT ON customer_details
  FOR EACH ROW
BEGIN
  SELECT C_ID_seq.nextval
  INTO :new.C_ID
  FROM dual;
END;
/

insert into Customer_Details(C_FName,C_LName,C_Address,C_PhoneNO,C_Gender,C_DOB,C_Nationality,C_CardDetails,C_VarificationId)
values ('John','Smith','Sydney',18965567890,'M',date'1992-07-02','Australian','222245432162','Passport');
insert into Customer_Details(C_FName,C_LName,C_Address,C_PhoneNO,C_Gender,C_DOB,C_Nationality,C_CardDetails,C_VarificationId)
values ('Mary','Wise','MD',1220567123,'F',date'1980-06-20','African','2222222222','Passport');
insert into Customer_Details(C_FName,C_LName,C_Address,C_PhoneNO,C_Gender,C_DOB,C_Nationality,C_CardDetails,C_VarificationId)
values ('Arnold','Patterson','MD',1220567123,'M',date'1980-06-22','Canada','2222222222','Passport');
insert into Customer_Details(C_FName,C_LName,C_Address,C_PhoneNO,C_Gender,C_DOB,C_Nationality,C_CardDetails,C_VarificationId)
values ('John','Potter','Virgina',1234567890,'M',date '1990-4-2','American','222245673462','Passport');
insert into Customer_Details(C_FName,C_LName,C_Address,C_PhoneNO,C_Gender,C_DOB,C_Nationality,C_CardDetails,C_VarificationId)
values ('Sophie','Willam','Boston',2345678910,'F',date'1980-05-05','American','222345673462','Driving License');



select * from Customer_Details;




create table Rooms(
R_Room_Id int primary key not null,
R_Room_Type varchar (100) not null,
R_Room_Rate float(100),
R_Room_Amenities varchar (100) not null);


create sequence R_Room_ID_seq;


CREATE OR REPLACE TRIGGER rooms_ID_increment  -- creating trigger for auto incrementation of primary key
  BEFORE INSERT ON rooms
  FOR EACH ROW
BEGIN
  SELECT R_Room_ID_seq.nextval
  INTO :new.R_Room_ID
  FROM dual;
END;
/
insert into Rooms(R_Room_Type ,R_Room_Rate,R_Room_Amenities) values ('Single','100.0','AC Available');
insert into Rooms(R_Room_Type ,R_Room_Rate,R_Room_Amenities) values ('Double','200.0','Extra children bed,AC Available');
insert into Rooms(R_Room_Type ,R_Room_Rate,R_Room_Amenities) values ('Suite','500.0','Fridge,Sofa,AC Available');
insert into Rooms(R_Room_Type ,R_Room_Rate,R_Room_Amenities) values ('Conference Room','1000.0','Sofa,AC Available');
insert into Rooms(R_Room_Type ,R_Room_Rate,R_Room_Amenities) values ('Single','300.0','AC Available');
insert into Rooms(R_Room_Type ,R_Room_Rate,R_Room_Amenities) values ('Double','500.0','Extra children bed,AC Available');
insert into Rooms(R_Room_Type ,R_Room_Rate,R_Room_Amenities) values ('Suite','900.0','Fridge,Sofa,AC Available');
insert into Rooms(R_Room_Type ,R_Room_Rate,R_Room_Amenities) values ('Conference','5000.0','AC Available');

select * from Rooms;
 
 


create table Hotel(
H_Id int not null primary key,
H_Name varchar(50) not null,
H_Street varchar(50) not null,
H_City varchar(20) not null,
H_State varchar(50) not null,
H_Country varchar(30) not null,
H_Zipcode int not null,
H_Phone_number int not null,
H_Email_id varchar(50),
H_Single_Room int,
H_Double_Room int,
H_Suite int,
H_Conference_Room int,
R_Room_Id int,
Is_Sold varchar(1),
foreign key (R_Room_Id) references Rooms(R_Room_Id)

);


create sequence H_ID_SEQ;


CREATE OR REPLACE TRIGGER Hotel_ID_increment -- creating trigger for auto incrementation of primary key
  BEFORE INSERT ON Hotel
  FOR EACH ROW
BEGIN
  SELECT H_ID_seq.nextval
  INTO :new.H_ID
  FROM dual;
END;
/

insert into Hotel(H_Name,H_Street,H_City,H_State,H_Country,H_Zipcode,H_Phone_number,H_Email_id,H_Single_Room,H_Double_Room,H_Suite,H_Conference_Room,R_Room_Id,Is_Sold) values
('H1','Belwoods','New York','NY','USA','123456','2222456734','H1@gmail.com',50, 20, 5,2,1,'N');

insert into Hotel(H_Name,H_Street,H_City,H_State,H_Country,H_Zipcode,H_Phone_number,H_Email_id,H_Single_Room,H_Double_Room,H_Suite,H_Conference_Room,R_Room_Id,Is_Sold)values
('H2','Westland','Baltimore','MD','USA','433456','987654321','H2@gmail.com', 50, 20, 5,2,2,'N');

insert into Hotel(H_Name,H_Street,H_City,H_State,H_Country,H_Zipcode,H_Phone_number,H_Email_id,H_Single_Room,H_Double_Room,H_Suite,H_Conference_Room,R_Room_Id,Is_Sold) values
('H3','Elkridge','San Francisco','CA','USA','123456','2222456734','H3@gmail.com',50, 20, 5,2,3,'N');

insert into Hotel(H_Name,H_Street,H_City,H_State,H_Country,H_Zipcode,H_Phone_number,H_Email_id,H_Single_Room,H_Double_Room,H_Suite,H_Conference_Room,R_Room_Id,Is_Sold)values
('H4','Chapel','Annapolis','MD','USA','21227','2233456123','H4@gmail.com',50, 20, 5,2,4,'N');


insert into Hotel(H_Name,H_Street,H_City,H_State,H_Country,H_Zipcode,H_Phone_number,H_Email_id,H_Single_Room,H_Double_Room,H_Suite,H_Conference_Room,R_Room_Id,Is_Sold) values
('H5','Linthicum','Baltimore','MD','USA','123356','2222116734','H5@gmail.com',50, 20, 5,2,5,'N');


--new hotels added according to sample scenario

select * from Hotel;





create table Services(
S_Id int primary key not null,
S_Name varchar(55),
Services_Cost int --change to float
);


create sequence S_ID_SEQ;


CREATE OR REPLACE TRIGGER services_ID_increment -- creating trigger for auto incrementation of primary key
  BEFORE INSERT ON services
  FOR EACH ROW
BEGIN
  SELECT S_ID_seq.nextval
  INTO :new.S_ID
  FROM dual;
END;
/
insert into Services(S_NAME,Services_Cost) values('Laundry','20');
insert into Services(S_NAME,Services_Cost) values('RESTAURANT','50');
insert into Services(S_NAME,Services_Cost) values('Pay-per-Movies','25');
insert into Services(S_NAME,Services_Cost) values('Gym','20');
insert into Services(S_NAME,Services_Cost) values('Spa','60');
insert into Services(S_NAME,Services_Cost) values('Resta','100');

select * from Services;





create table Reservation(
R_Id int primary key,
C_Id int not null,
H_Id int not null,
R_Room_Id int not null,
S_Id int not null,
R_Room_No int,
Single_room_qty int,
Double_room_qty int,
Suite_qty int,
Conference_room_qty int,
R_Checkin_Date date,
R_Checkout_Date date,
Reserve_date date,
Reserve_Status varchar(100),
foreign key (C_Id) references Customer_Details(C_Id),
foreign key (H_Id) references Hotel(H_Id),
foreign key (R_Room_Id) references Rooms(R_Room_Id),
foreign key (S_Id) references Services(S_Id)
);




create sequence R_ID_SEQ;

CREATE OR REPLACE TRIGGER reservation_ID_increment  -- creating trigger for auto incrementation of primary key
  BEFORE INSERT ON reservation
  FOR EACH ROW
BEGIN
  SELECT R_ID_seq.nextval
  INTO :new.R_ID
  FROM dual;
END;
/
insert into Reservation(C_Id,H_Id,R_Room_Id,S_Id,R_Room_No,Single_room_qty,Double_room_qty,Suite_qty,Conference_room_qty,R_Checkin_Date,R_Checkout_Date,Reserve_date,Reserve_Status)
values(1,1,1,1,101,1,0,0,0,date '2021-2-27',date '2021-3-5',date '2021-2-23','Reserve');
insert into Reservation(C_Id,H_Id,R_Room_Id,S_Id,R_Room_No,Single_room_qty,Double_room_qty,Suite_qty,Conference_room_qty,R_Checkin_Date,R_Checkout_Date,Reserve_date,Reserve_Status)
values(2,2,2,2,102,0,1,0,0,date '2021-2-27',date '2021-3-5',date '2021-2-23','Reserve');
insert into Reservation(C_Id,H_Id,R_Room_Id,S_Id,R_Room_No,Single_room_qty,Double_room_qty,Suite_qty,Conference_room_qty,R_Checkin_Date,R_Checkout_Date,Reserve_date,Reserve_Status)
values(2,3,3,3,103,0,0,0,1,date '2021-3-26',date '2021-4-6',date '2021-2-25','Reserve');
insert into Reservation(C_Id,H_Id,R_Room_Id,S_Id,R_Room_No,Single_room_qty,Double_room_qty,Suite_qty,Conference_room_qty,R_Checkin_Date,R_Checkout_Date,Reserve_date,Reserve_Status)
values(2,4,4,4,104,1,0,0,0,date '2021-4-25',date '2021-5-7',date '2021-4-15','Reserve');
insert into Reservation(C_Id,H_Id,R_Room_Id,S_Id,R_Room_No,Single_room_qty,Double_room_qty,Suite_qty,Conference_room_qty,R_Checkin_Date,R_Checkout_Date,Reserve_date,Reserve_Status)
values(4,5,5,5,106,0,1,0,0,date '2021-5-25',date '2021-6-7',date '2021-4-12','Reserve');


select * from Reservation;




create table Billing
(
B_Id int primary key not null,
B_Amount varchar(20),
B_Payment_Method varchar(20),
R_Id int not null,
foreign key (R_Id) references  Reservation(R_Id)
);


create sequence B_ID_seq;


CREATE OR REPLACE TRIGGER billings_ID_increment  -- creating trigger for auto incrementation of primary key
  BEFORE INSERT ON billing
  FOR EACH ROW
BEGIN
  SELECT B_ID_seq.nextval
  INTO :new.B_ID
  FROM dual;
END;
/

insert into Billing(B_Amount ,B_Payment_Method ,R_Id) values('1250','online netbanking','1');
insert into Billing(B_Amount ,B_Payment_Method ,R_Id) values('1700','Credit Card','2');
insert into Billing(B_Amount ,B_Payment_Method ,R_Id) values('2100','Debit Card','3');
insert into Billing(B_Amount ,B_Payment_Method ,R_Id) values('1170','online netbanking','4');
insert into Billing(B_Amount ,B_Payment_Method ,R_Id) values('1800','PayPal','5');


select * from Billing;





create table mappings(M_ID int primary key , R_ID int, foreign key (R_ID) references Reservation(R_ID),S_ID int, foreign key (S_ID) references Services(S_ID),creation_date date,Service_start_date date, Service_end_date date);


create sequence M_ID_seq;

/
CREATE OR REPLACE TRIGGER mappings_ID_increment  -- creating trigger for auto incrementation of primary key
  BEFORE INSERT ON mappings
  FOR EACH ROW
BEGIN
  SELECT M_ID_seq.nextval
  INTO :new.M_ID
  FROM dual;
END;
/
/*
insert into mappings(R_ID ,S_ID ,creation_date ,Service_start_date , Service_end_date) values(1, 1, CURRENT_DATE ,to_date('03-MARCH-2021'),to_date('07-MARCH-2021'));
insert into mappings(R_ID ,S_ID ,creation_date ,Service_start_date , Service_end_date) values(2, 2, CURRENT_DATE,to_date('10-MAY-2021'),to_date('15-MARCH-2021'));
insert into mappings(R_ID ,S_ID ,creation_date ,Service_start_date , Service_end_date) values(3, 3, CURRENT_DATE,to_date('01-MAY-2021'),to_date('10-MAY-2021'));
insert into mappings(R_ID ,S_ID ,creation_date ,Service_start_date , Service_end_date) values(4, 4, CURRENT_DATE,to_date('01-MAY-2021'),to_date('10-MAY-2021'));
insert into mappings(R_ID ,S_ID ,creation_date ,Service_start_date , Service_end_date) values(5, 5 , CURRENT_DATE,to_date('04-MARCH-2021'),to_date('26-MARCH-2021'));
*/
select * from mappings;

/

---------------------------PROBLEM 1--------------------------------------------

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE insertput_Hotel(  
o_hname IN Hotel.H_NAME%TYPE,
o_hstreet IN Hotel.H_STREET%TYPE,
o_hcity IN Hotel.H_CITY%TYPE,
o_hstate IN Hotel.H_STATE%TYPE,
o_hcoun IN Hotel.H_COUNTRY%TYPE,
o_zipcode IN Hotel.H_ZIPCODE%TYPE,
o_phno IN Hotel.H_PHONE_NUMBER%TYPE,
o_emailid IN Hotel.H_EMAIL_ID%TYPE,
o_single IN Hotel.H_SINGLE_ROOM%TYPE,
o_double IN Hotel.H_DOUBLE_ROOM%TYPE,
o_suite IN Hotel.H_SUITE%TYPE,
o_conference IN Hotel.H_CONFERENCE_ROOM%TYPE,
o_r_roomid IN Hotel.R_ROOM_ID%TYPE,
o_is_sold IN Hotel.IS_SOLD%TYPE)

IS
BEGIN
INSERT INTO Hotel("H_NAME","H_STREET","H_CITY","H_STATE","H_COUNTRY","H_ZIPCODE","H_PHONE_NUMBER","H_EMAIL_ID","H_SINGLE_ROOM","H_DOUBLE_ROOM","H_SUITE","H_CONFERENCE_ROOM","R_ROOM_ID","IS_SOLD")
VALUES(o_hname,o_hstreet,o_hcity,o_hstate,o_hcoun,o_zipcode,o_phno,o_emailid,o_single,o_double,o_suite,o_conference,o_r_roomid,o_is_sold);-------------------------------(Inserted the created attributes into the table corresponding to the actual attributes)
END;
/

exec insertput_Hotel('H6','Pratt','Ashburn','VA','USA',21327,2021311646,'H6@gmail.com',50,20,5,2,7,'N');
exec insertput_Hotel('H7','Downtown','Fairfax','VA','USA',21927,2021891646,'H7@gmail.com',55,21,9,3,8,'N');
/
select * from hotel;

-----------------------------------------------PROBLEM 2------------------------------------------------------------

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE----------------------------------(To replace an existing procedure and to create a standalone stored procedure or a call specification.)
QUERY_HOTELS(P_STREET
HOTEL.H_STREET%TYPE)
IS
P_NAME varchar2(50);
BEGIN
SELECT HOTEL.H_NAME INTO P_NAME FROM
HOTEL WHERE
P_STREET=H_STREET;
DBMS_OUTPUT.PUT_LINE(P_NAME);----------------------------------(Allows to write data to flat file or to direct the PL/SQL output to a screen.)
END;
/


EXEC QUERY_HOTELS('Elkridge');
EXEC QUERY_HOTELS('Westland');
SELECT * FROM HOTEL;


------------------------------------------------------PROBLEM 3---------------------------------------------------------

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE sell_hotel(p_H_NAME
HOTEL.H_NAME%type)-------------------------------------(Creating the procedure and declaring H_ID as input parameter)(Declared H_ID.)
IS
p_is char(1);
p_st varchar2(50);
begin

UPDATE HOTEL SET  IS_SOLD = 'Y' where------------------------(Updates the status of Sold Hotels.)
p_H_NAME= H_NAME;

SELECT HOTEL.IS_SOLD,HOTEL.H_STREET  INTO p_is,p_st FROM HOTEL WHERE p_H_NAME = H_NAME;
dbms_output.put_line(p_H_NAME || ' '|| p_is || ' '|| p_st);



EXCEPTION    ------------/*handling exceptions*/----------------)
when no_data_found then dbms_output.put_line('no data found');
when too_many_rows then dbms_output.put_line('too many records were found');
when others then dbms_output.put_line('an exception was raised');
end;
/
exec sell_hotel('H1');
commit;


----------------------------------------------------------------PROBLEM 4---------------------------------------------

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE extract_hotel_info(p_state
HOTEL.H_STATE%type)---------------------------------------( Creating the procedure and declaring H_ID as input parameter.)
IS
Cursor c1 is SELECT HOTEL.H_NAME,HOTEL.H_STREET,HOTEL.H_CITY, HOTEL.H_ZIPCODE,HOTEL.H_PHONE_NUMBER,
HOTEL.H_SINGLE_ROOM,HOTEL.H_DOUBLE_ROOM,HOTEL.H_SUITE,HOTEL.H_CONFERENCE_ROOM from HOTEL WHERE HOTEL.H_STATE = p_state;/* Declaring cursor c1*/
p_hn varchar2(50);
p_st varchar2(50);
p_ci varchar2(50);
p_zc int;
p_mn varchar2(30);
p_sa int;
p_da int;
p_ca int;
p_sua int;
begin
open c1; ------------------------------------------------------------------------(looping through each row in the cursor.)
loop
      fetch c1 into p_hn,p_st,p_ci,p_zc,p_mn,p_sa,p_da,p_ca,p_sua;
      exit when c1%notfound;
      dbms_output.put_line(p_hn || ' ' ||p_st || ' '||p_ci || ' '||p_zc || ' '||p_mn || ' ' ||p_sa || ' '|| p_da || ' ' ||p_ca || ' '||p_sua);
End loop;
EXCEPTION ------------------------/* Exception handling */------------------------------------
when no_data_found then dbms_output.put_line('no data found');
when others then dbms_output.put_line('an exception was raised');
END;
/

EXECUTE extract_hotel_info('MD');



Drop procedure sell_hotel;

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE sell_hotel(p_H_ID HOTEL.H_ID%type)
IS
p_is char(1);
p_st varchar2(50);
begin

UPDATE HOTEL SET  IS_SOLD = 'Y' where p_H_ID= H_ID;

SELECT HOTEL.IS_SOLD,HOTEL.H_STREET  INTO p_is,p_st FROM HOTEL WHERE p_H_ID = H_ID;
dbms_output.put_line(p_H_ID || ' '|| p_is || ' '|| p_st);



EXCEPTION    
when no_data_found then dbms_output.put_line('no data found');
when too_many_rows then dbms_output.put_line('too many records were found');
when others then dbms_output.put_line('an exception was raised');
end;
/
exec sell_hotel(1);


-------------------------------------------------------------------------------------------------------------------------------------------------------
/*Que 5 : Make a reservation: Input parameters: Hotel ID, guest’s name, start date, end date, room type, date of reservation. 
Output: reservation ID (this is called confirmation code in real-life). NOTE: Only one guest per reservation.
However, the same guest can make multiple reservations.
Also, make sure that there is availability of that room type before a reservation is made.*/

Drop procedure makereserve;


set serveroutput on;
create or replace procedure makereserve(cid in Reservation.C_Id%type,hid in Reservation.H_Id%type,roomid in Reservation.R_Room_Id%type,
sid1 in Reservation.S_Id%type,rno in Reservation.R_Room_No%type,sqty in Reservation.Single_room_qty%type,dqty in Reservation.Double_room_qty%type,
suqty in Reservation.Suite_qty%type,cqty in Reservation.Conference_room_qty%type,chkin in Reservation.R_Checkin_Date%type,chkout in Reservation.R_Checkout_Date%type,
rdate in Reservation.Reserve_date%type,rstatus in Reservation.Reserve_Status%type ) 
 is rid Reservation.R_Id%type;
 
 /*cursor to check availability of room type*/
cursor check_available is select H_Id,Single_room_qty,Double_room_qty,Suite_qty,Conference_room_qty,R_Checkin_Date,R_Checkout_Date from reservation where h_id=hid;
 
  /*cursor to make reservation*/
 cursor make_reserve is select R_Id from Reservation where C_Id=cid and H_Id=hid and R_Room_Id=roomid and S_Id=sid1;


shotel int :=0;     --rooms in hotel table
dhotel int :=0;
suhotel int :=0;
chotel int :=0;
r1 check_available%rowtype;
sroomavail int:=0;   --rooms in reservation table
droomavail int:=0;
suroomavail int:=0;
croomavail int:=0;
b1 int; 
is1 varchar(1);

begin

--cursor to check sold status of hotel
select is_sold into is1 from hotel where H_Id=hid;


--calculate total rooms in reservation table

for abc in check_available
loop
sroomavail :=abc.Single_room_qty + sroomavail;    
droomavail :=abc.Double_room_qty + droomavail;
suroomavail :=abc.Suite_qty + suroomavail;
croomavail :=abc.Conference_room_qty + croomavail;
end loop;


--substract total reserve rooms from total rooms in hotel

select H_Single_Room,H_Double_Room,H_Suite,H_Conference_Room into shotel,dhotel,suhotel,chotel from hotel where H_id=hid;
sroomavail :=shotel-sroomavail;                  
droomavail :=dhotel-droomavail;
suroomavail :=suhotel-suroomavail;
croomavail :=chotel-croomavail;


/* display all total available rooms*/
open check_available;
if check_available%notfound then
select H_Single_Room,H_Double_Room,H_Suite,H_Conference_Room into sroomavail,droomavail,suroomavail,croomavail from hotel where h_id=hid;
end if;
close check_available;

/* Numbers of Single room available in a hotel*/

if is1='N' then
if sroomavail > 0 then
dbms_output.put_line('Total Single Rooms available :'||sroomavail);
else
sroomavail := 0;
dbms_output.put_line('Total Single Rooms available :'||sroomavail);
dbms_output.put_line('All single rooms filled');
end if;

/* Numbers of Double room available in a hotel*/
if droomavail > 0 then
dbms_output.put_line('Total Double Rooms available :'||droomavail);
else 
droomavail := 0;
dbms_output.put_line('Total Double Rooms available :'||droomavail);
dbms_output.put_line('All Double rooms filled');
end if;

/* Numbers of Suites available in a hotel*/
if suroomavail > 0  then
dbms_output.put_line('Total Suites available :'||suroomavail);
else 
suroomavail :=0;
dbms_output.put_line('Total Suites available :'||suroomavail);
dbms_output.put_line('All Suites filled');
end if;

if croomavail > 0  then
dbms_output.put_line('Total  Conference Rooms available :'||croomavail);
else 
croomavail :=0;
dbms_output.put_line('Total  Conference Rooms available :'||croomavail);
dbms_output.put_line('All Conference Rooms filled');
end if;

else dbms_output.put_line('Hotel is already sold ');

end if;



/* make reservation procedure*/

if sroomavail > 0 and droomavail > 0 and suroomavail > 0 and croomavail > 0 and is1='N' then
insert into Reservation values(R_ID_SEQ.nextval,cid,hid,roomid,sid1,rno,sqty,dqty,suqty,cqty,chkin,chkout,rdate,rstatus);
   dbms_output.put_line('');
   dbms_output.put_line('Data added successfuly');
     
   open make_reserve;
   loop
   fetch make_reserve into rid;
     if rid is not null then
     exit when make_reserve%notfound;
        dbms_output.put_line('');
        dbms_output.put_line('Reservation ID is: ' || rid);

      end if;
    end loop;
    close make_reserve;
     
else  
dbms_output.put_line('');
dbms_output.put_line('Sorry..!Unable to make reservation');
end if;

exception
when others then
    dbms_output.put_line('Wrong Information');
     end;
/
--C_Id,H_Id,R_Room_Id,S_Id,R_Room_No,Single_room_qty,Double_room_qty,Suite_qty,Conference_room_qty,R_Checkin_Date,R_Checkout_Date,Reserve_date,Reserve_Status
/*Execution for make reservation*/
-- Make a reservation at hotel H2 by John Smith from Aug 1 – Aug 10 for a suite 
execute makereserve(1,2,7,3,110,0,0,1,0,date '2020-8-1',date '2020-8-10',date '2021-7-25','Reserve');


-- Make a reservation at hotel H1 (already sold)
execute makereserve(3,1,5,4,114,0,0,0,1,date '2021-4-25',date '2021-5-7',date '2021-4-15','Reserve');


-- Make a reservation by Arnold Patterson for conference room at H4 from May 1 – May 5
execute makereserve(3,4,8,1,111,0,0,0,1,date '2021-5-1',date '2021-5-5',date '2020-4-20','Reserve');


-- Make a reservation by Arnold Patterson for double room at H4 from Jun 10 – Jun 15
execute makereserve(3,4,6,2,120,0,1,0,0,date '2021-6-10',date '2021-6-15',date '2021-4-21','Reserve');


-- Make a reservation by Mary Wise for single at H4 from May 10 – May 15
execute makereserve(2,4,5,3,121,1,0,0,0,date '2021-5-10',date '2021-5-15',date '2021-4-18','Reserve');


-- Make a reservation by Mary Wise for a double at H4 from May 1 – May 5
execute makereserve(2,4,6,2,122,0,1,0,0,date '2021-5-1',date '2021-5-5',date '2021-4-19','Reserve');

--select * from reservation;
--select * from hotel;
--select * from customer_details;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

/* 6.	Find a reservation: Input is guest’s name and date, and hotel ID. Output is reservation ID. */

drop procedure findreserve;

set serveroutput on;
 create or replace procedure findreserve(hid in Reservation.H_Id%type,gname in Customer_Details.C_FName%type ,rdate in Reservation.Reserve_date%type) 
 is rid Reservation.R_Id%type;
 
 cursor find_reserve is select R2.R_Id from Reservation R1,Reservation R2,Customer_Details c where R1.R_Id=R2.R_Id and R1.H_Id=hid and c.C_FName=gname and R1.Reserve_date=rdate and c.C_Id=R1.C_id;
 begin
 open find_reserve;
 loop
 fetch find_reserve into rid;
 if rid is not null then
 exit when find_reserve%notfound;
   dbms_output.put_line('Reservation ID is: ' || rid);
   else 
     dbms_output.put_line('Reservation id is not found');
     end if;
     end loop;
     close find_reserve;
     exception
when others then
    dbms_output.put_line('Wrong Information');
     end;
/

/*6.	Find the reservation of Arnold Patterson (May 1 – May 5)*/

exec findreserve(4,'Arnold',date '2021-04-21');


----------------------------------------------------------------------------------------------------------------------------------------------------------------

/* :Cancel a reservation: Input the reservationID and mark the reservation as cancelled (do NOT delete it)*/

drop procedure cancelreserve;

set serveroutput on;
create or replace procedure cancelreserve(rid in Reservation.R_Id%type,rstatus in Reservation.Reserve_Status%type) --Creating Procedure for Cancle Reservation
 is 
 
rs varchar(20);
rid1 int;
 begin
 
 select R_Id,Reserve_Status into rid1, rs  from Reservation where R_Id=rid;
 if rs = 'Reserve' and rid1=rid then
 update Reservation set Reservation.Reserve_Status=rstatus where Reservation.R_Id=rid;
    dbms_output.put_line('Reservation status for reservation Id :'||rid||' is update succesfully as '||rstatus); 
    
    else
        dbms_output.put_line('Reservation is already cancel'); 

end if;

exception   
when no_data_found then  
    dbms_output.put_line('No data found');
when others then
    dbms_output.put_line('Wrong Information');
end;
/


/*7.	Cancel reservation of Arnold Patterson for double room*/
--cid 6
exec cancelreserve(11,'Cancel');

/*a.	Cancel reservation of John Smith*/
--cid 5
exec cancelreserve(7,'Cancel');

--exeception case
--exec cancelreserve(23,'Cancel');


--select * from reservation;

----------------------------------------------------------------------------------------------------------------------------------------------------------

/* Que 8 : Print all canceled reservations in the hotel management system.*/
drop procedure show_cancle_reserve;


set serveroutput on;
create or replace procedure show_cancle_reserve(C_Status in Reservation.Reserve_Status%type) is 
cursor c2 is select re.R_Id ,h.H_Name,h.H_Street,h.H_City,h.H_State,h.H_Country,h.H_Zipcode,c.C_FName,c.C_LName,re.R_Checkin_Date,
re.R_Checkout_Date,re.Reserve_date from Reservation re,Hotel h,Rooms r,Customer_Details c
 where re.Reserve_Status='Cancel' and h.H_Id=re.H_Id and c.C_Id=re.C_Id and r.R_Room_Id=re.R_Room_Id ;

rid Reservation.R_Id%type;
hname Hotel.H_Name%type;
hstreet Hotel.H_Street%type;
hcity Hotel.H_City%type;
hstate Hotel.H_State%type;
hcountry Hotel.H_Country%type;
hzipcode Hotel.H_Zipcode%type;
fname Customer_Details.C_FName%type;
lname Customer_Details.C_LName%type;
chkin Reservation.R_Checkin_Date%type;
chkout Reservation.R_Checkout_Date%type;
rdate Reservation.Reserve_date%type;

begin
open c2;
loop 
fetch c2 into rid,hname,hstreet,hcity,hstate,hcountry,hzipcode,fname,lname,chkin,chkout,rdate; 

exit when c2%notfound;
if C_Status='Cancel' then
dbms_output.put_line('Canceled reservations in the hotel management system : ');
 dbms_output.put_line('');
 dbms_output.put_line('Reservation Id : '||rid||' , Check-In Date : '||chkin||', Check-Out Date : '||chkout||', Reservation Date : '||rdate||',');
 dbms_output.put_line('Customer Name : '||fname||' '||lname||',');
 dbms_output.put_line('Hotal name : '||hname||' , Hotal Address : '||hstreet||','||hcity||','||hstate||','||hcountry||'-'||hzipcode);
 dbms_output.put_line('');
else 
 dbms_output.put_line('There is no cancel records');
 dbms_output.put_line('');

 
 end if;
end loop;
 close c2;
    
exception   
when no_data_found then  
    dbms_output.put_line('No rows found');
--Exception for handling errors
when others then
    dbms_output.put_line('Wrong Information');

end;    
/

exec show_cancle_reserve('Cancel'); 

select * from reservation;





--Creating a Procedure Change_ResDate for changing the Reservation date.The 3 inputs are 1.Reservation Id 2.New_Checkin_Date 3.New Checkout date.
set serveroutput on
create or replace PROCEDURE Change_ResDate(re_Id in int,newin in date,newout in date) AS 

--Declaring Local variables 
a varchar(100);b varchar(100);c varchar(100);d varchar(100);e varchar(100);rtype varchar(100);
coun int;total int;h int;room_id int;
BEGIN 
--Initializing Local variables

a:='Single';b:='Double';c:='Suite';d:='Conference';

--Getting Hotel Id based on the Reservation Id
select H_Id into h from reservation where reservation.R_Id=re_Id;
dbms_output.put_line('The Hotel Id corresponding to Reservation id is      '||h);

--Getting the Room id from reservation id
select R_Room_Id  into room_id from reservation where reservation.R_Id=re_Id;
dbms_output.put_line('The room id corresponding to it is    '|| room_id);

--Getting the room-type &its count from Reservation Id;
select R_Room_Type into rtype from rooms where R_Room_Id=room_id;
dbms_output.put_line('The room type the customer selected is   '||rtype);
select count(R_Room_Id) into coun from reservation where reservation.R_Room_Id=room_id and H_Id=h ;
dbms_output.put_line('The total number of reserved   '||rtype||'rooms are  '||coun);
--Getting the Total rooms from the hotel for the specific room type 
case(rtype)
when a then select H_Single_Room into total from hotel where Hotel.H_Id=h;
            dbms_output.put_line('It is a Single Room!'|| ' Total number of Rooms are' || total );
when b then select H_Double_Room  into total from hotel where Hotel.H_Id=h;
            dbms_output.put_line('It is a Double Room!'|| ' Total number of Rooms are' || total );
when c then select H_Suite  into total from hotel where Hotel.H_Id=h;
            dbms_output.put_line('It is a Suite Room!'|| ' Total number of Rooms are' || total );
when d then select H_Conference_Room  into total from hotel where Hotel.H_Id=h;
            dbms_output.put_line('It is a Conference Room!'|| ' Total number of Rooms are' || total );
else dbms_output.put_line('No such rooms');
end case;

--Checking the availablity of the room from that Hotel.If it is there new Checkin&Checkout dates are updated in reservation table.

 if ( total>coun )
 THEN  
 update reservation set R_Checkin_Date=newin,R_Checkout_Date=newout where R_Id=re_Id;
 dbms_output.put_line('Successfully Checkin and  Checkout dates in the reseravtion table are changed.');
 DBMS_OUTPUT.PUT_LINE('New Checkin date is  '||newin ||',New Checkout date is     '||newout);
  else  dbms_output.put_line('No rooms are available');
  
 END if;
--Exception Handling
EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such customer!'); 
   WHEN others THEN 
      dbms_output.put_line('Error!'); 
      
       end;
/
--change room type
set serveroutput on;
create or replace PROCEDURE Change_Roomtype(resid in int,new_roomtype in varchar) AS 

--Declaring Local variables 
a varchar(100);b varchar(100);c varchar(100);d varchar(100);e varchar(100);rtype varchar(100);
coun int;total int;h int;room_id int;newroom_id int;
BEGIN 
--Initializing Local variables

a:='Single';b:='Double';c:='Suite';d:='Conference';

--Getting Hotel Id based on the Reservation Id
select H_Id into h from reservation where reservation.R_Id=resid;
dbms_output.put_line('The Hotel Id corresponding to Reservation id is      '||h);

--Getting the Room id from reservation id
select R_Room_Id  into room_id from reservation where reservation.R_Id=resid;
dbms_output.put_line('The room id corresponding to it is    '|| room_id);

--Getting the room-type &its count from Reservation Id;
select R_Room_Type into rtype from rooms where R_Room_Id=room_id;
dbms_output.put_line('The room type the customer selected is   '||rtype);
select count(R_Room_Id) into coun from reservation where reservation.R_Room_Id=room_id and H_Id=h ;
dbms_output.put_line('The total number of reserved   '||rtype||'rooms are  '||coun);
--Getting the Total rooms from the hotel for the specific room type 
case(rtype)
when a then select H_Single_Room into total from hotel where Hotel.H_Id=h;
            dbms_output.put_line('It is a Single Room!'|| ' Total number of Rooms are' || total );
when b then select H_Double_Room  into total from hotel where Hotel.H_Id=h;
            dbms_output.put_line('It is a Double Room!'|| ' Total number of Rooms are' || total );
when c then select H_Suite  into total from hotel where Hotel.H_Id=h;
            dbms_output.put_line('It is a Suite Room!'|| ' Total number of Rooms are' || total );
when d then select H_Conference_Room  into total from hotel where Hotel.H_Id=h;
            dbms_output.put_line('It is a Conference Room!'|| ' Total number of Rooms are' || total );
else dbms_output.put_line('No such rooms');
end case;

--Checking the availablity of the room from that Hotel.If it is there new Checkin&Checkout dates are updated in reservation table.

 if ( total>coun )
 THEN  
if (room_id>=1 and room_id<=4) then
--getting the room id for the new room type
select R_Room_Id  into newroom_id from rooms where R_room_type=new_roomtype and rooms.R_Room_id<5;
update reservation set R_Room_id=newroom_id where reservation.R_Id=resid;
 dbms_output.put_line('Successfully the room type is changed.');
 DBMS_OUTPUT.PUT_LINE('New Room type is  '||new_roomtype);
 elsif(room_id>=5 and room_id<=8) then
 --getting the room id for the new room type
select R_Room_Id  into newroom_id from rooms where R_room_type=new_roomtype and rooms.R_Room_id<8 and rooms.R_Room_id>4;
update reservation set R_Room_id=newroom_id where reservation.R_Id=resid;
 dbms_output.put_line('Successfully the room type is changed.');
 DBMS_OUTPUT.PUT_LINE('New Room type is  '||new_roomtype);
  else  dbms_output.put_line('No rooms are available');end if;
 END if;
--Exception Handling
EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such customer!'); 
   WHEN others THEN 
      dbms_output.put_line('Error!'); 
      
       end;
/
-----point 10-Show Hotel Reservations
--Creating procedure hotel_resrvations taking Hotel id as an input parameter
set serveroutput on
create or replace procedure hotel_reservation(H_Id int) AS

--Declaring local variables
a int;   res_id int;  countres int;
TYPE nt_indate IS TABLE OF date;
TYPE nt_outdate IS TABLE OF date;
type nt_rid is table of int;
rid nt_rid;  Checkin_Date nt_indate;   Checkout_Date nt_outdate;

BEGIN
--Initialising local variables
a:=H_Id;
dbms_output.put_line('The Hotel id is '|| a);
--Getting customer details and Reservation details based on Hotel id.

select R_Id,R_Checkin_Date,R_CHeckout_Date BULK COLLECT into Rid,Checkin_Date,Checkout_Date 
from reservation where h_id=a ;
for idx IN 1 ..Rid.COUNT
LOOP
dbms_output.put_line('The Details are '||idx ||'-  '|| 'Reservation id is  '||Rid(idx)||'    '||Checkin_Date(idx)||'      '||Checkout_Date(idx));
end loop;
--Exception Handling
EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such Data!'); 
   WHEN others THEN 
      dbms_output.put_line('Error!'); 
end hotel_reservation;
/
---procedure for point11-Showing Guest Reservations
set serveroutput on;
create or replace procedure guestReservation(G_Name varchar) AS
--declaring the variables
Gname varchar(30);
TYPE nt_id IS TABLE OF integer;
TYPE nt_indate IS TABLE OF date;
TYPE nt_outdate IS TABLE OF date;
RID nt_id;
CHECKIN_DATE nt_indate;
CHECKOUT_DATE nt_outdate;
tc_id int;

BEGIN
Gname:=G_Name;
--selecting Reservation id,Checkin&checkout dates from reservation table
dbms_output.put_line(G_Name);
select C_ID into tc_id from Customer_details  where C_Fname=Gname;
dbms_output.put_line(tc_id);
select R_Id,R_Checkin_Date,R_Checkout_date BULK COLLECT into RID,CHECKIN_DATE,CHECKOUT_DATE from reservation where reservation.C_Id=tc_id;
for idx IN 1 ..RID.COUNT
LOOP
dbms_output.put_line('The Details are '||idx ||'    Res id is   '|| RID(idx)||'    '||CHECKIN_DATE(idx)||'     '||CHECKOUT_DATE(idx));
end loop;
--Exception Handling
EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such Data!'); 
   WHEN others THEN 
         dbms_output.put_line('Error!'); 

end guestReservation;
/

--monthyly income report-12
set serveroutput on;
create or replace  procedure MonthlyIncomeReport as
numofrid int;
type nt_rid is table of int;
TYPE nt_indate IS TABLE OF date;
TYPE nt_outdate IS TABLE OF date;
TYPE nt_resdate IS TABLE OF date;
trindate nt_indate;
troutdate nt_outdate;
trdate nt_resdate;temprc int;looprid int;Service_cost_Total int;finalcost int;tc int;m1 int;m2 int;ja1 int;ja2 int;
tr_id int;temprid nt_rid;b number;dif int;room_cost number;rcost number;a number;total_rcost number;totalroomcost number;trmc number;
f1 int;f2 int;ma1 int;ma2 int;ap1 int;ap2 int;ju1 int;ju2 int;jl1 int;jl2 int;ag1 int;ag2 int;sp1 int;sp2 int;oc1 int;oc2 int;nv1 int;nv2 int;dc1 int;dc2 int;
begin
for i in 1..5 loop
totalroomcost:=0;Service_cost_Total:=0;m1:=0;m2:=0;ja1:=0;ja2:=0;
f1:=0;f2:=0;ma1:=0;ma2:=0;ap1:=0;ap2:=0;ju1:=0;ju2:=0;jl1:=0;jl2:=0;ag1:=0;ag2:=0;sp1:=0;sp2:=0;oc1:=0;oc2:=0;nv1:=0;nv2:=0;dc1:=0;dc2:=0;
select count(R_Id) into numofrid from reservation where reservation.H_Id=i;
if (numofrid!=0) then dbms_output.put_line('------------------hotel'||i||'-----------------------');
                      dbms_output.put_line('No of reservations:    '||numofrid);
select R_Id,R_Checkin_Date,R_Checkout_Date,Reserve_Date bulk collect into temprid,trindate,troutdate,trdate from reservation where reservation.H_Id=i;
for j IN 1 ..temprid.COUNT
LOOP
totalroomcost:=0;Service_cost_Total:=0;
dbms_output.put_line('Reservation id :    '||temprid(j));
dif:=troutdate(j)-trindate(j);
select R_Room_Rate into room_cost from rooms,reservation where rooms.R_Room_id=reservation.R_Room_id and reservation.R_Id=temprid(j);
rcost:=dif*room_cost;
dbms_output.put_line('Total room cost is    '||rcost||'   ='||room_cost||'(room cost) *'||dif||'(number of days)');
a:=trindate(j)-trdate(j);
if (a>=60) then total_rcost:=rcost*0.9;
else total_rcost:=rcost; end if;
dbms_output.put_line('total cost with discounts is    '||total_rcost);
looprid:=temprid(j);
b:= extract(month from trindate(j) );
if b=1 then dbms_output.put_line('---------jan--------');
            janc(looprid,total_rcost,ja1,ja2,totalroomcost,Service_cost_Total);ja1:=totalroomcost;ja2:=Service_cost_Total;
            dbms_output.put_line('Total room cost is   '||ja1);
            dbms_output.put_line('totalservice cost  is   '||ja2);
            finalcost:=ja1+ja2;
            dbms_output.put_line('Final cost including room and services is   '||finalcost);
elsif b=2 then dbms_output.put_line('---------feb--------');
            febc(looprid,total_rcost,f1,f2,totalroomcost,Service_cost_Total);f1:=totalroomcost;f2:=Service_cost_Total;
            dbms_output.put_line('trmc is   '||f1);
            dbms_output.put_line('totalservice cost  is   '||f2);
            finalcost:=f1+f2;
            dbms_output.put_line('Final cost including room and services is   '||finalcost);
elsif b=3 then dbms_output.put_line('---------mar-------');
            marc(looprid,total_rcost,ma1,ma2,totalroomcost,Service_cost_Total);ma1:=totalroomcost;ma2:=Service_cost_Total;
            dbms_output.put_line('trmc is   '||ma1);
            dbms_output.put_line('totalservice cost  is   '||ma2);
            finalcost:=ma1+ma2;
            dbms_output.put_line('Final cost including room and services is   '||finalcost);
elsif b=4 then dbms_output.put_line('---------april--------');
            aprc(looprid,total_rcost,ap1,ap2,totalroomcost,Service_cost_Total);ap1:=totalroomcost;ap2:=Service_cost_Total;
            dbms_output.put_line('trmc is   '||ap1);
            dbms_output.put_line('totalservice cost  is   '||ap2);
            finalcost:=ap1+ap2;
            dbms_output.put_line('Final cost including room and services is   '||finalcost);
elsif b=5 then dbms_output.put_line('---------may--------');                
            mayc(looprid,total_rcost,m1,m2,totalroomcost,Service_cost_Total);m1:=totalroomcost;m2:=Service_cost_Total;
            dbms_output.put_line('trmc is   '||m1);
            dbms_output.put_line('totalservice cost  is   '||m2);
            finalcost:=m1+m2;
            dbms_output.put_line('Final cost including room and services is   '||finalcost);           
elsif b=6 then dbms_output.put_line('---------june--------');
           junc(looprid,total_rcost,ju1,ju2,totalroomcost,Service_cost_Total);ju1:=totalroomcost;ju2:=Service_cost_Total;
            dbms_output.put_line('trmc is   '||ju1);
            dbms_output.put_line('totalservice cost  is   '||ju2);
            finalcost:=ju1+ju2;
            dbms_output.put_line('Final cost including room and services is   '||finalcost);            
elsif b=7 then dbms_output.put_line('---------july--------');
            julc(looprid,total_rcost,jl1,jl2,totalroomcost,Service_cost_Total);jl1:=totalroomcost;jl2:=Service_cost_Total;
            dbms_output.put_line('trmc is   '||jl1);
            dbms_output.put_line('totalservice cost  is   '||jl2);
            finalcost:=jl1+jl2;
            dbms_output.put_line('Final cost including room and services is   '||finalcost);
elsif b=8 then dbms_output.put_line('---------aug--------'); augc(looprid,total_rcost,ag1,ag2,totalroomcost,Service_cost_Total);ag1:=totalroomcost;ag2:=Service_cost_Total;
            dbms_output.put_line('trmc is   '||ag1);
            dbms_output.put_line('totalservice cost  is   '||ag2);
            finalcost:=ag1+ag2;
            dbms_output.put_line('Final cost including room and services is   '||finalcost);
elsif b=9 then dbms_output.put_line('---------sep--------');sepc(looprid,total_rcost,sp1,sp2,totalroomcost,Service_cost_Total);sp1:=totalroomcost;sp2:=Service_cost_Total;
            dbms_output.put_line('trmc is   '||sp1);
            dbms_output.put_line('totalservice cost  is   '||sp2);
            finalcost:=sp1+sp2;
            dbms_output.put_line('Final cost including room and services is   '||finalcost);
elsif b=10 then dbms_output.put_line('---------oct--------'); octc(looprid,total_rcost,oc1,oc2,totalroomcost,Service_cost_Total);oc1:=totalroomcost;oc2:=Service_cost_Total;
            dbms_output.put_line('trmc is   '||oc1);
            dbms_output.put_line('totalservice cost  is   '||oc2);
            finalcost:=oc1+oc2;
            dbms_output.put_line('Final cost including room and services is   '||finalcost);
elsif b=11 then dbms_output.put_line('---------nov--------');novc(looprid,total_rcost,nv1,nv2,totalroomcost,Service_cost_Total);nv1:=totalroomcost;nv2:=Service_cost_Total;
            dbms_output.put_line('trmc is   '||nv1);
            dbms_output.put_line('totalservice cost  is   '||nv2);
            finalcost:=nv1+nv2;
            dbms_output.put_line('Final cost including room and services is   '||finalcost);
elsif b=12 then dbms_output.put_line('---------dec--------');decc(looprid,total_rcost,dc1,dc2,totalroomcost,Service_cost_Total);dc1:=totalroomcost;dc2:=Service_cost_Total;
            dbms_output.put_line('trmc is   '||dc1);
            dbms_output.put_line('totalservice cost  is   '||dc2);
            finalcost:=dc1+dc2;
            dbms_output.put_line('Final cost including room and services is   '||finalcost);end if;
            end loop;end if;end loop;
end;
/
create or replace procedure janc(looprid in int,roomcost in int,ja1 in int,ja2 in int,totalroomcost in out int,Service_cost_Total out int) as
cursor c2 is select S_Id,Service_Start_Date,Service_End_Date  from Mappings where Mappings.R_Id=looprid;
serid int;start_date date;Total number;
end_date date;no_of_days number;scost number;Total_services_cost number;
begin
Total:=0;Total_services_cost:=0;
open c2; loop
fetch c2 into serid,start_date,end_date;
exit when c2%notfound;
no_of_days:=end_date-start_date;
select services_cost into scost from services where s_id=serid;
Total_services_cost:=no_of_days*scost;
--dbms_output.put_line('s_id is    '||serid  ||'  '|| 'service cost is  '||scost);
dbms_output.put_line('Total cost per each service is    '||Total_services_cost ||'    ='||no_of_days||'*'||scost);
Total:=Total+Total_services_cost;end loop;
Service_cost_Total:=Total;close c2;
Service_cost_Total:=Service_cost_Total+ja2;
totalroomcost:=totalroomcost+roomcost+ja1;
end;
/
create or replace procedure febc(looprid in int,roomcost in int,f1 in int,f2 in int,totalroomcost in out int,Service_cost_Total out int) as
cursor c2 is select S_Id,Service_Start_Date,Service_End_Date  from Mappings where Mappings.R_Id=looprid;
serid int;start_date date;Total number;
end_date date;no_of_days number;scost number;Total_services_cost number;
begin
Total:=0;Total_services_cost:=0;
open c2; loop
fetch c2 into serid,start_date,end_date;
exit when c2%notfound;
no_of_days:=end_date-start_date;
select services_cost into scost from services where s_id=serid;
Total_services_cost:=no_of_days*scost;
--dbms_output.put_line('s_id is    '||serid  ||'  '|| 'service cost is  '||scost);
dbms_output.put_line('Total cost per each service is    '||Total_services_cost ||'    ='||no_of_days||'*'||scost);
Total:=Total+Total_services_cost;end loop;
Service_cost_Total:=Total;close c2;
Service_cost_Total:=Service_cost_Total+f2;
totalroomcost:=totalroomcost+roomcost+f1;
end;
/
create or replace procedure marc(looprid in int,roomcost in int,ma1 in int,ma2 in int,totalroomcost in out int,Service_cost_Total out int) as
cursor c2 is select S_Id,Service_Start_Date,Service_End_Date  from Mappings where Mappings.R_Id=looprid;
serid int;start_date date;Total number;
end_date date;no_of_days number;scost number;Total_services_cost number;
begin
Total:=0;Total_services_cost:=0;
open c2; loop
fetch c2 into serid,start_date,end_date;
exit when c2%notfound;
no_of_days:=end_date-start_date;
select services_cost into scost from services where s_id=serid;
Total_services_cost:=no_of_days*scost;
--dbms_output.put_line('s_id is    '||serid  ||'  '|| 'service cost is  '||scost);
dbms_output.put_line('Total cost per each service is    '||Total_services_cost ||'    ='||no_of_days||'*'||scost);
Total:=Total+Total_services_cost;end loop;
Service_cost_Total:=Total;close c2;
Service_cost_Total:=Service_cost_Total+ma2;
totalroomcost:=totalroomcost+roomcost+ma1;
end;
/
create or replace procedure aprc(looprid in int,roomcost in int,ap1 in int,ap2 in int,totalroomcost in out int,Service_cost_Total out int) as
cursor c2 is select S_Id,Service_Start_Date,Service_End_Date  from Mappings where Mappings.R_Id=looprid;
serid int;start_date date;Total number;
end_date date;no_of_days number;scost number;Total_services_cost number;
begin
Total:=0;Total_services_cost:=0;
open c2; loop
fetch c2 into serid,start_date,end_date;
exit when c2%notfound;
no_of_days:=end_date-start_date;
select services_cost into scost from services where s_id=serid;
Total_services_cost:=no_of_days*scost;
--dbms_output.put_line('s_id is    '||serid  ||'  '|| 'service cost is  '||scost);
dbms_output.put_line('Total cost per each service is    '||Total_services_cost ||'    ='||no_of_days||'*'||scost);
Total:=Total+Total_services_cost;end loop;
Service_cost_Total:=Total;close c2;
Service_cost_Total:=Service_cost_Total+ap2;
totalroomcost:=totalroomcost+roomcost+ap1;
end;
/
create or replace procedure mayc(looprid in int,roomcost in int,m1 in int,m2 in int,totalroomcost in out int,Service_cost_Total out int) as
cursor c2 is select S_Id,Service_Start_Date,Service_End_Date  from Mappings where Mappings.R_Id=looprid;
serid int;start_date date;Total number;
end_date date;no_of_days number;scost number;Total_services_cost number;
begin
Total:=0;Total_services_cost:=0;
open c2; loop
fetch c2 into serid,start_date,end_date;
exit when c2%notfound;
no_of_days:=end_date-start_date;
select services_cost into scost from services where s_id=serid;
Total_services_cost:=no_of_days*scost;
--dbms_output.put_line('s_id is    '||serid  ||'  '|| 'service cost is  '||scost);
dbms_output.put_line('Total cost per each service is    '||Total_services_cost ||'    ='||no_of_days||'*'||scost);
Total:=Total+Total_services_cost;end loop;
Service_cost_Total:=Total;close c2;
Service_cost_Total:=Service_cost_Total+m2;
totalroomcost:=totalroomcost+roomcost+m1;
end;
/
create or replace procedure junc(looprid in int,roomcost in int,ju1 in int,ju2 in int,totalroomcost in out int,Service_cost_Total out int) as
cursor c2 is select S_Id,Service_Start_Date,Service_End_Date  from Mappings where Mappings.R_Id=looprid;
serid int;start_date date;Total number;
end_date date;no_of_days number;scost number;Total_services_cost number;
begin
Total:=0;Total_services_cost:=0;
open c2; loop
fetch c2 into serid,start_date,end_date;
exit when c2%notfound;
no_of_days:=end_date-start_date;
select services_cost into scost from services where s_id=serid;
Total_services_cost:=no_of_days*scost;
--dbms_output.put_line('s_id is    '||serid  ||'  '|| 'service cost is  '||scost);
dbms_output.put_line('Total cost per each service is    '||Total_services_cost ||'    ='||no_of_days||'*'||scost);
Total:=Total+Total_services_cost;end loop;
Service_cost_Total:=Total;close c2;
Service_cost_Total:=Service_cost_Total+ju2;
totalroomcost:=totalroomcost+roomcost+ju1;
end;
/
create or replace procedure julc(looprid in int,roomcost in int,jl1 in int,jl2 in int,totalroomcost in out int,Service_cost_Total out int) as
cursor c2 is select S_Id,Service_Start_Date,Service_End_Date  from Mappings where Mappings.R_Id=looprid;
serid int;start_date date;Total number;
end_date date;no_of_days number;scost number;Total_services_cost number;
begin
Total:=0;Total_services_cost:=0;
open c2; loop
fetch c2 into serid,start_date,end_date;
exit when c2%notfound;
no_of_days:=end_date-start_date;
select services_cost into scost from services where s_id=serid;
Total_services_cost:=no_of_days*scost;
--dbms_output.put_line('s_id is    '||serid  ||'  '|| 'service cost is  '||scost);
dbms_output.put_line('Total cost per each service is    '||Total_services_cost ||'    ='||no_of_days||'*'||scost);
Total:=Total+Total_services_cost;end loop;
Service_cost_Total:=Total;close c2;
Service_cost_Total:=Service_cost_Total+jl2;
totalroomcost:=totalroomcost+roomcost+jl1;
end;
/
create or replace procedure augc(looprid in int,roomcost in int,ag1 in int,ag2 in int,totalroomcost in out int,Service_cost_Total out int) as
cursor c2 is select S_Id,Service_Start_Date,Service_End_Date  from Mappings where Mappings.R_Id=looprid;
serid int;start_date date;Total number;
end_date date;no_of_days number;scost number;Total_services_cost number;
begin
Total:=0;Total_services_cost:=0;
open c2; loop
fetch c2 into serid,start_date,end_date;
exit when c2%notfound;
no_of_days:=end_date-start_date;
select services_cost into scost from services where s_id=serid;
Total_services_cost:=no_of_days*scost;
--dbms_output.put_line('s_id is    '||serid  ||'  '|| 'service cost is  '||scost);
dbms_output.put_line('Total cost per each service is    '||Total_services_cost ||'    ='||no_of_days||'*'||scost);
Total:=Total+Total_services_cost;end loop;
Service_cost_Total:=Total;close c2;
Service_cost_Total:=Service_cost_Total+ag2;
totalroomcost:=totalroomcost+roomcost+ag1;
end;
/
create or replace procedure sepc(looprid in int,roomcost in int,sp1 in int,sp2 in int,totalroomcost in out int,Service_cost_Total out int) as
cursor c2 is select S_Id,Service_Start_Date,Service_End_Date  from Mappings where Mappings.R_Id=looprid;
serid int;start_date date;Total number;
end_date date;no_of_days number;scost number;Total_services_cost number;
begin
Total:=0;Total_services_cost:=0;
open c2; loop
fetch c2 into serid,start_date,end_date;
exit when c2%notfound;
no_of_days:=end_date-start_date;
select services_cost into scost from services where s_id=serid;
Total_services_cost:=no_of_days*scost;
--dbms_output.put_line('s_id is    '||serid  ||'  '|| 'service cost is  '||scost);
dbms_output.put_line('Total cost per each service is    '||Total_services_cost ||'    ='||no_of_days||'*'||scost);
Total:=Total+Total_services_cost;end loop;
Service_cost_Total:=Total;close c2;
Service_cost_Total:=Service_cost_Total+sp2;
totalroomcost:=totalroomcost+roomcost+sp1;

end;
/
create or replace procedure octc(looprid in int,roomcost in int,oc1 in int,oc2 in int,totalroomcost in out int,Service_cost_Total out int) as
cursor c2 is select S_Id,Service_Start_Date,Service_End_Date  from Mappings where Mappings.R_Id=looprid;
serid int;start_date date;Total number;
end_date date;no_of_days number;scost number;Total_services_cost number;
begin
Total:=0;Total_services_cost:=0;
open c2; loop
fetch c2 into serid,start_date,end_date;
exit when c2%notfound;
no_of_days:=end_date-start_date;
select services_cost into scost from services where s_id=serid;
Total_services_cost:=no_of_days*scost;
--dbms_output.put_line('s_id is    '||serid  ||'  '|| 'service cost is  '||scost);
dbms_output.put_line('Total cost per each service is    '||Total_services_cost ||'    ='||no_of_days||'*'||scost);
Total:=Total+Total_services_cost;end loop;
Service_cost_Total:=Total;close c2;
Service_cost_Total:=Service_cost_Total+oc2;
totalroomcost:=totalroomcost+roomcost+oc1;
end;
/
create or replace procedure novc(looprid in int,roomcost in int,nv1 in int,nv2 in int,totalroomcost in out int,Service_cost_Total out int) as
cursor c2 is select S_Id,Service_Start_Date,Service_End_Date  from Mappings where Mappings.R_Id=looprid;
serid int;start_date date;Total number;
end_date date;no_of_days number;scost number;Total_services_cost number;
begin
Total:=0;Total_services_cost:=0;
open c2; loop
fetch c2 into serid,start_date,end_date;
exit when c2%notfound;
no_of_days:=end_date-start_date;
select services_cost into scost from services where s_id=serid;
Total_services_cost:=no_of_days*scost;
--dbms_output.put_line('s_id is    '||serid  ||'  '|| 'service cost is  '||scost);
dbms_output.put_line('Total cost per each service is    '||Total_services_cost ||'    ='||no_of_days||'*'||scost);
Total:=Total+Total_services_cost;end loop;
Service_cost_Total:=Total;close c2;
Service_cost_Total:=Service_cost_Total+nv2;
totalroomcost:=totalroomcost+roomcost+nv1;
end;
/
create or replace procedure decc(looprid in int,roomcost in int,dc1 in int,dc2 in int,totalroomcost in out int,Service_cost_Total out int) as
cursor c2 is select S_Id,Service_Start_Date,Service_End_Date  from Mappings where Mappings.R_Id=looprid;
serid int;start_date date;Total number;
end_date date;no_of_days number;scost number;Total_services_cost number;
begin
Total:=0;Total_services_cost:=0;
open c2; loop
fetch c2 into serid,start_date,end_date;
exit when c2%notfound;
no_of_days:=end_date-start_date;
select services_cost into scost from services where s_id=serid;
Total_services_cost:=no_of_days*scost;
--dbms_output.put_line('s_id is    '||serid  ||'  '|| 'service cost is  '||scost);
dbms_output.put_line('Total cost per each service is    '||Total_services_cost ||'    ='||no_of_days||'*'||scost);
Total:=Total+Total_services_cost;end loop;
Service_cost_Total:=Total;close c2;
Service_cost_Total:=Service_cost_Total+dc2;
totalroomcost:=totalroomcost+roomcost+dc1;
end;
--Calling Procedure Change_ResDate.----9A
--a.	Change Arnold’s reservation of a conference hall to Jun 1 – Jun 5
/
exec Change_ResDate(2,to_date('01-06-2021','dd-mm-yyyy'),to_date('05-06-2021','dd-mm-yyyy'));
--Displaying the New Checkin &Checkout dates after updating.
select R_Checkin_Date,R_Checkout_Date from reservation where r_Id=2;

--executing the procedure--9B
exec Change_Roomtype(5,'Single');

--Execution of the procedure hotel_reservations.--10
exec hotel_reservation(4);

--calling the procedure--11
exec guestReservation('John');

--calling the procedure---12
exec MonthlyIncomeReport;




---------------------------------------------------------------------------------------------------------

--creating procedure to add services to a reservation ID
create or replace procedure add_services(reservation_id int, service_names sys.odcivarchar2list, service_start date, service_end date) 
as

/* sys.odcivarchar2list allows to take variable length character, can be used as an array */
    x mappings%rowtype; -- variable from mappings table of rowtype
    item mappings%rowtype; -- variable temp_count: will be  used to check if service already added
    Service_start_date int;
    service_exist boolean := false;
    S_ID INT; -- declaring variable S_ID 
    Begin 
    
    x.R_ID := reservation_id; -- selecting R_ID where services will be added
    x.Service_start_date := service_start; -- assigning the start of service
    x.Service_end_date := service_end; -- assigning the end date of a services
    x.creation_date := CURRENT_DATE; -- creation or updation date of mapping table
    
    FOR i IN 1..service_names.count LOOP   -- loop starts to check service_names 
--        select services.S_ID into S_ID from services where s_name = service_names(i);
        select services.S_ID into x.S_ID from services where s_name = service_names(i); -- putting S_ID from service tables into S_ID of mapping table
--        select count(mappings.M_ID)  into temp_count from mappings where R_ID = reservation_id AND S_ID = x.S_ID; -- putting mappings ID into temp_out variable
--        CURSOR items IS select * from mappings where R_ID = reservation_id AND S_ID = x.S_ID; 
        FOR item IN (select * from mappings where R_ID = reservation_id AND S_ID = x.S_ID) LOOP 
            IF (TO_CHAR(service_start, 'DD-MM-YYYY') >= TO_CHAR(item.service_start_date, 'DD-MM-YYYY') AND 
                TO_CHAR(service_end, 'DD-MM-YYYY') <= TO_CHAR(item.service_end_date, 'DD-MM-YYYY')) THEN 
                service_exist := true;  
            END IF;
        END LOOP;
         
        IF service_exist = true THEN
            DBMS_OUTPUT.PUT_LINE('Service ' || service_names(i) || ' is already added!'); -- print this when service aleady present
        ELSE 
            insert into mappings values x;

        END IF;
--        select services_start_date into temp_count from mappings; 
--        select services_end_date into temp_count from mappings;
       service_exist := false;  
    END LOOP;
exception -- when service which is not present but tried to be inserted then this exception will be raised!!
when NO_DATA_FOUND
then
dbms_output.put_line('one or more services you entered is not present!');
end;
/


/* executing proceduree add_services */
exec add_services(2, sys.odcivarchar2list('RESTAURANT'), TO_DATE('10-MAY-2021'), TO_DATE('15-MAY-2021'));

exec add_services(2, sys.odcivarchar2list('RESTAURANT'), TO_DATE ('01-MAY-2021'), TO_DATE ('10-MAY-2021'));


exec add_services(2, sys.odcivarchar2list('Pay-per-Movies'), to_date('01-MAY-21'), to_date('01-MAY-21'));
exec add_services(3, sys.odcivarchar2list('RESTAURANT'), to_date('01-MAY-21'), to_date('01-MAY-21'));
exec add_services(4, sys.odcivarchar2list('Laundry'), to_date('01-MAY-21'), to_date('01-MAY-21'));
exec add_services(1, sys.odcivarchar2list('Laundry'), to_date('01-MAY-21'), to_date('01-MAY-21'));
exec add_services(5, sys.odcivarchar2list('Laundry'), to_date('01-MAY-21'), to_date('01-MAY-21'));


exec add_services(2, sys.odcivarchar2list('Laundry'), to_date('01-MAY-2021'), to_date('02-MAY-2021'));

select * from mappings;
delete from mappings where M_Id = 10;

set serveroutput on;
create or replace procedure show_services(reservation_id int) -- creating procedure to display services of a particular reservation(MEMBER 4: TASK 2)
as CURSOR service_names IS -- cursor declaration
       
        select M_ID,R_ID ,services.S_ID,S_name    -- select query to show mapping ID, reservation ID, Services ID, services Name
        from mappings 
        inner join services on mappings.S_ID = services.S_ID -- Join operation on mapping table and services table 
        where (R_ID = reservation_id and service_start_date = '01-MAY-2021' and Service_end_date = '10-MAY-2021'); 
R_ID int; -- declaring variable R_ID       
output_row service_names%rowtype; -- declaring variable output_row as rowtype
BEGIN
    OPEN service_names; --opening cursor
    LOOP 

        FETCH service_names INTO output_row; -- fetching cursor services_name into output_row variable of type ROW_TYPE
        select reservation.R_ID into R_ID from reservation where reservation_id=R_id;
        IF service_names%NOTFOUND
        THEN
            IF service_names%ROWCOUNT = 0
            THEN
                DBMS_OUTPUT.PUT_LINE('No Services Found for this Reservation!'); -- print this when cursor is empty i.e when no service found
            END IF;
            EXIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE('R_ID: ' || output_row.R_ID || ', Service: ' || output_row.S_name); -- when cursor not empty i.e when services are found
        END IF;

    END LOOP;
    CLOSE service_names; -- closing cursor 
exception -- when try to see services for invalid reservation id this exception will be raised
when no_data_found 
then dbms_output.put_line('ENTER A VALID Reservation ID!');
END;
/
exec show_services(2);

exec show_services(5); 

exec show_services(8); 

--Deliverable 3 Member 4 task 3
-- Show specific report
create or replace procedure show_service_report(service_name varchar) as CURSOR Service_report IS

 select MAPPINGS.R_ID, services.S_ID, S_name, reservation.H_ID, hotel.H_NAME -- Select query to display the Services and Hotel name
 from SERVICES
 inner join MAPPINGS on mappings.S_ID = services.S_ID -- joining services table to mappings table on S_ID
 inner join RESERVATION on mappings.R_ID  = reservation.R_ID -- joining reservation table to mappings table on R_ID
 inner join HOTEL on reservation.H_ID = hotel.H_ID  -- Joining hotel table to reservation table on H_ID
 where S_name = service_name;
 
 output_row Service_report%rowtype; -- declaring variable output_row as rowtype
s_name varchar(100);
BEGIN
    OPEN Service_report; --opening cursor
    LOOP 

        FETCH Service_report INTO output_row; -- fetching cursor services_report into output_row variable of type ROW_TYPE
        select services.S_name into S_name from services where service_name=services.S_name;
        IF Service_report%NOTFOUND
        THEN
            IF Service_report%ROWCOUNT = 0
            THEN
                DBMS_OUTPUT.PUT_LINE('No Reservations Found for this Service!'); -- print this when cursor is empty i.e when no reservation found
            END IF;
            EXIT;
        ELSE
            DBMS_OUTPUT.PUT_LINE('R_ID: ' || output_row.R_ID || ', Service: ' || output_row.S_name || ', Hotel : ' || output_row.H_name ); -- when cursor not empty i.e when reservations are found
        END IF;

    END LOOP;
    CLOSE Service_report; -- closing cursor 
exception -- when try to see RESERVATIONS for invalid SERVICE id this exception will be raised
when no_data_found 
then dbms_output.put_line('ENTER A VALID Service name!');
END;
/

exec show_service_report('RESTAURANT'); 
exec show_service_report('Spa'); 
exec show_service_report('Swim'); 







--Total services income report
create or replace procedure Total_Income_Report(HOTEL_ID int) as CURSOR Income_Report is 

select Mappings.S_ID -- select query to check if the given hotel id has the services provided or not!
from Mappings
 inner join SERVICES on mappings.S_ID = services.S_ID --joining table services to mpping on S_ID
 inner join RESERVATION on mappings.R_ID  = reservation.R_ID -- joining table reservation to mappings on R_ID
 inner join HOTEL on reservation.H_ID = hotel.H_ID --joining table hotel to reservation on H_ID
where Reservation.H_ID = HOTEL_ID;


output_row Income_Report%rowtype; -- declaring variable output_row as rowtype


Services_cost int; -- declaring variable services_cost
H_ID int; -- declaring variable H_ID
begin
open Income_Report; -- opening the cursor

fetch Income_Report into output_row; -- fetching cursor into output_row variable
select Hotel.H_ID into H_ID from Hotel where HOTEL.H_ID = HOTEL_ID; -- select query to check if the given hotel ID is valid or not

IF Income_Report%NOTFOUND -- if condition to check if the given hotel ID has services present or not
        THEN
            IF Income_Report%ROWCOUNT = 0
            THEN
                DBMS_OUTPUT.PUT_LINE('No Services Found for this Hotel!'); -- print this when cursor is empty i.e when no service found
            END IF;
        
        ELSE

select sum(Services_Cost) into services_cost -- using the aggregation function to calculate the total cost of services
from Mappings
 inner join SERVICES on mappings.S_ID = services.S_ID --joining table services to mpping on S_ID
 inner join RESERVATION on mappings.R_ID  = reservation.R_ID -- joining table reservation to mappings on R_ID
 inner join HOTEL on reservation.H_ID = hotel.H_ID  --joining table hotel to reservation on H_ID
 where Reservation.H_ID = HOTEL_ID;


 DBMS_OUTPUT.PUT_LINE( 'The total cost of service for hotel:' || '  ' ||    'H4' ||  '  ' || 'is:'   ||'   '|| services_cost || ' $');
          
END IF;


CLOSE Income_Report; -- closing cursor
Exception -- this exception will be raised when try to enter invalid hotel id
when NO_DATA_FOUND then
dbms_output.put_line('please enter valid Hotel id');
end;
/

exec TOTAL_INCOME_REPORT(2); 
exec TOTAL_INCOME_REPORT(5);   
exec TOTAL_INCOME_REPORT(8); 

----------------------------------------------------




Set SERVEROUTPUT ON;

create or replace Procedure HotelTable(htid in int)
AS
HotelIdd integer;
/*add_Single integer;
add_Double integer;
add_Suite integer;*/
add_Conference integer;

Begin
HotelIdd:= htid;
/*add_Single := &add_Single ;
add_Double := &add_Double ;
add_Suite := &add_Suite ;*/
add_Conference := 10 ;
 
update Hotel
SET
/*H_Single_Room = H_Single_Room + (add_Single),
H_Double_Room = H_Double_Room + (add_Double),
H_Suite = H_Suite + (add_Suite), */
H_Conference_Room = H_Conference_Room + (add_Conference)
where H_Id = HotelIdd;

Exception
when no_data_found then
Dbms_output.put_line('no rows found');
when too_many_rows then
dbms_output.put_line('too many rows');
when others then
dbms_output.put_line('other error');
End;
/
EXEC HotelTable(4);

select*from Hotel;



Set SERVEROUTPUT ON;
create or replace Procedure HotelT(hti in int)
AS
HotelI integer;
Single1 integer;
Double1 integer;
Suite1 integer;
Conference1 integer;
Begin
HotelI:=hti;
select H_Single_Room into Single1 from Hotel where H_Id = HotelI;
select H_Double_Room into Double1 from Hotel where H_Id= HotelI;
select H_Suite into Suite1 from Hotel where H_Id= HotelI;
select H_Conference_Room into Conference1 from Hotel where H_Id= HotelI;
dbms_output.put_line('    H_Single '|| '     H_Double ' ||'     H_Suite ' ||'     H_Conference ');
dbms_output.put_line('  '|| Single1||'            '||Double1||'             '|| Suite1||'            '||Conference1);

Exception
when no_data_found then
Dbms_output.put_line('no rows found');
when too_many_rows then
dbms_output.put_line('too many rows');
when others then
dbms_output.put_line('other error');
End;
/
EXEC HotelT(4);



Set ServerOutput On;
Create or replace
PROCEDURE CR1(resid in int) AS

Cursor c10 is Select C_Fname, C_Lname, R_Room_No, R_Room_Rate, S_Name, Services_Cost, Service_start_date, Service_end_date, B_Amount from
    Customer_Details, Rooms, Hotel, Services, Reservation, Billing, Mappings
    where  Reservation.R_Id = resid and
    Customer_Details.C_Id = Reservation.C_Id and
    Rooms.R_Room_Id = Reservation.R_Room_Id and
    Services.S_Id = Reservation.S_Id and
    Hotel.H_Id = Reservation.H_Id and
    Mappings.R_Id = Reservation.R_Id and
    Billing.R_Id = Reservation.R_Id; -- cursor def
C_F Customer_Details.C_Fname%type; -- variable to hold results
C_L Customer_Details.C_Lname%type; -- variable to hold results
    rrt Rooms.R_Room_Rate%type;
    rrn Reservation.R_Room_No%type;
    sname Services.S_Name%type; -- variable to hold results
scost Services.Services_Cost%type; -- variable to hold results
    ssd Mappings.Service_start_date%type; -- variable to hold results
sed Mappings.Service_end_date%type;
    ba Billing.B_Amount%type;-- variable to hold results
begin
open c10; -- open cursor
--loop
fetch c10 into C_F, C_L, rrn, rrt, sname, scost, ssd, sed, ba; -- fetch
-- exit when c10%NOTFOUND; --- exit check
dbms_output.put_line('Customer First Name '||'Customer Last Name '||'Room Number '||'Room Rate '||'Service Name '||'Service Cost '||'Service Start Date '||'Service End Date'||' Billing Amount');
dbms_output.put_line('      '||C_F||'               '||C_L||'          '||rrn||'         '||rrt||'       '||sname||'       '||scost||'            '||ssd||'           '||sed||'            '||ba);
--end loop;
Close c10; -- close cursor
END;
/
EXEC CR1(1);
EXEC CR1(2);
EXEC CR1(3);
EXEC CR1(4);
EXEC CR1(5);



set serveroutput on;
create or replace  procedure q3(state2 in Hotel.H_State%type)as
cursor c5 is select distinct Hotel.H_Id from Hotel where Hotel.H_State='MD';
reservationDate1 Reservation.Reserve_Date%type;
hotelId1 Reservation.H_Id%type;
StartDate1 Reservation.R_Checkin_Date%type;
enddate1 Reservation.R_Checkout_Date%type;
Nofdays int;
reservation_month int;
NofsingleRooms int;
NofDoubleRooms int;
NofSuites int;
NofconferenceRooms int;

movieservices varchar(100);
laundryservices varchar(100);
restaurantservices varchar(100);
gymservices varchar(100);
spaservices varchar(100);
restaservices varchar(100);
totalAmount integer;
hotelTotalAmount integer;



begin

open c5;
totalAmount:=0;
loop

fetch c5 into hotelId1;
exit when c5%notfound;

hotelTotalAmount:=0;

FOR reservations IN (select * from reservation where reservation.H_id = hotelId1) LOOP 

reservation_month:=0; 
Nofdays:=0;
NofsingleRooms:=0;
NofDoubleRooms:=0;
NofSuites:=0;
NofconferenceRooms:=0;



--select count(Single_room_qty) into NofsingleRooms
--from Reservation, Hotel
--where Hotel.H_State=state2 and Hotel.H_Id=Reservation.H_Id;
select sum(Reservation.Single_room_qty) into NofsingleRooms
from Reservation
where Reservation.H_Id=hotelId1;
dbms_output.put_line('NofsingleRooms :' || NofsingleRooms);

select sum(Reservation.Double_room_qty) into NofDoubleRooms
from Reservation
where Reservation.H_Id=hotelId1;
dbms_output.put_line('NofDoubleRooms :' || NofDoubleRooms);

select sum(Reservation.Suite_qty) into NofSuites
from Reservation
where Reservation.H_Id=hotelId1;
dbms_output.put_line('NofSuites :' || NofSuites);

select sum(Reservation.Conference_room_qty) into NofconferenceRooms
from Reservation
where Reservation.H_Id=hotelId1;
dbms_output.put_line('NofconferenceRooms :' || NofconferenceRooms);

select count(*) into movieservices from Reservation, Hotel, Services where Hotel.H_State=state2 and Services.S_Name='Pay-per-Movies' and Hotel.H_Id=Reservation.H_Id and Reservation.S_Id=Services.S_Id;
if movieservices='Pay-per-Movies' then
dbms_output.put_line('movieservices :' || movieservices);
else
dbms_output.put_line('movieservices :' || '  ' || movieservices);
end if;

select count(*) into laundryservices from Reservation, Hotel, Services where Hotel.H_State=state2 and Services.S_Name='Laundry' and Hotel.H_Id=Reservation.H_Id and Reservation.S_Id=Services.S_Id;
if laundryservices='Laundry' then
dbms_output.put_line('laundryservices :' || laundryservices);
else
dbms_output.put_line('laundryservices :' || '  ' || laundryservices);
end if;

select count(*) into restaurantservices from Reservation, Hotel, Services where Hotel.H_State=state2 and Services.S_Name='Restaurant' and Hotel.H_Id=Reservation.H_Id and Reservation.S_Id=Services.S_Id;
if restaurantservices = 'Restaurant'  then
dbms_output.put_line('restaurantservices :' || restaurantservices);
else
dbms_output.put_line('restaurantservices :' || '  ' || restaurantservices);
end if;

select count(*) into gymservices from Reservation, Hotel, Services where Hotel.H_State=state2 and Services.S_Name='Gym' and Hotel.H_Id=Reservation.H_Id and Reservation.S_Id=Services.S_Id;
if gymservices = 'Gym'  then
dbms_output.put_line('gymservices :' || gymservices);
else
dbms_output.put_line('gymservices :' || '  ' || gymservices);
end if;

select count(*) into spaservices from Reservation, Hotel, Services where Hotel.H_State=state2 and Services.S_Name='Spa' and Hotel.H_Id=Reservation.H_Id and Reservation.S_Id=Services.S_Id;
if spaservices = 'Spa'  then
dbms_output.put_line('spaservices :' || spaservices);
else
dbms_output.put_line('spaservices :' || '  ' || spaservices);
end if;

select count(*) into restaservices from Reservation, Hotel, Services where Hotel.H_State=state2 and Services.S_Name='Resta' and Hotel.H_Id=Reservation.H_Id and Reservation.S_Id=Services.S_Id;
if restaservices = 'Resta'  then
dbms_output.put_line('restaservices :' || restaservices);
else
dbms_output.put_line('restaservices :' || '  ' || restaservices);
end if;

reservation_month:=extract(month from reservations.R_Checkin_Date);
Nofdays:= reservations.R_Checkout_Date - reservations.R_Checkin_Date;
dbms_output.put_line('Nofdays :' || '  ' || Nofdays);

if reservation_month=5 OR reservation_month=6 or reservation_month=7 or reservation_month=8 THEN
    hotelTotalAmount:= hotelTotalAmount + ((NofsingleRooms*300 + NofDoubleRooms*500+NofSuites*900+NofconferenceRooms*5000)*Nofdays)+movieservices*25+laundryservices*20+restaurantservices*50+gymservices*20+spaservices*60+restaservices*100;
else
    hotelTotalAmount:= hotelTotalAmount + ((NofsingleRooms*100+NofDoubleRooms*500+NofSuites*900+NofconferenceRooms*1000)*Nofdays)+movieservices*25+laundryservices*20+restaurantservices*50+gymservices*20+spaservices*60+restaservices*100;
end if;

end loop;
dbms_output.put_line('hoteltotalAmount :' || '  ' || hotelTotalAmount);
totalAmount := totalAmount + hotelTotalAmount;
hotelTotalAmount := 0;
end loop;
dbms_output.put_line('totalAmount :' || '  ' || totalAmount);
close c5;
end;
/
exec q3('MD');




