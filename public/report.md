# Introduction
## Current System Limitations

### Resource Management Issues

- Difficulty in tracking real-time availability of books and resources
- Inefficient inventory management leading to missing or misplaced items
- Challenges in managing multiple copies of the same publication
- Limited ability to track different formats (physical books, e-books, journals)


### Administrative Challenges

- Time-consuming manual processing of borrowing and returns
- Complex tracking of overdue items and fine calculations
- Inefficient member registration and management process
- Limited reporting capabilities for decision-making


### User Experience Problems

- Delayed access to library resources
- Difficulty in locating specific materials
- Limited self-service options
- No remote access to library services


# Problem Definition & Requirements

The current manual and semi-automated systems in university libraries face numerous operational challenges that affect both staff efficiency and user experience. Through extensive consultation with librarians, faculty, and students, we have identified key problems and gathered specific requirements to address these challenges.

## System Requirements

- Catalog Management: Store and manage information about all library resources (books, journals, digital media, etc.)
- User Management: Maintain records of library members, including students, faculty, and staff
- Circulation Management: Handle check-out, check-in, and reservation processes
- Search and Retrieval: Provide efficient search capabilities for users to find resources
- Reporting: Generate various reports for library administration
- Inventory Management: Track the number of copies for each book and their individual statuses

### Additional Requirements

- Data Security: Implement robust security measures to protect sensitive user information
- Scalability: Design the system to handle a large number of resources and users
- Integration: Ability to integrate with other university systems (e.g., student information system)
- Backup and Recovery: Regular backup procedures and disaster recovery capabilities
- User Interface: Develop an intuitive interface for both library staff and patrons
- Inventory Tracking: Implement features to easily track and update the status of individual book copies

### Non-Functional Requirements

- Performance: The system should handle multiple concurrent users with minimal latency
- Availability: The system should be available 24/7 with minimal downtime for maintenance
- Usability: The interface should be user-friendly and accessible to users with varying levels of technical expertise
- Compliance: Adhere to relevant data protection regulations and library standards


# Data Modeling & Design

User(id, first_name, middle_name, last_name, username, image, password, is_active, is_staff, is_superuser, last_login, date_joined)

Author(id, first_name, middle_name, last_name, bio)

Publisher(id, name, city, country)

Category(id, name)

Book(id, publisher_id, isbn, title, publication_date, location, total_copies, available_copies, date_created, last_updated)

BookAuther(id, book_id, author_id)

Copy(id, book_id, book_number, status, acquisition_date, condition)

Loan(id, user_id, copy_id, checkout_date, due_date, checkin_date)

Fine(id, user_id, loan_id, amount, status, date_created, last_updated)

Payment(id, user_id, fine_id, amount date_created)



# SQL Implementation


# User Interface Development


# Testing
