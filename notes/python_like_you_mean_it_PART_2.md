# NOTES from PLYMI (Python Like You Mean It) - PART 2 

## --------------- NUMPY --------------

```
            -- axis-1 ->
              -2  -1
               0   1
  |          +---+---+
  |    -3, 0 |93 | 95|
  |          +---+---+
axis-0 -2, 1 |84 |100|
  |          +---+---+
  |    -1, 2 |99 | 87|
  V          +---+---+
```

### Accessing data along multi-dimensional array

```python
>>> import numpy as np

# A 3-D array
>>> x = np.array([[[0, 1],
...                [2, 3]],
...
...               [[4, 5],
...                [6, 7]]])

# get: sheet-0, both rows, flip order of columns
>>> x[0, :, ::-1]
array([[1, 0],
       [3, 2]])
```
> You can think of axis-0 denoting which of the 2x2 “sheets” to select from. Then axis-1 specifies the row along the sheets, and axis-2 the column within the row.

> In four dimensions, one can think of “stacks of sheets with rows and columns” where axis-0 selects the stack of sheets you are working with, axis-1 chooses the sheet, axis-2 chooses the row, and axis-3 chooses the column. 

Definition:
> The dimensionality of an array specifies the number of indices that are required to uniquely specify one of its entries.

Axis vs Dimension:
> Although NumPy does formally recognize the concept of dimensionality precisely in the way that it is discussed here, its documentation refers to an individual dimension of an array as an axis. Thus you will see “axes” (pronounced “aks-ēz”) used in place of “dimensions”; however, they mean the same thing.

### Supplying Fewer Indices Than Dimensions

> Suppose you have an 𝑁-dimensional array, and only provide 𝑗 indices for the array; NumPy will automatically insert 𝑁−𝑗 trailing slices for you. In the case that 𝑁=5 and 𝑗=3, d5_array[0, 0, 0] is treated as d5_array[0, 0, 0, :, :]

Example:
```python
>>> grades = np.array([[93,  95],
...                    [84, 100],
...                    [99,  87]])

>>> grades[0]
array([ 93, 95])
```
`grades[0]` was treated as `grades[0, :]`.

---
**No data is copied when you index into an np.array using integer indices and/or slices. Recall that slicing lists and tuples do produce copies of the data.**
---
