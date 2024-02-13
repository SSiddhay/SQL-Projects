create database society;
use society;
CREATE TABLE Apartments (
    apartment_id INT PRIMARY KEY AUTO_INCREMENT,
    building_name VARCHAR(50) NOT NULL,
    unit_number VARCHAR(10) NOT NULL,
    floor_number INT NOT NULL,
    total_rooms INT NOT NULL
);

INSERT INTO Apartments (building_name, unit_number, floor_number, total_rooms)
VALUES
('Saraswati Heights', '101', 1, 2),
('Ganesh Enclave', '102', 1, 3),
('Krishna Towers', '201', 2, 2),
('Radha Residency', '202', 2, 3),
('Golden Gardens', 'G1', 1, 4),
('Divine Homes', 'G2', 1, 3),
('Skyline Nirvana', 'S101', 10, 2),
('Celestial Towers', 'S102', 10, 3),
('Maple Meadows', 'M1', 5, 2),
('Eternal Greens', 'M2', 5, 3),
('Lakeside Bliss', 'L101', 7, 2),
('Vista Lakeview', 'L102', 7, 3),
('Royal Orchards', 'R1', 3, 4),
('Regal Gardens', 'R2', 3, 3),
('Sunrise Serenity', 'SUN1', 6, 2),
('Palm Haven', 'SUN2', 6, 3),
('Lotus Luxuria', 'P101', 4, 2),
('Palm Grove', 'P102', 4, 3),
('Bharat Heritage', 'L101', 8, 2),
('Lotus Residency', 'L102', 8, 3);
select * from Apartments;

CREATE TABLE Residents (
    resident_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    apartment_id INT,
    FOREIGN KEY (apartment_id) REFERENCES Apartments(apartment_id)
);
INSERT INTO Residents (first_name, last_name, email, phone_number, apartment_id)
VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', 1),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', 2),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-123-4567', 3),
('Bob', 'Williams', 'bob.williams@example.com', '222-333-4444', 4),
('Eva', 'Davis', 'eva.davis@example.com', '888-999-0000', 5),
('David', 'Miller', 'david.miller@example.com', '777-666-5555', 6),
('Grace', 'Taylor', 'grace.taylor@example.com', '444-555-6666', 7),
('Tom', 'Anderson', 'tom.anderson@example.com', '111-222-3333', 8),
('Sophia', 'Brown', 'sophia.brown@example.com', '999-888-7777', 9),
('Michael', 'Jones', 'michael.jones@example.com', '777-888-9999', 10),
('Olivia', 'Wilson', 'olivia.wilson@example.com', '555-444-3333', 11),
('Liam', 'Moore', 'liam.moore@example.com', '222-111-0000', 12),
('Emma', 'Hall', 'emma.hall@example.com', '666-777-8888', 13),
('Ryan', 'Martinez', 'ryan.martinez@example.com', '333-444-5555', 14),
('Ava', 'White', 'ava.white@example.com', '777-666-5555', 15),
('Noah', 'Garcia', 'noah.garcia@example.com', '555-666-7777', 16),
('Isabella', 'Scott', 'isabella.scott@example.com', '888-999-1111', 17),
('Mia', 'Adams', 'mia.adams@example.com', '444-555-6666', 18),
('James', 'Clark', 'james.clark@example.com', '222-333-4444', 19),
('Sophie', 'Turner', 'sophie.turner@example.com', '111-222-3333', 20);
select * from Residents;


CREATE TABLE Maintenance (
    maintenance_id INT PRIMARY KEY AUTO_INCREMENT,
    apartment_id INT,
    description TEXT,
    cost DECIMAL(10, 2),
    date_requested DATE,
    status ENUM('Pending', 'Completed', 'Cancelled'),
    FOREIGN KEY (apartment_id) REFERENCES Apartments(apartment_id)
);

INSERT INTO Maintenance (apartment_id, description, cost, date_requested, status)
VALUES
(1, 'Leaky faucet repair', 50.00, '2024-01-08', 'Pending'),
(2, 'Window pane replacement', 75.00, '2024-01-10', 'Completed'),
(3, 'Plumbing checkup', 60.00, '2024-01-12', 'Pending'),
(4, 'Electrical wiring inspection', 80.00, '2024-01-15', 'Completed'),
(5, 'Garden maintenance', 40.00, '2024-01-18', 'Pending'),
(6, 'Roof inspection', 90.00, '2024-01-20', 'Pending'),
(7, 'Elevator servicing', 70.00, '2024-01-22', 'Pending'),
(8, 'Pest control', 55.00, '2024-01-25', 'Pending'),
(9, 'HVAC system repair', 65.00, '2024-01-28', 'Pending'),
(10, 'Appliance maintenance', 85.00, '2024-02-01', 'Pending'),
(11, 'Security system check', 75.00, '2024-02-05', 'Pending'),
(12, 'Painting touch-ups', 40.00, '2024-02-08', 'Pending'),
(13, 'Fire safety inspection', 95.00, '2024-02-12', 'Pending'),
(14, 'Common area cleaning', 50.00, '2024-02-15', 'Pending'),
(15, 'Parking lot repair', 80.00, '2024-02-18', 'Pending'),
(16, 'Landscaping enhancements', 60.00, '2024-02-22', 'Pending'),
(17, 'Wi-Fi system upgrade', 70.00, '2024-02-25', 'Pending'),
(18, 'Trash disposal maintenance', 45.00, '2024-02-28', 'Pending'),
(19, 'Fitness center equipment check', 55.00, '2024-03-03', 'Pending'),
(20, 'Emergency lighting inspection', 65.00, '2024-03-07', 'Pending');
select* from maintenance;

CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(100) NOT NULL,
    event_date DATE,
    description TEXT
);
-- Insert 20 rows into Events Table with Indian-inspired names
INSERT INTO Events (event_name, event_date, description)
VALUES
('Diwali Celebrations', '2024-10-25', 'Join us for a vibrant Diwali celebration with lights and cultural performances.'),
('Holi Festival Extravaganza', '2024-03-17', 'Celebrate the festival of colors with music, dance, and traditional Indian cuisine.'),
('Ganesh Chaturthi Puja', '2024-09-02', 'Participate in the auspicious Ganesh Chaturthi puja followed by a community feast.'),
('Navratri Garba Night', '2024-10-10', 'Get ready for a night filled with energetic Garba dance during the festive Navratri season.'),
('Republic Day Cultural Program', '2024-01-26', 'Enjoy patriotic performances and cultural showcases on the occasion of Republic Day.'),
('Eid-ul-Fitr Feast', '2024-05-12', 'Join us for a grand feast to celebrate the joyous occasion of Eid-ul-Fitr.'),
('Durga Puja Cultural Fair', '2024-10-15', 'Experience the grandeur of Durga Puja with cultural performances, food stalls, and more.'),
('Janmashtami Matki Phod', '2024-08-12', 'Participate in the traditional Matki Phod celebration in honor of Lord Krishna on Janmashtami.'),
('Independence Day Flag Hoisting', '2024-08-15', 'Attend the flag hoisting ceremony and cultural events on Independence Day.'),
('Pongal Harvest Festival', '2024-01-14', 'Celebrate the South Indian harvest festival with traditional Pongal dishes and cultural programs.'),
('Karva Chauth Sargi Breakfast', '2024-11-04', 'Join us for a special Sargi breakfast before the auspicious Karva Chauth fast.'),
('Easter Egg Hunt', '2024-04-05', 'Bring your kids for a fun-filled Easter egg hunt and activities.'),
('Makar Sankranti Kite Flying', '2024-01-15', 'Join us on the terrace for an exciting kite-flying competition on Makar Sankranti.'),
('Baisakhi Bhangra Night', '2024-04-13', 'Celebrate Baisakhi with lively Bhangra dance, music, and delicious Punjabi cuisine.'),
('Eid-ul-Adha Qurbani Feast', '2024-07-20', 'Partake in the joyous feast in celebration of Eid-ul-Adha after the Qurbani ritual.'),
('Gudi Padwa Gudhi Hoisting', '2024-03-25', 'Witness the Gudhi hoisting ceremony on Gudi Padwa, marking the Maharashtrian New Year.'),
('Onam Sadhya Lunch', '2024-09-06', 'Enjoy a traditional Onam Sadhya lunch with a variety of delicious Kerala dishes.'),
('Dussehra Ravan Dahan', '2024-10-05', 'Be part of the Dussehra celebration with the symbolic burning of the Ravan effigy.'),
('Bihu Dance Festival', '2024-04-14', 'Experience the vibrant Bihu dance and cultural festivities during the Assamese New Year.'),
('Guru Purnima Satsang', '2024-07-23', 'Participate in a spiritual Satsang to honor and express gratitude on Guru Purnima.');

select* from Events;

CREATE TABLE Complaints (
    complaint_id INT PRIMARY KEY AUTO_INCREMENT,
    resident_id INT,
    description TEXT,
    date_filed DATE,
    status ENUM('Open', 'Closed'),
    FOREIGN KEY (resident_id) REFERENCES Residents(resident_id)
);

INSERT INTO Complaints (resident_id, description, date_filed, status)
VALUES
(1, 'Noise disturbance during meditation hours', '2024-01-08', 'Open'),
(2, 'Parking space dispute with neighbor', '2024-01-10', 'Closed'),
(3, 'Water leakage from ceiling in the bathroom', '2024-01-12', 'Open'),
(4, 'Power outage in the entire building', '2024-01-15', 'Open'),
(5, 'Gardening equipment missing from storage', '2024-01-18', 'Open'),
(6, 'Roof leak in common area', '2024-01-20', 'Open'),
(7, 'Elevator not working properly', '2024-01-22', 'Open'),
(8, 'Pest infestation in the apartment', '2024-01-25', 'Open'),
(9, 'Air conditioning unit malfunction', '2024-01-28', 'Open'),
(10, 'Appliance repair request', '2024-02-01', 'Open'),
(11, 'Security system glitch', '2024-02-05', 'Open'),
(12, 'Paint peeling off in hallway', '2024-02-08', 'Open'),
(13, 'Fire safety equipment maintenance needed', '2024-02-12', 'Open'),
(14, 'Common area cleanliness complaint', '2024-02-15', 'Open'),
(15, 'Parking lot pothole repair request', '2024-02-18', 'Open'),
(16, 'Landscaping improvements suggestion', '2024-02-22', 'Open'),
(17, 'Wi-Fi connectivity issues in common areas', '2024-02-25', 'Open'),
(18, 'Trash disposal system upgrade request', '2024-02-28', 'Open'),
(19, 'Fitness center equipment malfunction', '2024-03-03', 'Open'),
(20, 'Emergency lighting system check needed', '2024-03-07', 'Open');

select * from complaints;

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    resident_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (resident_id) REFERENCES Residents(resident_id)
);

INSERT INTO Payments (resident_id, amount, payment_date)
VALUES
(1, 1000.00, '2024-01-05'),
(2, 1500.00, '2024-01-10'),
(3, 1200.00, '2024-01-15'),
(4, 1800.00, '2024-01-20'),
(5, 900.00, '2024-01-25'),
(6, 2000.00, '2024-01-30'),
(7, 1300.00, '2024-02-05'),
(8, 1600.00, '2024-02-10'),
(9, 1100.00, '2024-02-15'),
(10, 1900.00, '2024-02-20'),
(11, 1700.00, '2024-02-25'),
(12, 800.00, '2024-03-01'),
(13, 2200.00, '2024-03-06'),
(14, 1000.00, '2024-03-11'),
(15, 1500.00, '2024-03-16'),
(16, 1800.00, '2024-03-21'),
(17, 1200.00, '2024-03-26'),
(18, 1900.00, '2024-03-31'),
(19, 1100.00, '2024-04-05'),
(20, 2000.00, '2024-04-10');
select * from payments;

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL
);

INSERT INTO Staff (first_name, last_name, position)
VALUES
('Amit', 'Kumar', 'Maintenance Supervisor'),
('Deepika', 'Sharma', 'Security Guard'),
('Rajat', 'Patil', 'Event Coordinator'),
('Kavita', 'Singh', 'Housekeeping Manager'),
('Rahul', 'Gupta', 'Facilities Manager'),
('Neha', 'Verma', 'Customer Service Representative'),
('Ravi', 'Shinde', 'Accountant'),
('Aarti', 'Mehta', 'IT Administrator'),
('Vikas', 'Joshi', 'Groundskeeper'),
('Priya', 'Malik', 'Maintenance Technician'),
('Manoj', 'Nair', 'Security Supervisor'),
('Divya', 'Shah', 'Front Desk Officer'),
('Ankit', 'Gandhi', 'Event Planner'),
('Sarika', 'Pandey', 'Housekeeping Staff'),
('Rajesh', 'Yadav', 'Maintenance Electrician'),
('Meera', 'Rao', 'Administrative Assistant'),
('Kunal', 'Deshmukh', 'Security Officer'),
('Pooja', 'Iyer', 'Facilities Coordinator'),
('Varun', 'Chopra', 'IT Support Specialist'),
('Suman', 'Mishra', 'Housekeeping Supervisor');
select * from Staff;