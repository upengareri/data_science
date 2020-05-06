## Best Time to Buy and Sell Stock II

Say you have an array prices for which the ith element is the price of a given stock on day i.

Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).

Note: You may not engage in multiple transactions at the same time (i.e., you must sell the stock before you buy again).

__Example 1:__
```
Input: [7,1,5,3,6,4]
Output: 7
Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
             Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
```
__Example 2:__
```
Input: [1,2,3,4,5]
Output: 4
Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
             Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
             engaging multiple transactions at the same time. You must sell before buying again.
```
__Example 3:__
```
Input: [7,6,4,3,1]
Output: 0
Explanation: In this case, no transaction is done, i.e. max profit = 0.
```

Constraints:

`1 <= prices.length <= 3 * 10 ^ 4`

`0 <= prices[i] <= 10 ^ 4`

---

## SOLUTION
```python
class Solution:
    # Max Differece between Two Elements
    # using local minima and local maxima
    
    def maxProfit(self, prices: List[int]) -> int:
        
        # Solution 1:
        
        # profit = 0
        # for i in range(1, len(prices)):
        #     profit += max(prices[i] - prices[i-1], 0)
        # return profit
        
        # Solution 2:
        days = len(prices)
        day = 0
        profit = 0
        while(day < days):
            # local minima
            while(day < days - 1 and prices[day+1] <= prices[day]):
                day += 1
            if day == days - 1: break
            buy = day
            day += 1
            # local maxima
            while(day < days and prices[day] >= prices[day-1]):
                day += 1
            sell = day - 1
            print("Buy on day {} and sell on day {}".format(buy+1, sell+1))
            profit += (prices[sell] - prices[buy])
        return profit
```
