create database social_media_database;
use social_media_database;

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Posts (
    PostID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    Content TEXT NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Comments (
    CommentID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    PostID INT,
    Content TEXT NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID)
);


CREATE TABLE Likes (
    LikeID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    PostID INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID)
);


CREATE TABLE Followers (
    FollowerID INT PRIMARY KEY AUTO_INCREMENT,
    FollowerUserID INT,
    FollowingUserID INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (FollowerUserID) REFERENCES Users(UserID),
    FOREIGN KEY (FollowingUserID) REFERENCES Users(UserID)
);


CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    NotificationType ENUM('Like', 'Comment', 'Follower', 'Other') NOT NULL,
    IsRead BOOLEAN DEFAULT FALSE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


CREATE TABLE Tags (
    TagID INT PRIMARY KEY AUTO_INCREMENT,
    TagName VARCHAR(50) NOT NULL
);



CREATE TABLE PostTags (
    PostID INT,
    TagID INT,
    PRIMARY KEY (PostID, TagID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (TagID) REFERENCES Tags(TagID)
);


CREATE TABLE Messages (
    MessageID INT PRIMARY KEY AUTO_INCREMENT,
    SenderUserID INT,
    ReceiverUserID INT,
    Content TEXT NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SenderUserID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverUserID) REFERENCES Users(UserID)
);

CREATE TABLE Reels (
    ReelID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    Caption VARCHAR(255),
    VideoURL VARCHAR(255),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

show tables;

insert into users (UserName,Email,Password)
values
('siddhay','sidd856@gmail.com','123pass'),
('rahul89', 'rahul89@gmail.com', 'password123'),
('priya_12', 'priya_12@gmail.com', 'securepass'),
('vikram_singh', 'vikram_singh@gmail.com', 'pass123'),
('neha_24', 'neha_24@gmail.com', 'neha_pass'),
('amit_mishra', 'amit_mishra@gmail.com', 'amit_pass'),
('pooja_kumar', 'pooja_kumar@gmail.com', 'pooja_pass'),
('raj_22', 'raj_22@gmail.com', 'raj_pass'),
('divya89', 'divya89@gmail.com', 'divya_pass'),
('anil87', 'anil87@gmail.com', 'anil_pass'),
('kriti_15', 'kriti_15@gmail.com', 'kriti_pass'),
('mohan_k', 'mohan_k@gmail.com', 'mohan_pass'),
('swati_g', 'swati_g@gmail.com', 'swati_pass'),
('rahul_gupta', 'rahul_gupta@gmail.com', 'gupta_pass'),
('sanjay12', 'sanjay12@gmail.com', 'sanjay_pass'),
('ananya_33', 'ananya_33@gmail.com', 'ananya_pass'),
('rohit77', 'rohit77@gmail.com', 'rohit_pass'),
('meera_s', 'meera_s@gmail.com', 'meera_pass'),
('vivek_kumar', 'vivek_kumar@gmail.com', 'vivek_pass'),
('priyanka_19', 'priyanka_19@gmail.com', 'priyanka_pass'),
('akash21', 'akash21@gmail.com', 'akash_pass'),
('radhika_j', 'radhika_j@gmail.com', 'radhika_pass');

select* from users;

INSERT INTO Posts (UserID, Content)
VALUES
(1, 'Hello, this is my first post!'),
(2, 'Greetings from a new user!'),
(3, 'Exploring the world of social media.'),
(4, 'Sharing thoughts with the community.'),
(5, 'Excited to be a part of this platform.'),
(6, 'Amit Mishra here, posting for the first time.'),
(7, 'Raj here, sharing my thoughts.'),
(8, 'Divya here, enjoying the social media experience.'),
(9, 'Anil exploring the features.'),
(10, 'Kriti sharing a glimpse of her day.'),
(11, 'Mohan posting updates.'),
(12, 'Swati Gupta here, connecting with friends.'),
(13, 'Rahul Gupta sharing a photo.'),
(14, 'Sanjay sharing an interesting article.'),
(15, 'Ananya expressing thoughts.'),
(16, 'Rohit posting updates.'),
(17, 'Meera sharing a travel experience.'),
(18, 'Vivek Kumar here, connecting with professionals.'),
(19, 'Priyanka sharing her favorite quotes.'),
(20, 'Akash posting updates.'),
(21, 'Radhika expressing thoughts on technology.');

select * from posts;

INSERT INTO Comments (UserID, PostID, Content)
VALUES
(3, 1, 'Welcome! Excited to see your posts.'),
(4, 2, 'Nice to meet you, new user!'),
(2, 3, 'Enjoy your journey on social media.'),
(5, 4, 'Looking forward to your updates.'),
(6, 5, 'Amit, great to have you here!'),
(7, 6, 'Raj, your thoughts are interesting.'),
(8, 7, 'Divya, looking forward to your posts.'),
(9, 8, 'Anil, welcome to the community.'),
(10, 9, 'Kriti, share more about your day!'),
(11, 10, 'Mohan, keep us updated.'),
(12, 11, 'Swati, connecting with friends is wonderful.'),
(13, 12, 'Rahul, nice photo!'),
(14, 13, 'Sanjay, this article is insightful.'),
(15, 14, 'Ananya, share more thoughts.'),
(16, 15, 'Rohit, looking forward to your updates.'),
(17, 16, 'Meera, where did you travel? Share more details.'),
(18, 17, 'Vivek, let"s connect professionally.'),
(19, 18, 'Priyanka, your quotes are inspiring.'),
(20, 19, 'Akash, keep us posted.'),
(21, 20, 'Radhika, thoughts on the latest technology trends?');

select*from comments;


INSERT INTO Likes (UserID, PostID)
VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(11, 12),
(12, 13),
(13, 14),
(14, 15),
(15, 16),
(16, 17),
(17, 18),
(18, 19),
(19, 20),
(20, 21),
(21, 1);

select * from likes;

INSERT INTO Followers (FollowerUserID, FollowingUserID)
VALUES
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(1, 2);

select * from followers;

INSERT INTO Notifications (UserID, NotificationType, IsRead)
VALUES
(1, 'Like', FALSE),
(2, 'Follower', FALSE),
(3, 'Comment', FALSE),
(4, 'Like', FALSE),
(5, 'Follower', FALSE),
(6, 'Comment', FALSE),
(7, 'Like', FALSE),
(8, 'Follower', FALSE),
(9, 'Comment', FALSE),
(10, 'Like', FALSE),
(11, 'Follower', FALSE),
(12, 'Comment', FALSE),
(13, 'Like', FALSE),
(14, 'Follower', FALSE),
(15, 'Comment', FALSE),
(16, 'Like', FALSE),
(17, 'Follower', FALSE),
(18, 'Comment', FALSE),
(19, 'Like', FALSE),
(20, 'Follower', FALSE),
(21, 'Comment', FALSE),
(1, 'Like', FALSE);

select * from notifications;

INSERT INTO Tags (TagName)
VALUES
('travel'),
('food'),
('technology'),
('nature'),
('sports'),
('music'),
('fitness'),
('movies'),
('books'),
('fashion'),
('photography'),
('gaming'),
('art'),
('science'),
('history'),
('education'),
('health'),
('finance'),
('cooking'),
('politics'),
('design'),
('business');

select * from tags;

INSERT INTO PostTags (PostID, TagID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21);

select * from posttags;

INSERT INTO Messages (SenderUserID, ReceiverUserID, Content)
VALUES
(1, 2, 'Hello naruto, how are you?'),
(2, 1, 'Hi siddhay, I am doing well. Thanks!'),
(3, 4, 'obito, let''s plan something together'),
(4, 3, 'Sure! What do you have in mind?'),
(5, 6, 'hanuman, I liked your recent post'),
(6, 5, 'Thanks! I appreciate it'),
(7, 8, 'ram, do you want to join the fitness group?'),
(8, 7, 'Sure, I am interested'),
(9, 10, 'Kriti, let''s catch up for coffee'),
(10, 9, 'Sounds good!'),
(11, 12, 'sid, any plans for the weekend?'),
(12, 11, 'Not yet, let''s make some plans'),
(13, 14, 'Sanjay, did you read the latest article on technology?'),
(14, 13, 'Yes, it was quite interesting'),
(15, 16, 'Rohit, how''s your day going?'),
(16, 15, 'Pretty good, thanks for asking!'),
(17, 18, 'Vivek, let''s discuss the upcoming project'),
(18, 17, 'Sure, I''ll prepare some notes'),
(19, 20, 'Akash, any updates on the project?'),
(20, 19, 'I''ll share the progress in the next meeting'),
(21, 1, 'Radhika, what are your thoughts on the latest design trends?'),
(1, 21, 'I find them quite innovative and inspiring.');
drop table messages; 
delete from messages;
select * from messages;


INSERT INTO Reels (UserID, Caption, VideoURL)
VALUES
    (1, 'Beautiful sunset', 'https://example.com/reel1.mp4'),
    (2, 'Dance moves', 'https://example.com/reel2.mp4'),
    (3, 'Cooking adventure', 'https://example.com/reel3.mp4'),
    (4, 'Gaming highlights', 'https://example.com/reel4.mp4'),
    (5, 'Travel diaries', 'https://example.com/reel5.mp4'),
    (6, 'Fitness motivation', 'https://example.com/reel6.mp4'),
    (7, 'Artistic expressions', 'https://example.com/reel7.mp4'),
    (8, 'Music vibes', 'https://example.com/reel8.mp4'),
    (9, 'Book recommendations', 'https://example.com/reel9.mp4'),
    (10, 'Fashion showcase', 'https://example.com/reel10.mp4'),
    (11, 'Technology insights', 'https://example.com/reel11.mp4'),
    (12, 'Gaming adventures', 'https://example.com/reel12.mp4'),
    (13, 'Science experiments', 'https://example.com/reel13.mp4'),
    (14, 'Historical insights', 'https://example.com/reel14.mp4'),
    (15, 'Educational content', 'https://example.com/reel15.mp4'),
    (16, 'Health and wellness tips', 'https://example.com/reel16.mp4'),
    (17, 'Financial advice', 'https://example.com/reel17.mp4'),
    (18, 'Cooking tutorials', 'https://example.com/reel18.mp4'),
    (19, 'Political discussions', 'https://example.com/reel19.mp4'),
    (20, 'Design inspirations', 'https://example.com/reel20.mp4'),
    (21, 'Business insights', 'https://example.com/reel21.mp4');
    
    select * from reels;