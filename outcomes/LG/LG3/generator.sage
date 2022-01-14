load("library/common.sage")

def generator():
    Ptrue = choice([True,False])
    Qtrue = choice([True,False])
    P = random_inequality(valid=Ptrue)
    Q = random_inequality(valid=Qtrue)
    statements = [
        {
            "disjunction": True,
            choice(["PQ0","PQ1","QP0","QP1"]): True,
            "truth": (Ptrue or Qtrue),
        },
        {
            "conjunction": True,
            choice(["PQ0","PQ1","QP0","QP1"]): True,
            "truth": (Ptrue and Qtrue),
        },
        {
            "implication": True,
            choice(["PQ0","QP0"]): True,
            "truth": ((not Ptrue) or Qtrue),
        },
    ]
    shuffle(statements)

    return {
        "P": P,
        "Ptrue": Ptrue,
        "notP": contradict_inequality(P),
        "Q": Q,
        "Qtrue": Qtrue,
        "notQ": contradict_inequality(Q),
        "statements": statements,
    }