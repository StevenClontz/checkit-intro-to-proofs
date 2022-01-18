load("library/common.sage")

def generator():
    ns = sorted(sample(list(range(-9,10)),4))
    sets = [
        {   # empty
            "set": f"({ns[0]},{ns[1]})\\cap ({ns[2]},{ns[3]})",
            "result": "finite and countable",
        },
        {   # finite
            "set": f"({ns[0]},{ns[3]})\\cap \\mathbb Z",
            "result": "finite and countable",
        },
        {   # infinite and countable
            "set": f"({ns[1]},{ns[2]})\\cap \\mathbb Q",
            "result": "infinite and countable",
        },
        {   # uncountable
            "set": f"({ns[0]},{ns[2]})\\cap ({ns[1]},{ns[3]})",
            "result": "infinite and uncountable",
        },
    ]

    shuffle(sets)
    return { "sets": sets }
