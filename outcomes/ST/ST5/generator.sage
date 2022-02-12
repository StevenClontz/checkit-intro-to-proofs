load("library/common.sage")

def generator():
    endpoints = sorted(sample(list(range(-9,10)),6))
    opens = [True,True,False,False,choice([True,False]),choice([True,False])]
    shuffle(opens)
    left_indices = list(range(3))
    shuffle(left_indices)
    right_indices = list(range(3,6))
    shuffle(right_indices)
    starting_index = randrange(2,7)
    offset = randrange(2,5)
    set_letter = choice(list("ABCDEPQRS"))
    def interval(i,j):
        if opens[i]:
            result = "("
        else:
            result = "["
        result += str(endpoints[i])
        result += ","
        result += str(endpoints[j])
        if opens[j]:
            result += ")"
        else:
            result += "]"
        return result
    def label(i):
        return f"{set_letter}_{{{starting_index+offset*i}}}"
    intervals = [
        {
            "label": label(i),
            "interval": interval(left_indices[i],right_indices[i]),
        } for i in range(3)
    ]
    union = interval(0,5)
    intersection = interval(2,3)

    little_int = " \\cap ".join([label(i) for i in range(3)])
    little_uni = " \\cup ".join([label(i) for i in range(3)])
    bigcount_label = f"{set_letter}_{{{offset} n+{starting_index}}}"
    index_set = ",".join([str(starting_index+offset*i) for i in range(3)])

    return {
        "data": {
            "intervals": intervals,
            "little_int": little_int,
            "little_uni": little_uni,
            "bigcount_label": bigcount_label,
            "index_set": index_set,
            "set_letter": set_letter,
            "union": union,
            "intersection": intersection
        }
    }
    