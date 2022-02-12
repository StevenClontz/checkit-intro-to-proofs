load("library/common.sage")

def generator():
    letters = list("ijklmnprst")
    shuffle(letters)

    k = var(letters[0])
    addend = sum([choice([-1,1])*randrange(1,4)*k^p for p in range(3)])
    start = randrange(6)
    end = start+randrange(2,5)
    terms = [addend.substitute(k==i) for i in range(start,end+1)]
    first = {
        "k": k,
        "terms": terms[:-1],
        "last_term": terms[-1],
        "start": start,
        "end": end,
        "sum": sum_formula(k,addend,start=start,end=end),
        "addend": addend,
    }

    k = var(letters[1])
    end = var(letters[2])
    addend = sum([choice([-1,1])*randrange(1,4)*k^p for p in range(3)])
    start = randrange(2,6)
    terms = [addend.substitute(k==i) for i in range(start,start+3)]
    last_term = addend.substitute(k==end)
    second = {
        "k": k,
        "terms": terms,
        "last_term": last_term,
        "start": start,
        "end": end,
        "addend": addend,
    }


    return {
        "data": {
            "first": first,
            "second": second,
        }
    }
