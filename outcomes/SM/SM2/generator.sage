load("library/common.sage")

def generator():
    letters = list("ijklmnprst")
    shuffle(letters)

    k = var(letters[0])
    end = var(letters[1])
    addend = sum([choice([-2,2])*randrange(1,4)*k^p for p in range(2)])
    start = randrange(2,6)
    return {
        "k": k,
        "start": start,
        "end": end,
        "addend": addend,
        "sum": sum_formula(k,addend,start=start,end=end),
    }
