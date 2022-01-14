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
            "biconditional": True,
            choice(["PQ0","PQ1","QP0","QP1"]): True,
            "truth": (Ptrue == Qtrue),
        },
        choice([{
            "implication": True,
            choice(["PQ0","PQ1"]): True,
            "truth": ((not Ptrue) or Qtrue),
        },{
            "implication": True,
            choice(["QP0","QP1"]): True,
            "truth": ((not Qtrue) or Ptrue),
        }]),
    ]
    shuffle(statements)

    return {
        "P": P,
        "Ptrue": Ptrue,
        "Q": Q,
        "Qtrue": Qtrue,
        "statements": statements,
    }