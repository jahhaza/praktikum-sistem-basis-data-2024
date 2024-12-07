CREATE DATABASE Perpustakaan;

CREATE TABLE authors (
    id_authors CHAR(5) NOT NULL PRIMARY KEY,
    author_name VARCHAR(50) NOT NULL,
    nationality VARCHAR(30) NOT NULL,
    birthdate DATE NOT NULL
);

CREATE TABLE publishers (
    id_publishers CHAR(5) NOT NULL PRIMARY KEY,
    name_publishers VARCHAR(50) NOT NULL,
    address_publishers VARCHAR(100) NOT NULL,
    country_publishers VARCHAR(30) NOT NULL,
    email_publishers VARCHAR(50) NOT NULL
);

CREATE TABLE genres (
    id_genres CHAR(5) NOT NULL PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL,
    description_genres VARCHAR(255) NOT NULL
);

CREATE TABLE members (
    NIK CHAR(16) NOT NULL PRIMARY KEY,
    name_members VARCHAR(50) NOT NULL,
    email_members VARCHAR(50) NOT NULL,
    gender_members CHAR(1) NOT NULL,
    address_members VARCHAR(100) NOT NULL,
    phone_number_members VARCHAR(15) NOT NULL
);

CREATE TABLE positions (
    id_positions CHAR(5) NOT NULL PRIMARY KEY,
    position_name VARCHAR(50) NOT NULL,
    admin_access BOOLEAN NOT NULL
);

CREATE TABLE employees (
    id_employees CHAR(5) NOT NULL PRIMARY KEY,
    name_employees VARCHAR(50) NOT NULL,
    email_employees VARCHAR(50) NOT NULL,
    gender_employees CHAR(1) NOT NULL,
    phone_number_employees VARCHAR(15) NOT NULL,
    address_employees VARCHAR(100) NOT NULL,
    positions_id CHAR(5) NOT NULL,
    FOREIGN KEY (positions_id) REFERENCES positions(id_positions)
);

CREATE TABLE books (
    id_books CHAR(5) NOT NULL PRIMARY KEY,
    ISBN CHAR(13) NOT NULL,
    title VARCHAR(100) NOT NULL,
    year_published YEAR NOT NULL,
    synopsis VARCHAR(255) NOT NULL,
    stock INT NOT NULL,
    genre_id CHAR(5) NOT NULL,
    author_id CHAR(5) NOT NULL,
    publisher_id CHAR(5) NOT NULL,
    FOREIGN KEY (genre_id) REFERENCES genres(id_genres),
    FOREIGN KEY (author_id) REFERENCES authors(id_authors),
    FOREIGN KEY (publisher_id) REFERENCES publishers(id_publishers)
);

CREATE TABLE borrows (
    id_borrows INT AUTO_INCREMENT PRIMARY KEY,
    borrow_date DATE NOT NULL,
    return_date DATE,
    due_date DATE NOT NULL,
    fine DECIMAL(10, 2),
    member_NIK CHAR(16) NOT NULL,
    employee_id CHAR(5) NOT NULL,
    FOREIGN KEY (member_NIK) REFERENCES members(NIK),
    FOREIGN KEY (employee_id) REFERENCES employees(id_employees)
);

CREATE TABLE books_borrows (
    book_id CHAR(5) NOT NULL,
    borrow_id INT NOT NULL,
    PRIMARY KEY (book_id, borrow_id),
    FOREIGN KEY (book_id) REFERENCES books(id_books),
    FOREIGN KEY (borrow_id) REFERENCES borrows(id_borrows)
);


INSERT INTO authors VALUES 
('AU001', 'Michael Brown', 'Amerika', '1990-03-30'),
('AU002', 'Andi Saputra', 'Indonesia', '1988-10-02'),
('AU003', 'Yuki Nakamura', 'Jepang', '1973-01-22'),
('AU004', 'Kim Min Joon', 'Korea Selatan', '1982-04-18'),
('AU005', 'James Williams', 'Inggris', '1962-12-04');

INSERT INTO publishers VALUES 
('PB001', 'Silver Oak Publishing', '1234 Elm Street', 'Amerika Serikat', 'silveroak1234@gmail.com'),
('PB002', 'Blue Sky Books', '9012 Pine Road', 'Jepang', 'bluesky9012@gmail.com'),
('PB003', 'Green Leaf Press', '5678 Maple Avenue', 'Indonesia', 'greenleaf5678@gmail.com'),
('PB004', 'Golden Dragon Publishing', '3456 Bamboo Lane', 'China', 'goldendragon3456@gmail.com'),
('PB005', 'Red River Press', '7890 Cherry Blossom Drive', 'Perancis', 'redriver7890@gmail.com');

INSERT INTO genres VALUES 
('GR001', 'Sejarah', 'Buku yang mengulas peristiwa atau era tertentu, memberikan wawasan tentang masa lalu.'),
('GR002', 'Fiksi', 'Cerita imajinatif yang dibuat oleh penulis, tidak didasarkan pada fakta nyata.'),
('GR003', 'Pengembangan Diri', 'Buku yang memberikan panduan untuk meningkatkan kualitas hidup atau keterampilan.'),
('GR004', 'Biografi', 'Menceritakan kehidupan seseorang dengan detail dari lahir hingga akhir hidupnya.'),
('GR005', 'Referensi', 'Buku yang berfungsi sebagai sumber rujukan lengkap, seperti kamus atau ensiklopedia.');

INSERT INTO members VALUES 
('3326162409040002', 'Citra Kirana', 'citra@gmail.com', 'P', 'Jl. Cinta No.45', '088374628921'),
('3525017006950028', 'Jasmine Neroli', 'jasmine@gmail.com', 'P', 'Jl. Melati No.9', '083285716164'),
('3525017006520020', 'Nico Parto', 'nico@gmail.com', 'L', 'Jl. Kenanga No.33', '089675329117'),
('3305040901072053', 'Teddy Widodo', 'teddy@gmail.com', 'L', 'Jl. Anggrek No.17', '085782306818'),
('3326161509700004', 'Beni Soeharti', 'beni@gmail.com', 'L', 'Jl. Raya No.56', '0812345678919');

INSERT INTO positions VALUES 
('PS001', 'Pustakawan', TRUE),
('PS002', 'Kebersihan', FALSE),
('PS003', 'Keamanan', FALSE);

INSERT INTO employees VALUES 
('EM001', 'Andi Gading', 'andi@gmail.com', 'P', '081628492610', 'Jl. Merdeka No.10', 'PS001'),
('EM002', 'Budi Sitombing', 'budi@gmail.com', 'L', '085864927581', 'Jl. Sukun Raya No.25', 'PS003'),
('EM003', 'Jennifer Tina', 'tina@gmail.com', 'P', '089603471812', 'Jl. Pahlawan No.5', 'PS001'),
('EM004', 'Lili Sari', 'lili@gmail.com', 'P', '088385793136', 'Jl. Cendana No.8', 'PS002'),
('EM005', 'Alexander Agus', 'agus@gmail.com', 'L', '088273659814', 'Jl. Bunga No.12', 'PS001');

INSERT INTO books VALUES 
('BK001', '9780123456789', 'Jejak Peradaban', 2010, 'Menggali sejarah Indonesia.', 5, 'GR001', 'AU002', 'PB003'),
('BK002', '9781234567890', 'Small Steps', 2005, 'Strategi praktis untuk kebiasaan positif.', 3, 'GR003', 'AU003', 'PB002'),
('BK003', '9782345678901', 'Complete Dictionary', 2020, 'Panduan lengkap untuk istilah teknologi.', 7, 'GR005', 'AU001', 'PB001'),
('BK004', '9783456789012', 'Breaking Barriers', 2018, 'Kisah luar biasa Nelson Mandela.', 2, 'GR004', 'AU005', 'PB001'),
('BK005', '9784567890123', 'Light at the End', 2024, 'Novel tentang harapan dan persahabatan.', 4, 'GR002', 'AU004', 'PB004');

INSERT INTO borrows (borrow_date, return_date, due_date, fine, member_NIK, employee_id) VALUES 
('2024-05-06', '2024-05-20', '2024-05-20', NULL, '3326162409040002', 'EM004'),
('2024-07-14', '2024-07-29', '2024-07-28', 5000.00, '3525017006950028', 'EM001'),
('2024-09-22', '2024-10-08', '2024-10-06', 10000.00, '3525017006520020', 'EM003'),
('2024-10-03', '2024-10-20', '2024-10-17', 15000.00, '3305040901072053', 'EM002'),
('2024-11-02', NULL, '2024-11-16', NULL, '3326161509700004', 'EM005');

INSERT INTO books_borrows VALUES 
('BK001', 1),
('BK003', 2),
('BK001', 2),
('BK004', 3),
('BK005', 4),
('BK002', 5);


ALTER TABLE books_borrows DROP FOREIGN KEY books_borrows_ibfk_2;
ALTER TABLE borrows DROP PRIMARY KEY, MODIFY id_borrows INT AUTO_INCREMENT, ADD PRIMARY KEY (id_borrows);
ALTER TABLE books_borrows ADD FOREIGN KEY (borrow_id) REFERENCES borrows(id_borrows);

UPDATE borrows SET return_date = CURRENT_DATE WHERE member_NIK = '3326161509700004';

UPDATE borrows SET fine = NULL WHERE member_NIK IN ('3525017006520020', '3305040901072053');

INSERT INTO borrows (borrow_date, due_date, fine, member_NIK, employee_id) VALUES 
('2024-11-03', '2024-11-17', NULL, '3326161509700004', 'EM005');

UPDATE books SET stock = stock - 1 WHERE title = 'Complete Dictionary of Information Technology Terms';

INSERT INTO employees (id_employees, name_employees, email_employees, gender_employees, phone_number_employees, address_employees, positions_id) VALUES 
('EM006', 'Aspas Gata', 'aspasgata@gmail.com', 'L', '0895323390308', 'Jl. Badut No.62', 'PS001');

UPDATE employees 
SET name_employees = 'Andi Haki', gender_employees = 'L', phone_number_employees = '081628492611' 
WHERE id_employees = 'EM001';

DELETE FROM books_borrows WHERE borrow_id IN (SELECT id_borrows FROM borrows WHERE member_NIK = '3525017006950028');
DELETE FROM employees WHERE name_employees = 'Aspas Gata';



