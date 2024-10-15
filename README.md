
# **Library Management System**

![Logo](https://i.imgur.com/c95A4h1.jpeg)

# Overview

This project showcases the development of a **Library Management System** using **SQL**. It involves creating and managing tables, performing **CRUD** operations, and executing complex SQL queries. The objective is to highlight proficiency in database design, manipulation, and querying.
## Project Description:

The **Library Management System project** is designed to manage and automate core operations in a library, such as tracking book records, member information, and employee performance. This system facilitates tasks like adding new books, updating member details, issuing and returning books, and generating insightful reports on overdue books, branch performance, and rental income.

The project showcases advanced SQL techniques, including data aggregation, conditional logic, and complex joins, to solve real-world problems efficiently. It is a scalable solution, adaptable for libraries, bookstores, or any business dealing with item inventory and rentals.
## Key Features

1. Create, Update, and Delete Records:
- Add new books to the library.
- Update member details like address.
- Delete records of issued books or statuses.

2. Comprehensive Reporting:
- Retrieve the list of books issued by employees.
- Identify members who have issued multiple books.
- Generate summary tables of book counts and category-wise distribution.

3. Financial Tracking:
- Track total rental income by category.
- Generate branch performance reports, detailing books issued, returned, and revenue earned.

4. Member and Employee Management:
- List members who have been registered for more than six months.
- Identify employees with the most book issues processed.
- Create tables of active members and books with various price segments.

5. Return and Overdue Management:
- Retrieve a list of books that have not been returned.
- Identify members with overdue books based on a 30-day return policy.
## Screenshots

- ERD (Entity Relationship Diagram)
![Image1](https://i.imgur.com/mPXU1H0.jpeg)

- Category wise Books count.
![Image2](https://i.imgur.com/AsjiZiT.jpeg)

- Total Rental Income by Category
![Image3](https://i.imgur.com/OKtYls5.jpeg)

- Employees, Branch Manager and Branch details.
![image4](https://i.imgur.com/JdkRvIR.jpeg)

- Table of Books with different Rental Price category
![Image5](https://i.imgur.com/9j4D0F0.jpeg)


## Conclusion

This project provides a robust system for automating the management of a library. It simplifies the tracking of books, members, and transactions while ensuring comprehensive reporting and financial tracking.
## Tech Stack Used

- **MySQL:** 
MySQL was used as the relational database management system (RDBMS) for the Library Management System. It handles the storage, management, and retrieval of all data related to books, members, issued statuses, and branch performance.

Specific functionalities of MySQL utilized in this project include:

- **CRUD Operations:** Creating, reading, updating, and deleting records in the books, members, and issued_status tables.
- **JOIN Operations:** Combining data from multiple tables to retrieve meaningful relationships, such as matching issued books with corresponding members and employees.
- **Grouping and Aggregation:** Leveraging GROUP BY, HAVING, and aggregate functions (COUNT, SUM, etc.) to produce summarized reports on book categories, branch performance, and financial metrics.
- **Conditional Queries:** Using CASE expressions to categorize books based on rental prices and create more dynamic query results.
- **CTAS (Create Table As Select):** For generating summary tables dynamically, such as the branch performance table and active members list.
## Author

- **Mainak Mukherjee**

- **Email:** subha.mainak@gmail.com

- **Linkedin:** www.linkedin.com/in/mainakmukherjee08


## How to Use
- Clone this repository.
- Import the SQL files into your MySQL database.
- Run the queries to manage books, members, employees, and transactions.
- Generate reports as needed.


## Project Impact and Learning Experience

**Project Impact:**
- *Business Relevance:* Working on this project allowed me to simulate real-world scenarios that are common in libraries, bookstores, and inventory systems. By implementing essential features like book tracking, overdue monitoring, and financial reporting, I’ve built a system that addresses key operational challenges. The system could easily be adapted for similar environments where tracking items, customers, and transactions is crucial.

- *Data-Driven Insights:* These insights enable better decision-making for stakeholders, helping them optimize operations and improve service quality. For instance, identifying top-performing branches or tracking overdue books can lead to more efficient resource allocation and improved customer experience.

- *Scalability Potential:* I focused on making the system scalable. As the number of members, books, or branches increases, the queries and reports can handle larger datasets with minimal changes. This makes the project adaptable for organizations with growing data needs, such as public libraries or larger institutions.

**Learning Experience:**
- *Mastering SQL:* This project helped me dive deeper into advanced SQL concepts like joins, subqueries, aggregate functions, and conditional logic (CASE). Creating reports such as branch performance and overdue book tracking allowed me to go beyond basic CRUD operations, showcasing how SQL can be used to generate business insights.

- *Data Modeling:* By working with relationships between members, books, employees, and branches, I gained a better understanding of how to structure relational databases for efficient querying. This project enhanced my knowledge of how to effectively join tables while maintaining query performance.

- *Problem-Solving:* Each task required me to think critically and solve problems logically. For example, tracking overdue books or categorizing members based on recent activity required me to break down complex requirements into SQL solutions.

- *SQL Best Practices:* This project reinforced the importance of writing efficient and optimized SQL queries. I practiced techniques like efficient joins and grouping operations to ensure the system could handle data growth. This focus on best practices has improved my ability to design scalable solutions.

Overall, this project significantly improved my SQL skills and deepened my understanding of how database systems are used in real business environments.