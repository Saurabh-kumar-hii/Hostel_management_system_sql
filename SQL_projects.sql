	create database hostel_management_system;
	use hostel_management_system;
	create table students(
	student_id int auto_increment primary key not null ,
	student_name varchar(50) not null,
	course_selected varchar(20) not null,
	phone_no varchar(15) unique not null,
	home_address varchar(50) not null
	);
    
	create table rooms(
	room_id int auto_increment primary key,
	room_type varchar(20),
	fee int ,
	floor_no int,
	room_status varchar(20) 
	);

	create table allocation(
	allocation_id int auto_increment primary key,
	student_id int not null ,
	room_id int not null,
	join_date date not null,
	leave_date date ,
	foreign key (student_id) references students(student_id) ,
	foreign key (room_id) references rooms(room_id)

	);
	create table payment(
	payment_id int auto_increment primary key ,
	student_id int,
	payment_date date,
	amount_paid int,
	amount_due int,
	foreign key (student_id) references students(student_id)
	);
	desc students;
	desc rooms;
	desc allocation;
	desc payment;

	# adding period start and ending date
	alter table payment
	add period_start date,
	add period_end date ;

	desc payment;
	insert into students(student_name,course_selected,phone_no,home_address) values
	('Aman Sharma','B.Tech','9876541203','Dehradun'),
	('Rohit Verma','BCA','8765432109','Haridwar'),
	('Saurabh Singh','B.Tech','9123456780','Agra'),
	('Kunal Joshi','MBA','7984561230','Haldwani'),
	('Vikas Pandey','B.Tech','9345612780','Kanpur'),
	('Rahul Rawat','BBA','8899123456','Rishikesh'),
	('Ankit Tiwari','B.Tech','7654983210','Ghaziabad'),
	('Deepak Bisht','BCA','9234567810','Nainital'),
	('Mohit Chauhan','B.Tech','7012345698','Gorakhpur'),
	('Nitin Negi','MBA','8567890123','Pithoragarh'),

	('Sumit Mishra','B.Tech','9785612340','Delhi'),
	('Harsh Agarwal','BBA','8123456790','Noida'),
	('Manish Nautiyal','B.Tech','9456123780','Srinagar'),
	('Tarun Dabral','MBA','7345612890','Lucknow'),
	('Yash Saxena','B.Tech','8999012345','Bareilly'),
	('Arjun Kukreti','BCA','7689123450','Tehri'),
	('Piyush Semwal','B.Tech','9234501678','Chamoli'),
	('Rakesh Bhandari','BBA','8456123097','Almora'),
	('Shivam Thakur','B.Tech','9345012786','Meerut'),
	('Lokesh Purohit','MBA','7123456980','Udham Singh Nagar'),

	('Gaurav Pathak','B.Tech','8567012349','Mathura'),
	('Vivek Kothari','BCA','9987123456','Roorkee'),
	('Sandeep Uniyal','B.Tech','8876543210','Kotdwar'),
	('Prakash Dobhal','MBA','7654012398','Rudraprayag'),
	('Ajay Bhatt','B.Tech','9234567098','Bageshwar'),
	('Ravi Shukla','BBA','8123098765','Prayagraj'),
	('Sunil Kapri','B.Tech','9345612078','Champawat'),
	('Neeraj Gusain','BCA','7012983456','Kashipur'),
	('Abhishek Tripathi','B.Tech','8899345612','Moradabad'),
	('Kapil Tandon','MBA','9783456120','Varanasi'),

	('Naveen Sharma','B.Tech','8123789456','Dehradun'),
	('Aakash Verma','BBA','9345678120','Haridwar'),
	('Raj Singh','B.Tech','7012345987','Agra'),
	('Karan Joshi','BCA','8899012765','Haldwani'),
	('Hemant Pandey','B.Tech','9234512789','Kanpur'),
	('Dinesh Rawat','MBA','8456789120','Rishikesh'),
	('Chirag Tiwari','B.Tech','9785612098','Ghaziabad'),
	('Umesh Bisht','BBA','7345098123','Nainital'),
	('Tushar Chauhan','B.Tech','8123907654','Gorakhpur'),
	('Varun Negi','BCA','9987612345','Pauri'),

	('Sahil Mishra','B.Tech','8876123490','Delhi'),
	('Jatin Agarwal','MBA','9234098765','Noida'),
	('Rohan Nautiyal','B.Tech','7012398456','Srinagar'),
	('Nakul Pant','BBA','8567123098','Lucknow'),
	('Devendra Kandari','B.Tech','9345781209','Kanpur'),
	('Mahesh Bora','BCA','8123490765','Meerut'),
	('Suresh Tamta','B.Tech','9785601234','Ghaziabad'),
	('Ramesh Lohani','MBA','8899341207','Varanasi'),
	('Naresh Pande','B.Tech','7345619028','Roorkee'),
	('Dheeraj Karki','B.Tech','9234561780','Dehradun');
	select * from students;
	select student_name from students;
	select home_address, count(*)
	from students 
	group by home_address ;

	select course_selected ,count(*)
	from students 
	group by course_selected;

	# adding rooms details 
	insert into rooms(room_type,fee,floor_no,room_status) values
	('Single',6000,1,'unavailable'),
	('Single',6000,1,'unavailable'),
	('Single',6000,2,'unavailable'),
	('Single',6000,2,'unavailable'),
	('Single',6000,3,'unavailable'),
	('Double',4500,1,'unavailable'),
	('Double',4500,1,'unavailable'),
	('Double',4500,2,'unavailable'),
	('Double',4500,2,'unavailable'),
	('Double',4500,3,'unavailable'),
	('Double',4500,3,'unavailable'),
	('Double',4500,4,'unavailable'),
	('Triple',3000,1,'unavailable'),
	('Triple',3000,1,'unavailable'),
	('Triple',3000,2,'unavailable'),
	('Triple',3000,2,'unavailable'),
	('Triple',3000,3,'unavailable'),
	('Triple',3000,3,'unavailable'),
	('Triple',3000,4,'unavailable'),
	('Triple',3000,4,'unavailable'),
	('Single',6500,4,'unavailable'),
	('Double',4700,4,'unavailable'),
	('Triple',3200,5,'unavailable'),
	('Single',7000,5,'unavailable'),
	('Double',4800,5,'unavailable');
    
	update  rooms
	set room_status = 'available'
	where room_id=21;

	select room_type ,count(*)
	from rooms
	group by room_type;

	insert into allocation(student_id,room_id,join_date,leave_date) values
	(1,1,'2024-01-26',NULL),
	(2,6,'2024-02-26',NULL),
	(3,2,'2024-03-26','2024-09-26'),
	(4,7,'2024-04-26',NULL),
	(5,3,'2024-05-26',NULL),
	(6,8,'2024-06-26','2024-12-26'),
	(7,4,'2024-07-26',NULL),
	(8,9,'2024-08-26',NULL),
	(9,5,'2024-09-26',NULL),
	(10,10,'2024-10-26',NULL),

	(11,11,'2024-01-26',NULL),
	(12,12,'2024-02-26',NULL),
	(13,13,'2024-03-26','2024-11-26'),
	(14,14,'2024-04-26',NULL),
	(15,15,'2024-05-26',NULL),
	(16,16,'2024-06-26',NULL),
	(17,17,'2024-07-26',NULL),
	(18,18,'2024-08-26',NULL),
	(19,19,'2024-09-26',NULL),
	(20,20,'2024-10-26',NULL),

	(21,21,'2023-01-26','2023-07-26'),
	(22,22,'2023-02-26',NULL),
	(23,23,'2023-03-26',NULL),
	(24,24,'2023-04-26',NULL),
	(25,25,'2023-05-26',NULL),
	(26,6,'2023-06-26','2023-12-26'),
	(27,7,'2023-07-26',NULL),
	(28,8,'2023-08-26',NULL),
	(29,9,'2023-09-26',NULL),
	(30,10,'2023-10-26',NULL),

	(31,1,'2025-01-26',NULL),
	(32,2,'2025-02-26',NULL),
	(33,3,'2025-03-26',NULL),
	(34,4,'2025-04-26',NULL),
	(35,5,'2025-05-26',NULL),
	(36,11,'2025-06-26',NULL),
	(37,12,'2025-07-26',NULL),
	(38,13,'2025-08-26',NULL),
	(39,14,'2025-09-26',NULL),
	(40,15,'2025-10-26',NULL)
	;
	select * from allocation;

	insert into payment(student_id,payment_date,period_start,period_end,amount_paid,amount_due) values
	(1,'2024-01-26','2024-01-26','2024-06-26',37500,0),
	(2,'2024-02-26','2024-02-26','2024-07-26',30000,7500),
	(3,'2024-03-26','2024-03-26','2024-08-26',40000,0),
	(4,'2024-04-26','2024-04-26','2024-09-26',35000,5000),
	(5,'2024-05-26','2024-05-26','2024-10-26',37500,0),
	(6,'2024-06-26','2024-06-26','2024-11-26',25000,12500),
	(7,'2024-07-26','2024-07-26','2024-12-26',40000,0),
	(8,'2024-08-26','2024-08-26','2025-01-26',32000,5500),
	(9,'2024-09-26','2024-09-26','2025-02-26',37500,0),
	(10,'2024-10-26','2024-10-26','2025-03-26',34000,6000),
	(11,'2024-01-26','2024-01-26','2024-06-26',37500,0),
	(12,'2024-02-26','2024-02-26','2024-07-26',28000,9500),
	(13,'2024-03-26','2024-03-26','2024-08-26',40000,0),
	(14,'2024-04-26','2024-04-26','2024-09-26',36000,4000),
	(15,'2024-05-26','2024-05-26','2024-10-26',37500,0),
	(16,'2024-06-26','2024-06-26','2024-11-26',37500,0),
	(17,'2024-07-26','2024-07-26','2024-12-26',30000,7500),
	(18,'2024-08-26','2024-08-26','2025-01-26',40000,0),
	(19,'2024-09-26','2024-09-26','2025-02-26',37500,0),
	(20,'2024-10-26','2024-10-26','2025-03-26',27000,13500),
	(21,'2023-01-26','2023-01-26','2023-06-26',37500,0),
	(22,'2023-02-26','2023-02-26','2023-07-26',40000,0),
	(23,'2023-03-26','2023-03-26','2023-08-26',26000,11500),
	(24,'2023-04-26','2023-04-26','2023-09-26',37500,0),
	(25,'2023-05-26','2023-05-26','2023-10-26',37500,0),
	(26,'2023-06-26','2023-06-26','2023-11-26',30000,10000),
	(27,'2023-07-26','2023-07-26','2023-12-26',40000,0),
	(28,'2023-08-26','2023-08-26','2024-01-26',40000,0),
	(29,'2023-09-26','2023-09-26','2024-02-26',32000,5500),
	(30,'2023-10-26','2023-10-26','2024-03-26',37500,0),
	(31,'2025-01-26','2025-01-26','2025-06-26',37500,0),
	(32,'2025-02-26','2025-02-26','2025-07-26',29000,11000),
	(33,'2025-03-26','2025-03-26','2025-08-26',40000,0),
	(34,'2025-04-26','2025-04-26','2025-09-26',40000,0),
	(35,'2025-05-26','2025-05-26','2025-10-26',33000,4500),
	(36,'2025-06-26','2025-06-26','2025-11-26',37500,0),
	(37,'2025-07-26','2025-07-26','2025-12-26',40000,0),
	(38,'2025-08-26','2025-08-26','2026-01-26',31000,6500),
	(39,'2025-09-26','2025-09-26','2026-02-26',37500,0),
	(40,'2025-10-26','2025-10-26','2026-03-26',35000,5000);

	select * from payment;
    select * from rooms;
	select * from students;
    select * from allocation;
    select * from payment;
    
    select * from payment 
       
    # practicing real life problems.
	   
    # Q1.Show all students who are currently staying in hostel and also how many?
    select students.student_name
    from students 
    join allocation on students.student_id=allocation.student_id
    where allocation.leave_date is null;
    
    #Q2.show the no of student who are stayed in hostel?
    select count(*) as total_students_stayed_inHostel
    from allocation 
    where leave_date is null;
    
    #Q3.show the rooms which are available?
	SELECT * FROM rooms 
    WHERE room_id NOT IN (
    SELECT room_id 
    FROM allocation 
    WHERE leave_date IS NULL);
    
    #Q4.check who got room ?
    select students.student_id,student_name,allocation.join_date
    from students
    left join allocation on students.student_id=allocation.student_id ;
    
    #Q5.Find total revenue generated from hostel fees.
	select sum(amount_paid) as total_revenue
	from payment;  
    
    #Q6.List students who have pending fee.
	select student_name , amount_due
	from students s
	join payment p on s.student_id=p.student_id
	where amount_due>0;
	
    #Q7.Count number of students course-wise.
    select course_selected,count(*)
    from students
    group by course_selected;
   
   #Q8.Count number of rooms floor-wise.
    select floor_no,count(*)
    from rooms
    group by floor_no;
    
   #Q9.Show students name with their allocated room types
    select student_name,room_type
    from students s
    join allocation a on a.student_id = s.student_id 
	join rooms r on r.room_id = a.room_id;

    #Q10.Find highest fee paid by any student.
    select max(amount_paid) as maximum_amount_paid 
    from students s
    join payment p on p.student_id = s.student_id ;
   
    select  student_name,amount_paid
    from students s
    join payment p on p.student_id = s.student_id
    where p.amount_paid = (select max(amount_paid) from payment)
    limit 1;
    
   #Q11.Find number of students staying in each room type.
    select r.room_type , count(a.student_id) as total_student
    from rooms r
    join allocation a on a.room_id = r.room_id 
	group by  room_type;
    
    #Q12.Find students who never got room allocation.
    select * from students;
    select * from allocation ;
    
    select student_name from students where student_id not in(
	select s.student_id
    from students s
    join allocation a on s.student_id=a.student_id   
    where s.student_id = a.student_id);
    
    select student_name from students 
    where student_id not in (select student_id from allocation);
    
	#BONUS (Student Name + Room Type + Join Date + Payment Amount)
    select s.student_name , r.room_type , a.join_date , p.amount_paid
	from students s
	join allocation a on s.student_id = a.student_id
	join rooms r on a.room_id = r.room_id
	join payment p on s.student_id = p.student_id;


	