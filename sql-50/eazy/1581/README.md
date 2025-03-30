# 1581. Customer Who Visited but Did Not Make Any Transactions

**Intuition**  
This problem asks us to find customers who visited the store but didn't make any transactions, along with the count of such visits for each customer. To solve this, we need to identify visits that don't have corresponding entries in the Transactions table, then count these visits for each customer.

**Code**

```sql
SELECT customer_id, COUNT(visit_id) as count_no_trans
FROM Visits v
WHERE NOT EXISTS (
    SELECT visit_id FROM Transactions t
    WHERE t.visit_id = v.visit_id
)
GROUP BY customer_id
```

**Approach**

1. Use the NOT EXISTS operator with a correlated subquery:
   - For each row in the Visits table, check if there are any matching transactions
   - The correlated subquery `SELECT visit_id FROM Transactions t WHERE t.visit_id = v.visit_id` looks for transaction records with the same visit_id
   - NOT EXISTS returns true when no matching transactions are found for a visit
2. Count the qualifying visits for each customer:
   - Group the filtered visits by customer_id
   - Use COUNT(visit_id) to count the number of visits without transactions for each customer

**Complexity**

- Time complexity: O(n × m), where n is the number of rows in the Visits table and m is the number of rows in the Transactions table.
- Space complexity: O(k), where k is the number of customers who visited without making transactions.

**Alternative Approaches**

1. Using LEFT JOIN:

```sql
SELECT customer_id, COUNT(v.visit_id) as count_no_trans
FROM Visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE transaction_id IS NULL
GROUP BY customer_id
```

2. Using NOT IN:

```sql
SELECT customer_id, COUNT(customer_id) AS count_no_trans
FROM Visits as v
WHERE v.visit_id NOT IN (
    SELECT DISTINCT visit_id
    FROM Transactions
)
GROUP BY customer_id
```

Each approach has its strengths, but NOT EXISTS typically offers the best performance for this type of query.
