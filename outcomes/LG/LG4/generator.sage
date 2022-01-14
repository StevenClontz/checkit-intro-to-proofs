CheckIt.load("library/common.sage")
import sage.logic.logicparser as logicparser

def generator():
    props = list("PQRS")
    def negate(branch):
        if isinstance(branch,str):
            return ["~",branch]
        else:
            if branch[0] == "~":
                return branch[1]
            elif branch[0] == "&":
                return ["|", negate(branch[1]), negate(branch[2])]
            elif branch[0] == "|":
                return ["&", negate(branch[1]), negate(branch[2])]
            else: #implication
                return ["&", branch[1], negate(branch[2])]
    for i in range(4):
        if choice([True,False]):
            props[i] = negate(props[i])
    ops = ["&","|","->"]
    shuffle(ops)
    for _ in range(3):
        shuffle(props)
        p = props.pop()
        q = props.pop()
        props.append([ops.pop(),p,q])
    statement_tree = props[0]
    statement = propcalc.formula(logicparser.recover_formula(statement_tree))
    negation_tree = negate(statement_tree)
    negation = propcalc.formula(logicparser.recover_formula(negation_tree))
    P,Q,R,S = [choice([True,False]) for _ in range(4)]

    return {
        "statement": statement,
        "true": statement.evaluate({"P":P,"Q":Q,"R":R,"S":S}),
        "negation": negation,
        "P":P,
        "Q":Q,
        "R":R,
        "S":S,
    }
