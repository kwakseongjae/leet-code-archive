# 1683. Invalid Tweets

**Intuition**  
This problem asks us to find tweets that have more than 15 characters in their content. We need to check the length of each tweet's content and filter out those that exceed 15 characters. In SQL, the LENGTH() function is perfect for determining the number of characters in a string.

**Code**  
```sql
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
```

**Approach**  
1. Use the LENGTH() function:
   * Apply `LENGTH(content)` to calculate the number of characters in each tweet's content
2. Apply the WHERE condition:
   * Filter rows where the length of content exceeds 15 characters
3. Select only the tweet_id column:
   * Since the problem requires us to return only the `tweet_id`, we select it explicitly

**Complexity**  
* Time complexity: O(n), where n is the number of rows in the Tweets table.
* Space complexity: O(m), where m is the number of tweets with content exceeding 15 characters.