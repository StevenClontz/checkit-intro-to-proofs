load("library/common.sage")

def generator():
    sets = random_equal_sets()
    return {
        "first": sets[0],
        "second": sets[1],
    }