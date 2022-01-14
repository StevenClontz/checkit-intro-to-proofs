CheckIt.load("library/common.sage")

def generator():
    x = var("x")
    a,b,c,d = [choice([-1,1])*randrange(1,10) for _ in range(4)]
    u_true = choice([
        ((x+a)^2==x^2+2*a*x+a^2),
        ((x+a)^2!=x^2+2*a*x),
    ])
    u_false= choice([
        ((x+b)^2==2*b*x+b^2),
        ((x+b)^2!=2*b*x+b^2),
        ((x+b)^2==x^2+b^2),
        ((x+b)^2!=x^2+b^2),
    ])
    e_true = choice([
        ((x+c)^2==2*c*x+c^2),
        ((x+c)^2!=2*c*x+c^2),
        ((x+c)^2==x^2+c^2),
        ((x+c)^2!=x^2+c^2),
    ])
    e_false = choice([
        ((x+d)^2==x^2+2*d*x),
        ((x+d)^2!=x^2+2*d*x+d^2),
    ])
    def negate(eq):
        if eq.operator()==(SR(0)==0).operator():
            return eq.lhs()!=eq.rhs()
        else:
            return eq.lhs()==eq.rhs()
    statements = [
        {
            "universal": True,
            "truth": True,
            "open": u_true,
            "notopen": negate(u_true),
        },
        {
            "universal": True,
            "truth": False,
            "open": u_false,
            "notopen": negate(u_false),
        },
        {
            "existential": True,
            "truth": True,
            "open": e_true,
            "notopen": negate(e_true),
        },
        {
            "existential": True,
            "truth": False,
            "open": e_false,
            "notopen": negate(e_false),
        },
    ]
    shuffle(statements)

    return {
        "statements": statements,
    }