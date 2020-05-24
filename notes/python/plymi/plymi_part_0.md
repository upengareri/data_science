def merge_max_mappings(*dicts):
    merged = {}
    for d in dicts:
        for key in d:
            if key not in merged or d[key] > merged[key]:
                merged[key] = d[key]

    return merged 

# -------------------------------------END-------------------------------------------

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
    
# --------------------------------------END------------------------------------------

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

# ------------------------------------END--------------------------------------------

def int_to_word(num):
    """ Takes an integer and formats it into a special string
        e.g. 142 -> one-four-two
             -12 -> neg-one-two
    """
    mapping = {"0": "zero", "1": "one", "2": "two", "3": "three",
               "4": "four", "5": "five", "6": "six", "7": "seven",
               "8": "eight", "9": "nine", "-": "neg"}
    
    return "-".join(mapping[digit] for digit in str(num))

def input_to_transcript(item):
    """ Any -> str"""
    if isinstance(item, bool): return "<Other>"  # in-line syntax
    if isinstance(item, int): return int_to_word(item)
    if isinstance(item, float): return int_to_word(int(item)) + " and float"
    if isinstance(item, str): return item
    return "<Other>"


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
    return " | ".join(input_to_transcript(item) for item in l)

# --------------------------------------END------------------------------------------

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

    l = [12,-14.23,"hello", True, "Aha", 10.1, None, 5]
    s = concat_to_str(l)
    print("Encode as string:")
    print("Input: ", l)
    print("Output: ", s)
