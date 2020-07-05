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
#### Data Cleaning Workflow

* The first step is to load the data into dataframe.
* Next we use `df.info()` and `df.head()` to look at the data and analyse it.
> Tip:: We can use markdown to explain our observation about the data.
For example, data contains x rows and y columns. Most columns are of string object type. Column names have xyz pattern. Some columns contain null values although they have only 5% null values etc.
* Clean the column name
    - strip()
    - replace special characters e.g replace("(", "")
    - big words to small abbreviations e.g replace("Operating System", "os")
    - replace space with _
    - lower()
(one might also consider renaming of the columns to make it more expressive or easy to understand. For example `registration_year` instead of `year_of_registration`)

* To closely look at column use - `df.info()`,`df.describe(include="all")`(for including categorical columns as well), `df.head()` and `s.value_counts()`

* Think about if any column has mostly 2 values and can be dropped. For that `df.describe()` can be useful

* Think about if any column needs conversion from object type to numeric type. If yes, then follow the below section step.

* Workflow for converting `string` __datatype__ column to `numeric` __datatype__
1. Explore the data in column
- s.dtype()
- s.unique()
2. Identify the patterns and special cases
3. Remove non-digit characters
- `Series.str.method_name()` __e.g__ `s.str.replace()`
4. Convert(cast) the column to numeric data type
- astype() __e.g__ `s.astype(int) or s.astype(float)`
> for checking datatypes of dataframe use `df.dtypes` attribute
5. Rename column if required

* Next step can be to look for outlier within the column.
`min() and max()` or `describe()` can be used to find an obvious outlier.

> Good resource to understand and indentify an outlier: https://www.wikihow.com/Calculate-Outliers

* After we drop all rows that show outlier, we can use aggregation methods and try to answer questions based on the dataset.

---


