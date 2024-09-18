# Project:- "Library management system"

-- database
use library_management;

# Task1: Create a New Book Record: "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
insert into 
	books (isbn, book_title, category, rental_price, status, author, publisher)
values 
		("978-1-60129-456-2", 
		"To Kill a Mockingbird", 
		"Classic", 
		6.00, 
		"yes", 
		"Harper Lee", 
		"J.B. Lippincott & Co.");
        
# Task2: Update an Existing Member's Address for member_id = 103. address= 125 Oak St
update 
	members
set 
	member_address = "125 Oak St"
where 
	member_id = "C103";

# Task3: Delete the record with issued_id = 'IS121' from the issued_status table.
delete 
	from 
		issued_status
where 
	issued_id = "IS121";

# Task4: Select all books issued by the employee with emp_id = 'E101'.
select 
	issued_book_name 
	from 
		issued_status
where 
	issued_emp_id = "E101";

# Task5: List Members Who Have Issued More Than One Book.
select 
	issued_emp_id as member, 
    count(issued_id) as total_books
from 
	issued_status
group by 
	issued_emp_id
having count(issued_id) > 1;

# Task6:CTAS: Create Summary Tables:generate new tables based on query results-each book and total book counts.
create table 
	book_summary as 
select 
	book_title as book_name, 
    b.isbn, 
    count(issued_book_name) as books_count
from books b
		join issued_status i
			on i.issued_book_isbn = b.isbn
	group by book_name, b.isbn
	order by books_count desc;

-- querying the summary table
select * from book_summary;

# Task7: Retrieve All Books count with respect to each Category.
select 
	category, 
    count(book_title) as Total_books 
from books
		group by category
		order by total_books desc;

# Task 8: Find Total Rental Income by Category.
select 
	b.category, 
	count(*) as issued_count, 
	sum(b.rental_price) as income
from 
	issued_status i
		join books b
			on b.isbn = i.issued_book_isbn
	group by b.category;

# Task 9: List Members Who are Registered for more than 6 months.
select 
	member_name 
from 
	members 
where 
	datediff(current_date(), reg_date) >= 180;

# Task 10: List Employees with Their Branch Manager's Name and their branch details.
select 
	e1.*, 
    e2.emp_name as manager 
from 
	employees e1
		join branch b
	on b.branch_id = e1.branch_id
		join employees e2
	on e2.emp_id = b.manager_id
order by e1.emp_id;

#Task 11: Create a Table of Books with different Rental Price category.
create table category_of_books
as
	select
	book_title, category, rental_price, author, publisher,
		case
			when rental_price <= 5 then "Budget-Friendly"
			when rental_price >5 and rental_price <7 then "Mid-Range"
			when rental_price >= 7 then "Expensive"
		end
	as Price_segment
from books;

-- queryng the table(budget, mid, expensive)
select * from category_of_books where price_segment = "Budget-Friendly";
select * from category_of_books where price_segment = "Mid-Range";
select * from category_of_books where price_segment = "Expensive";

# Task 12: Retrieve the List of Books Not Yet Returned.
select 
	i.issued_id, 
    i.issued_book_name as book_title, 
    r.return_id 
from 
	issued_status i
		left join return_status r
			on r.issued_id = i.issued_id
where r.return_id is null;

# Task 13: Identify Members with Overdue Books:
/* Identify members who have overdue books (assuming a 30-day return period). 
Display the member's_id, member's name, book title, issue date, and days overdue */

select 
	m.member_id, 
	m.member_name, 
	i.issued_book_name, 
	i.issued_date,
	(datediff(curdate(), i.issued_date) - 30) as overdue_days
from 
	issued_status i 
		join 
			members m 
				on m.member_id = i.issued_member_id
		left join return_status r 
				on r.issued_id = i.issued_id
where r.return_date is null
order by overdue_days desc;

# Task 14: Branch Performance Report:
/* Query that generates a performance report for each branch, showing the number of books issued, 
the number of books returned, and the total revenue generated from book rentals. */

create table 
	branch_performance as
		select 
			bn.branch_id, 
			count(i.issued_id) as books_issued, 
			count(r.return_id) as books_returned,
			sum(b.rental_price) as revenue
	from issued_status i
		join employees e 
			on e.emp_id = i.issued_emp_id
		join branch bn
			on bn.branch_id = e.branch_id
		left join return_status r 
			on r.issued_id = i.issued_id
		join books b
			on b.isbn = i.issued_book_isbn
	group by bn.branch_id
	order by revenue desc;

-- querying the table
select * from branch_performance;

# Task 15: Table of Active Members: Members who have issued at least one book in the last 6 months.
create table 
	active_members as
select 
	distinct
		member_id, 
        member_name
from 
	members m
		join issued_status i
			on m.member_id = i.issued_member_id
where issued_date >= (current_date() - interval 6 month);
    
-- querying the table
select * from active_members;

# Task 16: Employees with the Most Book Issues Processed:
/* Find the top 3 employees who have processed the most book issues. 
Display the employee name, number of books processed, and their branch. */

select 
		e.emp_name as employee_name, 
		(count(i.issued_id)) as total_books_processed, 
		e.branch_id as branch
from 
	employees e
		join issued_status i 
			on i.issued_emp_id = e.emp_id
	group by employee_name, branch
	order by total_books_processed desc
limit 3;