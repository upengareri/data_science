Some caveats of numpy that pandas can overcome -
* Lack of support for `column names` forces us to frame questions as multi-dimensional array operations (Axis values in dataframes can have string labels, not just numeric ones, which makes selecting data much easier.)
* Only `one data type` support per ndarray makes it more difficult to work with data that contains both numeric and string data type

> Pandas is an extension of NumPy
---
#### How to select data in Pandas from Axis Labels
(Single data, List of data, Slice of data) from (dataframe columns, datafram rows, series) = 3 X 3 = 9 combinations

Select by Label	                | Explicit Syntax             | Shorthand Convention
------------------------------- | --------------------------- | --------------------
Single column from dataframe    | `df.loc[:,"col1"]`          | `df["col1"]`
List of columns from dataframe	| `df.loc[:,["col1","col7"]]` | `df[["col1","col7"]]`
Slice of columns from dataframe	| `df.loc[:,"col1":"col4"]`   | 
Single row from dataframe	    | `df.loc["row4"]`            | 
List of rows from dataframe	    | `df.loc[["row1", "row8"]]`  | 
Slice of rows from dataframe    | `df.loc["row3":"row5"]`     | `df["row3":"row5"]`
Single item from series	        | `s.loc["item8"]`            | `s["item8"]`
List of items from series       | `s.loc[["item1","item7"]]`  | `s[["item1","item7"]]`
Slice of items from series      | `s.loc["item2":"item4"]`    | `s["item2":"item4"]` 

---

#### TERMINOLOGIES
`max()`, `min()`, `sum()`, `mean()`, `median()`, `mode()`

__Example 1 of framing questions from dataset__
Let's say we have
```python
rank_change =  f500["previous_rank"] - f500["rank"]
rank_change_max = rank_change.max()
rank_change_min = rank_change.min()
```
Here the max and min can give us the answer for __biggest increase and decrease in rank__.

---
```
df.iloc[row_index,column_index]
```
---

