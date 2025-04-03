/* 
 * Author: Seong Jae, Kwak
 * Problem: 620. Not Boring Movies
 * Problem Link: https://leetcode.com/problems/not-boring-movies/
 */

-- Solution using MOD function and inequality operator
SELECT * 
FROM Cinema
WHERE MOD(id, 2) = 1 AND description <> "boring"
ORDER BY rating DESC;
