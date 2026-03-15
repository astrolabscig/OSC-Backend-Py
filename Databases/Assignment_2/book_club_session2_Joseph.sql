-- 1a
SELECT * FROM members;
/*
Result:          
+----+--------------+------------------+---------------------+-----------+
| id | username     | full_name        | join_date           | is_active |
+----+--------------+------------------+---------------------+-----------+
| 1  | Astro        | Astro Lab        | 2022-01-05 09:15:00 | True      |
| 2  | Bondly       | James Bond       | 2023-11-12 14:30:00 | True      |
| 3  | Millman      | Chase Miller     | 2023-01-05 08:45:00 | True      |
| 4  | Jessy        | Jessy Walker     | 2024-04-08 16:10:00 | False     |
| 5  | Vicky        | Veronica Mensah  | 2024-04-05 11:20:00 | True      |
| 6  | Code_crafter | John Mensah      | 2025-06-22 19:05:00 | False     |
| 7  | Ice reader   | Prince Agyemang  | 2026-01-05 07:50:00 | True      |
+----+--------------+------------------+---------------------+-----------+
*/

-- 1b
SELECT * FROM books_read;
/*
Result:    
+----+-----------+-----------------------------+--------------------+--------+---------------------+
| id | member_id | title                       | author             | rating | read_date           |
+----+-----------+-----------------------------+--------------------+--------+---------------------+
| 1  | 3         | Atomic Habits               | James Clear        | 4      | 2023-11-05 10:20:00 |
| 2  | 2         | Clean Code                  | Robert C. Martin   | 3      | 2024-03-15 14:05:00 |
| 3  | 1         | The Pragmatic Programmer    | Andrew Hunt        | 4      | 2023-07-10 09:30:00 |
| 4  | 4         | Dracula                     | Bram Stoker        | 2      | 2024-08-02 18:15:00 |
| 5  | 6         | Introduction to Algorithms  | Thomas H. Cormen   | 3      | 2025-07-05 11:45:00 |
| 6  | 4         | Black Beauty                | Anna Sewell        | 4      | 2024-11-25 16:10:00 |
| 7  | 7         | The Stranger                | Albert Camus       | 3      | 2026-01-10 08:50:00 |
| 8  | 5         | Mockingjay                  | Suzanne Collins    | 4      | 2025-09-15 13:25:00 |
| 9  | 4         | The Secret Agent            | Joseph Conrad      | 3      | 2025-01-08 17:40:00 |
| 10 | 7         | The Client                  | John Grisham       | 2      | 2026-01-20 07:55:00 |
+----+-----------+-----------------------------+--------------------+--------+---------------------+
*/

-- 1c
SELECT * FROM books_read 
WHERE books_read.rating >= 4;
/*
Result:        
+----+-----------+-----------------------------+--------------------+--------+---------------------+
| id | member_id | title                       | author             | rating | read_date           |
+----+-----------+-----------------------------+--------------------+--------+---------------------+
| 1  | 3         | Atomic Habits               | James Clear        | 4      | 2023-11-05 10:20:00 |
| 3  | 1         | The Pragmatic Programmer    | Andrew Hunt        | 4      | 2023-07-10 09:30:00 |
| 6  | 4         | Black Beauty                | Anna Sewell        | 4      | 2024-11-25 16:10:00 |
| 8  | 5         | Mockingjay                  | Suzanne Collins    | 4      | 2025-09-15 13:25:00 |
+----+-----------+-----------------------------+--------------------+--------+---------------------+
*/

-- 1d
SELECT username, full_name, join_date 
FROM members 
WHERE join_date < '2024-01-01';
/*
Result:    
+----------+---------------+---------------------+
| username | full_name     | join_date           |
+----------+---------------+---------------------+
| Astro    | Astro Lab     | 2022-01-05 09:15:00 |
| Millman  | Chase Miller  | 2023-01-05 08:45:00 |
| Bondly   | James Bond    | 2023-11-12 14:30:00 |
+----------+---------------+---------------------+
*/

-- 2a
SELECT title, author, rating, member_id, read_date 
FROM books_read
ORDER BY books_read.rating DESC, books_read.read_date DESC
LIMIT 5;
/*
Result:      
+-----------------------------+--------------------+--------+-----------+---------------------+
| title                       | author             | rating | member_id | read_date           |
+-----------------------------+--------------------+--------+-----------+---------------------+
| Introduction to Algorithms  | Thomas H. Cormen   | 5      | 6         | 2025-07-05 11:45:00 |
| Black Beauty                | Anna Sewell        | 5      | 4         | 2024-11-25 16:10:00 |
| Mockingjay                  | Suzanne Collins    | 4      | 5         | 2025-09-15 13:25:00 |
| The Secret Agent            | Joseph Conrad      | 4      | 4         | 2025-01-08 17:40:00 |
| Atomic Habits               | James Clear        | 4      | 3         | 2023-11-05 10:20:00 |
+-----------------------------+--------------------+--------+-----------+---------------------+
*/

-- 2b
SELECT username, full_name, join_date
FROM members
WHERE members.is_active = true
ORDER BY join_date DESC
LIMIT 3;
/*
Result:  
+------------+------------------+---------------------+
| username   | full_name        | join_date           |
+------------+------------------+---------------------+
| Ice reader | Prince Agyemang  | 2026-01-05 07:50:00 |
| Vicky      | Veronica Mensah  | 2024-04-05 11:20:00 |
| Millman    | Chase Miller     | 2023-01-05 08:45:00 |
+------------+------------------+---------------------+
*/

-- 3
SELECT title, author, rating, read_date
FROM books_read
WHERE books_read.member_id IN
(
    SELECT id from members 
    WHERE members.username IN ('Bondly', 'Vicky')
);
/*
Result:       
+-------------+--------------------+--------+---------------------+
| title       | author             | rating | read_date           |
+-------------+--------------------+--------+---------------------+
| Clean Code  | Robert C. Martin   | 3      | 2024-03-15 14:05:00 |
| Mockingjay  | Suzanne Collins    | 4      | 2025-09-15 13:25:00 |
+-------------+--------------------+--------+---------------------+
*/

-- 4a
UPDATE books_read
SET rating = 5
WHERE id = 5
RETURNING *;
/*
Result:       
+----+-----------+-----------------------------+--------------------+--------+---------------------+
| id | member_id | title                       | author             | rating | read_date           |
+----+-----------+-----------------------------+--------------------+--------+---------------------+
| 5  | 6         | Introduction to Algorithms  | Thomas H. Cormen   | 5      | 2025-07-05 11:45:00 |
+----+-----------+-----------------------------+--------------------+--------+---------------------+
*/

-- 4b
UPDATE members
SET is_active = False
WHERE members.username = 'Bondly'
RETURNING *;
/*
Result:       
+----+---------+------------+---------------------+-----------+
| id | username| full_name  | join_date           | is_active |
+----+---------+------------+---------------------+-----------+
| 2  | Bondly | James Bond | 2023-11-12 14:30:00 | False     |
+----+---------+------------+---------------------+-----------+
*/

-- 4c
UPDATE books_read
SET rating = rating + 1
WHERE books_read.member_id = (
    SELECT id
    FROM members 
    WHERE members.username = 'Jessy'
)
AND rating < 5
RETURNING *;
/*
Result:    
+----+-----------+------------------+----------------+--------+---------------------+
| id | member_id | title            | author         | rating | read_date           |
+----+-----------+------------------+----------------+--------+---------------------+
| 4  | 4         | Dracula           | Bram Stoker    | 3      | 2024-08-02 18:15:00 |
| 6  | 4         | Black Beauty      | Anna Sewell    | 5      | 2024-11-25 16:10:00 |
| 9  | 4         | The Secret Agent  | Joseph Conrad  | 4      | 2025-01-08 17:40:00 |
+----+-----------+------------------+----------------+--------+---------------------+
*/

-- 5a
SELECT *
FROM books_read
ORDER BY rating ASC 
LIMIT 1;
/*
Result: 
+----+-------------+--------------------------+------------------+-----------+---------------------+
| id |	member_id  | title                    |	author           | rating    |	read_date          |
+----+-------------+--------------------------+------------------+-----------+---------------------+
| 10 | 7         | The Client                  | John Grisham      | 2      | 2026-01-20 07:55:00 |
+----+-------------+-------------------------+------------------+-----------+---------------------+
*/
DELETE FROM books_read
WHERE id = 10;



-- 5b
SELECT * FROM books_read;
/*
Result: 
+----+-----------+-----------------------------+--------------------+--------+---------------------+
| id | member_id | title                       | author             | rating | read_date           |
+----+-----------+-----------------------------+--------------------+--------+---------------------+
| 1  | 3         | Atomic Habits               | James Clear        | 4      | 2023-11-05 10:20:00 |
| 2  | 2         | Clean Code                  | Robert C. Martin   | 3      | 2024-03-15 14:05:00 |
| 3  | 1         | The Pragmatic Programmer    | Andrew Hunt        | 4      | 2023-07-10 09:30:00 |
| 4  | 4         | Dracula                     | Bram Stoker        | 3      | 2024-08-02 18:15:00 |
| 5  | 6         | Introduction to Algorithms  | Thomas H. Cormen   | 5      | 2025-07-05 11:45:00 |
| 6  | 4         | Black Beauty                | Anna Sewell        | 5      | 2024-11-25 16:10:00 |
| 7  | 7         | The Stranger                | Albert Camus       | 3      | 2026-01-10 08:50:00 |
| 8  | 5         | Mockingjay                  | Suzanne Collins    | 4      | 2025-09-15 13:25:00 |
| 9  | 4         | The Secret Agent            | Joseph Conrad      | 4      | 2025-01-08 17:40:00 |
+----+-----------+-----------------------------+--------------------+--------+---------------------+
*/