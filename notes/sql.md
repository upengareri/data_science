- If a column name is similar to as SQL function then to access that column, we need to put the column in double quotes. 

```
    e.g SELECT *
         FROM schema.table
        WHERE "group" ILIKE '%Coldplay%'
```

- `COUNT` does not count `NULL` values
- `WHERE` does not work on _aggregate functions_ but `HAVING` works. `HAVING` can also be replaced by __SUBQUERY__. Also, to note is the order when using `HAVING`
    ```
    SELECT
    FROM
    WHERE
    GROUP BY
    HAVING
    ORDER BY
    ```

- The `CASE` statement is SQL's way of handling if/then logic. 

> The `CASE` statement always goes in the SELECT clause
> `CASE` must include the following components: `WHEN`, `THEN`, and `END`. `ELSE` is an optional component.

- `JOIN` puts two or more tables horizontally
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

### What does it mean to "wrangle" data?
_From Wikipedia:_

`Data munging or data wrangling is loosely the process of manually converting or mapping data from one "raw" form into another format that allows for more convenient consumption of the data with the help of semi-automated tools.`

In other words, data wrangling (or munging) is the process of programmatically transforming data into a format that makes it easier to work with. This might mean modifying all of the values in a given column in a certain way, or merging multiple columns together. The necessity for data wrangling is often a biproduct of poorly collected or presented data. Data that is entered manually by humans is typically fraught with errors; data collected from websites is often optimized to be displayed on websites, not to be sorted and aggregated.

For example, date is mostly stored as string and it is also many a times stored in `MM-DD-YYYY` or `DD-MM-YYYY`format which yields inconsistent result when sorted out.
The correct date format for sorting is `YYYY-MM-DD` and this example of converting the wrong date format to the correct year first format is an example of `Data munging` or `Data wrangling`.

### String Operations in SQL for Cleaning Data

`1. LEFT(string, num_characters)`  --> returns substring from left with len(num_characters)

`2. RIGHT(string, num_characters)`  --> returns substring from right with len(num_characters)

`3. SUBSTR(string, start_index, num_characters)`  --> returns substring from any position (left, right, middle)

> LEFT() and RIGHT() can be considered as a special case of SUBSTR()

`3. LENGTH(string)`  --> returns int

`4. TRIM(leading/trailing/both 'string' FROM TEXT)`  --> does in-place replacement

    e.g    SELECT location,
            TRIM(both '()' FROM location)
           FROM tutorial.sf_crime_incidents_2014_01
        

        Here location is a column with data like (37.709725805163, -122.413623946206)

`5.1 POSITION('substring' IN TEXT)`  --> returns int

    OR

`5.2 STRPOS(TEXT, 'substring')`  --> return int

    e.g 
        SELECT incidnt_num,
               descript,
          POSITION('A' IN descript) AS a_position
        FROM tutorial.sf_crime_incidents_2014_01
      

    > This function is case-sensitive and returns the index of the first occurrence of the substring

`6.1 CONCAT(str1, str2, ...)`

`6.2 str1 || str2 || ...` --> PIPE

    e.g 
        SELECT location,
          CONCAT('(', lat, ',', lon, ')') as location_copy
        FROM tutorial.sf_crime_incidents_2014_01
    

`7.1` UPPER(str)  --> uppercase string

`7.2` LOWER(str)  --> lowercase string

-----------------------

### NOTE THE DIFFERENCE

1. `COUNT` and `GROUP BY` `COUNT` 

between

```
SELECT COUNT(state)
  FROM benn.college_football_players
```
and

```
SELECT state, COUNT(state)
  FROM benn.college_football_players
 GROUP BY 1
```
> `COUNT` with `GROUP BY` gives the count of each group.
> Mostly used in conjunction with `CASE`

e.g
```
SELECT CASE WHEN state IN ('CA', 'OR', 'WA') THEN 'West Coast'
            WHEN state = 'TX' THEN 'Texas'
            ELSE 'Other' END AS arbitrary_regional_designation,
            COUNT(1) AS players
  FROM benn.college_football_players
 WHERE weight >= 300
 GROUP BY 1
```

