load("library/common.sage")

def generator():

    # finite_list
    x = var(choice(list("xyzmn")))
    sols = [randrange(-5,6) for _ in range(6)]
    sol_set = sorted(list(set(sols)))
    predicate = prod([
        ((x-sols[2*i])*(x-sols[2*i+1])).expand() for i in range(3)
        ])==0
    sets = [
        {
            "finite_list": True,
            "predicate": predicate,
            "list": [{"item":item} for item in sol_set[:-1]],
            "last": sol_set[-1],
            "var": x,
        }
    ]

    # infinite_list
    y = var(choice(list("xyzst")))
    factor = randrange(3,10)
    offset = randrange(1,factor)
    subject = factor*y+offset
    sol_set = [offset+factor*i for i in range(-2,3)]
    sets += [
        {
            "infinite_list": True,
            "subject": subject,
            "list": [{"item":item} for item in sol_set],
            "var": y,
        }
    ]

    # builder
    n = var("n")
    top = choice([3,5,7])*n+choice([1,2])
    bottom = choice([4,6,8])*n+choice([1,2])
    sol_set = [top(n=i)/bottom(n=i) for i in range(1,6)]
    sets += [
        {
            "builder": True,
            "top": top,
            "bottom": bottom,
            "list": [
                {
                    "top":top(n=i),
                    "bottom":bottom(n=i),
                }
                for i in range(1,6)
            ],
            "var": n,
        }
    ]


    shuffle(sets)
    return {
        "data": {"sets": sets}
    }
