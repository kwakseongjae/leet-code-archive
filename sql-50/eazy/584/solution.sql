/*
 * Author: Seong Jae, Kwak
 * Problem: 584. Find Customer Referee
 * Problem Link: https://leetcode.com/problems/find-customer-referee/
 */

SELECT name 
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL;