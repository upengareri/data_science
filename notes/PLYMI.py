def merge_max_mappings(*dicts):
    merged = {}
    for d in dicts:
        for key in d:
            if key not in merged or d[key] > merged[key]:
                merged[key] = d[key]

    return merged 

def is_palindrome(input_str):
    """ Given a string, determine if it is palindrome or not.
    Whitespace, non alpha-numeric and character casing are all ignored
    Parameters
    ----------
    input_str: str
        Input string

    Returns
    -------
    bool
    """
    filtered_str = "".join(c for c in input_str.lower() if c.isalnum())
    return filtered_str == filtered_str[::-1]
    
def difference_fanout(nums, fanout):
    """Return a list of differences for each value with its following fans

    Parameters
    ----------
    nums: List[Number]
        Input list of base numbers
    fanout: int
        Number of following fans

    Returns
    -------
    List[List[Number]]
    """
    # total_items = len(nums)
    # ------------------------ SOLUTION 1 -----------------------
    # res = []
    # for i in range(total_items):
    #     res1 = []
    #     for j in range(fanout):
    #         next_item = i + 1 + j
    #         if (next_item < total_items):
    #             res1.append(nums[next_item] - nums[i])
    #     res.append(res1)
    # return res

    # ------------------------ SOLUTION 2 -----------------------
    # res = [[nums[i+1+j] - nums[i] for j in range(fanout) if i+1+j < total_items] for i in range(total_items)]
    # ------------------------ SOLUTION 3 -----------------------
    res = [[neighbour - num for neighbour in nums[i+1:i+1+fanout]] for i, num in enumerate(nums)]
    return res    

def concat_to_str(l):
    """Maps a list of object in the list to its string representation concatenated together

    Parameters
    ----------
    l: List[Any]
        Input list of objects

    Returns
    -------
    str
        The concatenated form of the items in the list

    Example
    -------
    >>> concat_to_str([1, None, "hi", 2.0])
    one | <Other> | hi | two and float
    """


if __name__ == "__main__":
    a = dict(a=0, b=100, c=3)
    b = dict(a=10, b=10)
    c = dict(c=50)
    d = dict(d=-70)
    e = dict()
    # merge_max_mappings()
    # merged = merge_max_mappings(a)
    # print("Merged content", merged)
    merged = merge_max_mappings(a, b, c, d, e)
    print("Merged content", merged)

    res = is_palindrome("live on time, emit no evil")
    print("Palindrome: ", res)

    res = difference_fanout([3, 2, 4, 6, 1], 3)
    print("Fanout: ", res)
