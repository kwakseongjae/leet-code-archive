/*
 * Author: Seong Jae, Kwak
 * Problem: 1683. Invalid Tweets
 * Problem Link: https://leetcode.com/problems/invalid-tweets/
 */

SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;