BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('nicole','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('rob','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('phil','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('tanner','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

COMMIT TRANSACTION;


INSERT INTO issues (issue_name, issue_owner_id, description, date_posted, expiration_date, expiration_time, status, genre_tag)
VALUES ('Park amenities budget', 1, 'The township has a budget surplus for the local park and we are looking to allocate the surplus towards something great to give back to the community! Help us decide which amenities you''d like to see added to the park.', CURRENT_TIMESTAMP(0), '2023-04-18', '08:00', 'completed', 'parks and rec');

INSERT INTO choices (issue_id, choice) VALUES (1, 'Little free library');
INSERT INTO choices (issue_id, choice) VALUES (1, 'new tire swing');
INSERT INTO choices (issue_id, choice) VALUES (1, 'new bench');
INSERT INTO choices (issue_id, choice) VALUES (1, 'more trees');
INSERT INTO choices (issue_id, choice) VALUES (1, 'disc golf');

INSERT INTO issues (issue_name, issue_owner_id, description, date_posted, expiration_date, expiration_time, status, genre_tag)
VALUES ('Wagstaff School Fall Play', 1, 'The students at Wagstaff School are planning ahead for their fall play! Which theatrical performance would you most like to see these talented young minds perform?', CURRENT_TIMESTAMP(0), '2023-07-23', '05:00', 'active', 'school');

INSERT INTO choices (choice, issue_id) VALUES ('Peter Pan', 2);
INSERT INTO choices (choice, issue_id) VALUES ('The Emperor''s New Clothes', 2);
INSERT INTO choices (choice, issue_id) VALUES ('A Wrinkle in Time', 2);
INSERT INTO choices (choice, issue_id) VALUES ('12 Angry Men', 2);
INSERT INTO choices (choice, issue_id) VALUES ('Alice in Wonderland', 2);
INSERT INTO choices (choice, issue_id) VALUES ('A Midsummer Night''s Dream', 2);
INSERT INTO choices (choice, issue_id) VALUES ('Macbeth', 2);

INSERT INTO issues (issue_name, issue_owner_id, description, date_posted, expiration_date, expiration_time, status, genre_tag)
VALUES ('May book club', 1, 'Attention Public Library Women''s Book Club! Let us know what you''d like our next month''s pick to be!', CURRENT_TIMESTAMP(0), '2023-05-23', '01:00', 'active', 'community');

INSERT INTO choices (choice, issue_id) VALUES ('The Beekeeper of Aleppo', 3);
INSERT INTO choices (choice, issue_id) VALUES ('Mad Honey', 3);
INSERT INTO choices (choice, issue_id) VALUES ('An Elephant in the Garden', 3);
INSERT INTO choices (choice, issue_id) VALUES ('Remarkably Bright Creatures', 3);
INSERT INTO choices (choice, issue_id) VALUES ('I''m Glad My Mom Died', 3);
INSERT INTO choices (choice, issue_id) VALUES ('Lessons in Chemistry', 3);

INSERT INTO issues (issue_name, issue_owner_id, description, date_posted, expiration_date, expiration_time, status, genre_tag)
VALUES ('Ice cream social!', 1, 'The old folks home is having an ice cream social! Vote on your favorite flavors and we''ll be sure to keep them in stock', CURRENT_TIMESTAMP(0), '2023-05-15', '04:00', 'active', 'community');

INSERT INTO choices (choice, issue_id) VALUES ('Neapolitan', 4);
INSERT INTO choices (choice, issue_id) VALUES ('Cookie Dough', 4);
INSERT INTO choices (choice, issue_id) VALUES ('Coffee', 4);
INSERT INTO choices (choice, issue_id) VALUES ('Cookies & Cream', 4);
INSERT INTO choices (choice, issue_id) VALUES ('Vanilla', 4);
INSERT INTO choices (choice, issue_id) VALUES ('Chocolate', 4);

INSERT INTO issues (issue_name, issue_owner_id, description, date_posted, expiration_date, expiration_time, status, genre_tag)
VALUES ('County Fair Poll', 1, 'Planning for the 2023 County Fair is underway! We''ll have many fun events for the whole family, but please take a moment to let us know which event you''re most excited about!', CURRENT_TIMESTAMP(0), '2023-07-01', '12:00', 'active', 'events');

INSERT INTO choices (choice, issue_id) VALUES ('Pie eating contest', 5);
INSERT INTO choices (choice, issue_id) VALUES ('Lawn mower race', 5);
INSERT INTO choices (choice, issue_id) VALUES ('Parade', 5);
INSERT INTO choices (choice, issue_id) VALUES ('Tractor pull', 5);
INSERT INTO choices (choice, issue_id) VALUES ('Cornhole tournament', 5);

UPDATE choices SET points = 3 WHERE choice_id = 1;
UPDATE choices SET points = 7 WHERE choice_id = 2;
UPDATE choices SET points = 10 WHERE choice_id = 3;

UPDATE choices SET points = 20 WHERE choice_id = 4;
UPDATE choices SET points = 30 WHERE choice_id = 5;
UPDATE choices SET points = 10 WHERE choice_id = 6;
UPDATE choices SET points = 15 WHERE choice_id = 7;
UPDATE choices SET points = 25 WHERE choice_id = 8;

