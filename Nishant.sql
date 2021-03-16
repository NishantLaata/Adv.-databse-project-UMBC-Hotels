/* 
   Advance Database Project
   Deliverable D2 Due 3/10
   
   Team 6
   
*/


Drop table Customer_Details;

create table Customer_Details(
C_Id int not null primary key,
C_FName varchar(50) not null,
C_LName varchar(50) not null,
C_Address varchar(250) not null,
C_PhoneNO int not null,
C_Gender varchar(50),
C_DOB varchar(30),
C_Nationality varchar(50) not null,
C_CardDetails int not null,
C_VarificationId varchar(50)
);


create sequence C_ID_seq;

CREATE OR REPLACE TRIGGER Customer_ID_increment -- creating trigger for auto incrementation of primary key
  BEFORE INSERT ON customer_details
  FOR EACH ROW
BEGIN
  SELECT C_ID_seq.nextval
  INTO :new.C_ID
  FROM dual;
END;


insert into Customer_Details(C_FName,C_LName,C_Address,C_PhoneNO,C_Gender,C_DOB,C_Nationality,C_CardDetails,C_VarificationId) values ('John','Smith','Virgina',1234567890,'M','04-08-1990','American','222245673462','Passport');
insert into Customer_Details(C_FName,C_LName,C_Address,C_PhoneNO,C_Gender,C_DOB,C_Nationality,C_CardDetails,C_VarificationId) values ('Sophie','Willam','Boston',2345678910,'F','05-05-1980','American','222345673462','Driving License');
insert into Customer_Details(C_FName,C_LName,C_Address,C_PhoneNO,C_Gender,C_DOB,C_Nationality,C_CardDetails,C_VarificationId) values ('Adam','Potter','Houston',1234657890,'M','09-01-1999','American','223345673462','Passport');
insert into Customer_Details(C_FName,C_LName,C_Address,C_PhoneNO,C_Gender,C_DOB,C_Nationality,C_CardDetails,C_VarificationId) values ('Victor','Shaw','Cairo',1220567890,'M','06-02-1980','African','222245611162','Passport');
insert into Customer_Details(C_FName,C_LName,C_Address,C_PhoneNO,C_Gender,C_DOB,C_Nationality,C_CardDetails,C_VarificationId) values ('John','Smith','Sydney',18965567890,'M','07-02-1992','Australian','222245432162','Passport');

select * from Customer_Details;


drop table rooms;

create table Rooms(
R_Room_Id int primary key not null,
R_Room_Type varchar (100) not null,
R_Room_Rate float(100),
R_Room_Amenities varchar (1000) not null);

create sequence R_Room_ID_seq;

CREATE OR REPLACE TRIGGER rooms_ID_increment  -- creating trigger for auto incrementation of primary key
  BEFORE INSERT ON rooms
  FOR EACH ROW
BEGIN
  SELECT R_Room_ID_seq.nextval
  INTO :new.R_Room_ID
  FROM dual;
END;



insert into Rooms(R_Room_Type ,R_Room_Rate,R_Room_Amenities) values ('Single','100.0','AC Available');
insert into Rooms(R_Room_Type ,R_Room_Rate,R_Room_Amenities) values ('Double','200.0','Extra children bed,AC Available');
insert into Rooms(R_Room_Type ,R_Room_Rate,R_Room_Amenities) values ('Suite','500.0','Fridge,Sofa,AC Available');
insert into Rooms(R_Room_Type ,R_Room_Rate,R_Room_Amenities) values ('Conference Room','1000.0','Sofa,AC Available');
insert into Rooms(R_Room_Type ,R_Room_Rate,R_Room_Amenities) values ('Single','300.0','AC Available');
insert into Rooms(R_Room_Type ,R_Room_Rate,R_Room_Amenities) values ('Double','500.0','Extra children bed,AC Available');
insert into Rooms(R_Room_Type ,R_Room_Rate,R_Room_Amenities) values ('Suite','900.0','Fridge,Sofa,AC Available');
insert into Rooms(R_Room_Type ,R_Room_Rate,R_Room_Amenities) values ('Conference','5000.0','AC Available');

select * from Rooms;
 
 
drop table hotel;

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
H_Rooms varchar(1000) not null,
H_Capacity varchar(100) not null,
R_Room_Id int not null,
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


insert into Hotel(H_Name,H_Street,H_City,H_State,H_Country,H_Zipcode,H_Phone_number,H_Email_id,H_Rooms, H_Capacity, R_Room_Id ) values 
('Springhill','Elkridge','Baltimore','Maryland','USA','123456','2222456734','spu@gmail.com','Single, Double, Suite,  Conference', '50, 20, 5,2', '1');

insert into Hotel(H_Name,H_Street,H_City,H_State,H_Country,H_Zipcode,H_Phone_number,H_Email_id,H_Rooms, H_Capacity, R_Room_Id ) values 
('Hilton','Linthicum','Baltimore','Maryland','USA','123356','2222116734','shpu@gmail.com','Single, Double, Suite,  Conference', '60, 30, 7, 4', '2');

insert into Hotel(H_Name,H_Street,H_City,H_State,H_Country,H_Zipcode,H_Phone_number,H_Email_id,H_Rooms, H_Capacity, R_Room_Id ) values 
('Chapel','Hilltop','Baltimore','Maryland','USA','1113456','2233456734','chspu@gmail.com','Single, Double, Suite,  Conference', '70, 40, 10, 7', '3');

insert into Hotel(H_Name,H_Street,H_City,H_State,H_Country,H_Zipcode,H_Phone_number,H_Email_id,H_Rooms, H_Capacity, R_Room_Id ) values 
('Shola','Drayton','Baltimore','Maryland','USA','123416','2002456734','dras@gmail.com','Single, Double, Suite,  Conference', '80, 60, 15,6', '4');

insert into Hotel(H_Name,H_Street,H_City,H_State,H_Country,H_Zipcode,H_Phone_number,H_Email_id,H_Rooms, H_Capacity, R_Room_Id ) values 
('Aldgate Green','Catsonville','Baltimore','Maryland','USA','333456','2222456111','dffdspu@gmail.com','Single, Double, Suite,  Conference', '90, 90, 55,9', '5');


select * from Hotel;



drop table services;

create table Services
(
S_Id int primary key not null,
S_Name varchar(55),
Services_Cost int
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


insert into Services(S_NAME,Services_Cost) values('laundry','20');
insert into Services(S_NAME,Services_Cost) values('RESTAURANT','50');
insert into Services(S_NAME,Services_Cost) values('Pay-per-Movies','25');
insert into Services(S_NAME,Services_Cost) values('Gym','20');
insert into Services(S_NAME,Services_Cost) values('Spa','60');
insert into Services(S_NAME,Services_Cost) values('Restaurant','100');

select * from Services;



drop table reservation;


create table Reservation
(
R_Id int primary key not null,
R_Checkin_Date date,
R_Checkout_Date date,
R_Special_Offers varchar(200),
C_Id int not null,
foreign key (C_Id) references Customer_Details(C_Id),
H_Id int not null,
foreign key (H_Id) references Hotel(H_Id),
S_Id int not null,
foreign key (S_Id) references Services(S_Id),
R_Room_Id int not null,
foreign key (R_Room_Id) references Rooms(R_Room_Id)
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



insert into Reservation(R_Checkin_Date ,R_Checkout_Date ,R_Special_Offers, C_Id ,H_Id ,S_Id ,R_Room_Id ) values(to_date('03-MARCH-2021'),to_date('07-MARCH-2021'),'diwali','1','1','1','1');
insert into Reservation(R_Checkin_Date ,R_Checkout_Date ,R_Special_Offers, C_Id ,H_Id ,S_Id ,R_Room_Id ) values(to_date('04-APRIL-2021'),to_date('06-APRIL-2021'),'pongal','2','2','2','2');
insert into Reservation(R_Checkin_Date ,R_Checkout_Date ,R_Special_Offers, C_Id ,H_Id ,S_Id ,R_Room_Id ) values(TO_DATE('05-JUNE-2021'),TO_DATE('08-JUNE-2021'),'holi','3','3','3','3');
insert into Reservation(R_Checkin_Date ,R_Checkout_Date ,R_Special_Offers, C_Id ,H_Id ,S_Id ,R_Room_Id ) values(to_date('06-MAY-021'),to_date('06-MAY-2021'),'christmas','4','4','4','4');
insert into Reservation(R_Checkin_Date ,R_Checkout_Date ,R_Special_Offers, C_Id ,H_Id ,S_Id ,R_Room_Id ) values(to_date('01-JUNE-2021'),to_date('09-JUNE-2021'),'no_offers','5','5','5','5');


select * from Reservation;



drop table billing;

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


insert into Billing(B_Amount ,B_Payment_Method ,R_Id) values('1250','online netbanking','1');
insert into Billing(B_Amount ,B_Payment_Method ,R_Id) values('1700','Credit Card','2');
insert into Billing(B_Amount ,B_Payment_Method ,R_Id) values('2100','Debit Card','3');
insert into Billing(B_Amount ,B_Payment_Method ,R_Id) values('1170','online netbanking','4');
insert into Billing(B_Amount ,B_Payment_Method ,R_Id) values('1800','PayPal','5');


select * from Billing;



drop table Mappings;

create table mappings(M_ID int primary key , R_ID int, foreign key (R_ID) references Reservation(R_ID),S_ID int, foreign key (S_ID) references Services(S_ID),creation_date date,Service_start_date date, Service_end_date date);

create sequence M_ID_seq;

CREATE OR REPLACE TRIGGER mappings_ID_increment  -- creating trigger for auto incrementation of primary key
  BEFORE INSERT ON mappings
  FOR EACH ROW
BEGIN
  SELECT M_ID_seq.nextval
  INTO :new.M_ID
  FROM dual;
END;



insert into mappings(R_ID ,S_ID ,creation_date ,Service_start_date , Service_end_date) values(2,3, CURRENT_DATE ,to_date('03-MARCH-2021'),to_date('07-MARCH-2021'));
insert into mappings(R_ID ,S_ID ,creation_date ,Service_start_date , Service_end_date) values(3,1, CURRENT_DATE,to_date('07-MARCH-2021'),to_date('14-MARCH-2021'));
insert into mappings(R_ID ,S_ID ,creation_date ,Service_start_date , Service_end_date) values(3,2, CURRENT_DATE,to_date('10-MARCH-2021'),to_date('17-MARCH-2021'));
insert into mappings(R_ID ,S_ID ,creation_date ,Service_start_date , Service_end_date) values(3, 4 , CURRENT_DATE,to_date('03-MARCH-2021'),to_date('27-MARCH-2021'));

select * from mappings;


set serveroutput on;


--adding multiple services to a reservation id for a particular date 

--creating procedure to add services to a reservation ID(MEMBER 4: Task 1)
create or replace procedure add_services(reservation_id int, service_names sys.odcivarchar2list, service_start date, service_end date) 
as
/* sys.odcivarchar2list allows to take variable length character, can be used as an array */
    x mappings%rowtype; -- variable from mappings table of rowtype
    temp_count int; -- variable temp_count: will be  used to check if service already added
    S_ID INT; -- declaring variable S_ID 
    Begin
    x.R_ID := reservation_id; -- selecting R_ID where services will be added
    x.Service_start_date := service_start; -- assigning the start of service
    x.Service_end_date := service_end; -- assigning the end date of a services
    x.creation_date := CURRENT_DATE; -- creation or updation date of mapping table
    
    FOR i IN 1..service_names.count LOOP   -- loop starts to check service_names 
        select services.S_ID into S_ID from services where s_name = service_names(i);
        select services.S_ID into x.S_ID from services where s_name = service_names(i); -- putting S_ID from service tables into S_ID of mapping table
        select count(mappings.M_ID)  into temp_count from mappings where R_ID = reservation_id AND S_ID = x.S_ID; -- putting mappings ID into temp_out variable
        IF temp_count > 0 THEN 
            DBMS_OUTPUT.PUT_LINE('Service ' || service_names(i) || ' is already added!'); -- print this when service aleady present
        ELSE
            insert into mappings values x;
        END IF;
    END LOOP;
exception -- when service which is not present but tried to be inserted then this exception will be raised!!
when NO_DATA_FOUND
then
dbms_output.put_line('one or more services you not entered is not present!');
end;


exec add_services(2, sys.odcivarchar2list('Gym', 'RESTAURANT'), '03-MAR-21', '04-MAR-21'); -- executing proceduree add_services
select * from mappings;


set serveroutput on; 



create or replace procedure show_services(reservation_id int) -- creating procedure to display services of a particular reservation(MEMBER 4: TASK 2)
as CURSOR service_names IS -- cursor declaration
       
        select M_ID,R_ID ,services.S_ID,S_name    -- select query to show mapping ID, reservation ID, Services ID, services Name
        from mappings 
        inner join services on mappings.S_ID = services.S_ID -- Join operation on mapping table and services table 
        where R_ID = reservation_id; 
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

exec show_services(3); -- executing procedure when service is present
exec show_services(5); -- when no services is present
exec show_services(8); -- when invalid Reservation ID is entered




