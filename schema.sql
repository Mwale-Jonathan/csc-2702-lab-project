CREATE TABLE "Book"(
    "id" bigserial NOT NULL,
    "publisher_id" BIGINT NOT NULL,
    "category_id" BIGINT NOT NULL,
    "isbn" VARCHAR(13) NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "publication_date" DATE NOT NULL,
    "location" VARCHAR(255) NOT NULL,
    "cover" VARCHAR(255) NOT NULL,
    "total_copies" BIGINT NOT NULL,
    "available_copies" BIGINT NOT NULL,
    "date_created" TIMESTAMP(0) WITH
        TIME zone NOT NULL,
        "last_edited" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL
);
ALTER TABLE
    "Book" ADD PRIMARY KEY("id");
ALTER TABLE
    "Book" ADD CONSTRAINT "book_isbn_unique" UNIQUE("isbn");
ALTER TABLE
    "Book" ADD CONSTRAINT "book_title_unique" UNIQUE("title");
CREATE TABLE "BookAuthor"(
    "id" bigserial NOT NULL,
    "book_id" BIGINT NOT NULL,
    "author_id" BIGINT NOT NULL
);
ALTER TABLE
    "BookAuthor" ADD PRIMARY KEY("id");
CREATE TABLE "Category"(
    "id" bigserial NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Category" ADD PRIMARY KEY("id");
ALTER TABLE
    "Category" ADD CONSTRAINT "category_name_unique" UNIQUE("name");
CREATE TABLE "User"(
    "id" bigserial NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "middle_name" BIGINT NULL,
    "phone" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "image" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "is_active" BOOLEAN NOT NULL,
    "is_staff" BOOLEAN NOT NULL,
    "is_superuser" BOOLEAN NOT NULL,
    "date_joined" TIMESTAMP(0) WITH
        TIME zone NOT NULL,
        "last_login" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL
);
ALTER TABLE
    "User" ADD PRIMARY KEY("id");
ALTER TABLE
    "User" ADD CONSTRAINT "user_phone_unique" UNIQUE("phone");
ALTER TABLE
    "User" ADD CONSTRAINT "user_email_unique" UNIQUE("email");
CREATE TABLE "Copy"(
    "id" bigserial NOT NULL,
    "book_id" BIGINT NOT NULL,
    "book_number" BIGINT NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "date_acquired" TIMESTAMP(0) WITH
        TIME zone NOT NULL
);
ALTER TABLE
    "Copy" ADD PRIMARY KEY("id");
CREATE TABLE "Payment"(
    "id" bigserial NOT NULL,
    "user_id" BIGINT NOT NULL,
    "fine_id" BIGINT NOT NULL,
    "amount" DECIMAL(8, 2) NOT NULL,
    "date_created" TIMESTAMP(0) WITH
        TIME zone NOT NULL
);
ALTER TABLE
    "Payment" ADD PRIMARY KEY("id");
CREATE TABLE "Author"(
    "id" bigserial NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "middle_number" VARCHAR(255) NULL,
    "last_name" VARCHAR(255) NOT NULL,
    "bio" TEXT NOT NULL
);
ALTER TABLE
    "Author" ADD PRIMARY KEY("id");
CREATE TABLE "Loan"(
    "id" bigserial NOT NULL,
    "user_id" BIGINT NOT NULL,
    "copy_id" BIGINT NOT NULL,
    "checkout_date" DATE NOT NULL,
    "due_date" DATE NOT NULL,
    "checkin_date" BIGINT NOT NULL
);
ALTER TABLE
    "Loan" ADD PRIMARY KEY("id");
CREATE TABLE "Fine"(
    "id" bigserial NOT NULL,
    "loan_id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "amount" DECIMAL(8, 2) NOT NULL,
    "status" VARCHAR(20) NOT NULL,
    "date_created" TIMESTAMP(0) WITH
        TIME zone NOT NULL,
        "last_updated" TIMESTAMP(0)
    WITH
        TIME zone NOT NULL
);
ALTER TABLE
    "Fine" ADD PRIMARY KEY("id");
CREATE TABLE "Publisher"(
    "id" bigserial NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "city" VARCHAR(255) NOT NULL,
    "country" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Publisher" ADD PRIMARY KEY("id");
ALTER TABLE
    "Publisher" ADD CONSTRAINT "publisher_name_unique" UNIQUE("name");
ALTER TABLE
    "BookAuthor" ADD CONSTRAINT "bookauthor_author_id_foreign" FOREIGN KEY("author_id") REFERENCES "Author"("id");
ALTER TABLE
    "Book" ADD CONSTRAINT "book_category_id_foreign" FOREIGN KEY("category_id") REFERENCES "Category"("id");
ALTER TABLE
    "Fine" ADD CONSTRAINT "fine_loan_id_foreign" FOREIGN KEY("loan_id") REFERENCES "Payment"("id");
ALTER TABLE
    "Loan" ADD CONSTRAINT "loan_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "User"("id");
ALTER TABLE
    "Loan" ADD CONSTRAINT "loan_copy_id_foreign" FOREIGN KEY("copy_id") REFERENCES "Copy"("id");
ALTER TABLE
    "Copy" ADD CONSTRAINT "copy_book_id_foreign" FOREIGN KEY("book_id") REFERENCES "Book"("id");
ALTER TABLE
    "Payment" ADD CONSTRAINT "payment_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "User"("id");
ALTER TABLE
    "Fine" ADD CONSTRAINT "fine_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "User"("id");
ALTER TABLE
    "BookAuthor" ADD CONSTRAINT "bookauthor_book_id_foreign" FOREIGN KEY("book_id") REFERENCES "Book"("id");