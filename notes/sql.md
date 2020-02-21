- `COUNT` does not count `NULL` values
- `JOIN` puts two or more table horizontally
- For `UNION` both tables must have same number of columns as well as data types
- `UNION` puts two or more table vertically in stack
- `UNION` drops of the duplicate rows and to include all rows we use `UNION ALL`

> HINT: If selecting two or more columns where one column asks for `COUNT` then most probably you have to use `GROUP BY` for the other column

e.g
```
SELECT companies.permalink,
       companies.name,
       companies.status,
       COUNT(investments.investor_permalink) AS investors
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_investments_part1 investments
    ON companies.permalink = investments.company_permalink
   AND investments.funded_year > companies.founded_year + 5
 GROUP BY 1,2, 3
```

#### What does it mean to "wrangle" data?
_From Wikipedia:_

`Data munging or data wrangling is loosely the process of manually converting or mapping data from one "raw" form into another format that allows for more convenient consumption of the data with the help of semi-automated tools.`

In other words, data wrangling (or munging) is the process of programmatically transforming data into a format that makes it easier to work with. This might mean modifying all of the values in a given column in a certain way, or merging multiple columns together. The necessity for data wrangling is often a biproduct of poorly collected or presented data. Data that is entered manually by humans is typically fraught with errors; data collected from websites is often optimized to be displayed on websites, not to be sorted and aggregated.

For example, date is mostly stored as string and it is also many a times stored in `MM-DD-YYYY` or `DD-MM-YYYY`format which yields inconsistent result when sorted out.
The correct date format for sorting is `YYYY-MM-DD` and this example of converting the wrong date format to the correct year first format is an example of `Data munging` or `Data wrangling`.
