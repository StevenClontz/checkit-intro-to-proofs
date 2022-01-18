import string

def parse_text(filename):
    with open(f"library/{filename}.txt") as f:
        return [word.strip() for word in f.readlines() if word[0].isalpha()]

OBJECT_LIST = parse_text("objects")
PROPERTY_LIST = parse_text("properties")
def random_object_words(count):
    return sample(OBJECT_LIST,count)
def random_property_words(count):
    return sample(PROPERTY_LIST,count)

def random_lowercase_letter():
    return choice(string.ascii_lowercase)

def random_letter():
    l = random_lowercase_letter()
    if choice([True,False]):
        return l
    else:
        return l.upper()

def random_inequality(strict=None,valid=None):
    if strict is None:
        strict = choice([True,False])
    if valid is None:
        valid = choice([True,False])
    a_int = randrange(1,10)
    b_int = randrange(1,10)
    if valid:
        if a_int+b_int>=0:
            c_int = randrange(1,10)
            c_sign = +1
        else:
            c_int = -(a_int+b_int)+randrange(1,6)
            c_sign = +1
    else:
        if a_int+b_int>=0:
            c_int = a_int+b_int+randrange(1,6)
            c_sign = -1
        else:
            c_int = randrange(1,10)
            c_sign = -1
    a = var("a",latex_name=str(a_int))
    b = var("b",latex_name=str(b_int))
    c = var("c",latex_name=str(c_int))
    return CheckIt.shuffled_inequality(
        a,
        b,
        c_sign*c,
        strict=strict,
    )

def contradict_inequality(ineq):
    if ineq.operator()==(SR(0)>0).operator():
        return ineq.lhs()<=ineq.rhs()
    elif ineq.operator()==(SR(0)>=0).operator():
        return ineq.lhs()<ineq.rhs()
    elif ineq.operator()==(SR(0)<0).operator():
        return ineq.lhs()>=ineq.rhs()
    elif ineq.operator()==(SR(0)<=0).operator():
        return ineq.lhs()>ineq.rhs()

def random_set_conditional(allow_subtraction=True):
    sets = sample(list("ABCDEHJKLMNPQRUVWXYZ"),3)
    if allow_subtraction:
        roll = randrange(10)
    else:
        roll = randrange(6)
    if roll==0:
        if choice([True,False]):
            hypothesis = rf"{sets[0]}\subseteq {sets[1]}"
        else:
            hypothesis = rf"{sets[1]}\supseteq {sets[0]}"
        if choice([True,False]):
            conclusion = rf"{sets[0]}\cup {sets[2]}\subseteq {sets[1]}\cup {sets[2]}"
        else:
            conclusion = rf"{sets[1]}\cup {sets[2]}\supseteq {sets[0]}\cup {sets[2]}"
    elif roll==1:
        if choice([True,False]):
            hypothesis = rf"{sets[0]}\subseteq {sets[1]}"
        else:
            hypothesis = rf"{sets[1]}\supseteq {sets[0]}"
        if choice([True,False]):
            conclusion = rf"{sets[0]}\cap {sets[2]}\subseteq {sets[1]}\cap {sets[2]}"
        else:
            conclusion = rf"{sets[1]}\cap {sets[2]}\supseteq {sets[0]}\cap {sets[2]}"
    elif roll==2:
        sets = sets[:2]
        if choice([True,False]):
            hypothesis = rf"{sets[0]}\subseteq {sets[1]}"
        else:
            hypothesis = rf"{sets[1]}\supseteq {sets[0]}"
        if choice([True,False]):
            conclusion = rf"{sets[0]}= {sets[0]}\cap {sets[1]}"
        else:
            conclusion = rf"{sets[0]}\cap {sets[1]}= {sets[0]}"
    elif roll==3:
        sets = sets[:2]
        if choice([True,False]):
            hypothesis = rf"{sets[0]}\subseteq {sets[0]}\cap {sets[1]}"
        else:
            hypothesis = rf"{sets[0]}\cap {sets[1]}\supseteq {sets[0]}"
        if choice([True,False]):
            conclusion = rf"{sets[0]}\subseteq {sets[1]}"
        else:
            conclusion = rf"{sets[1]}\supseteq {sets[0]}"
    elif roll==4:
        sets = sets[:2]
        if choice([True,False]):
            hypothesis = rf"{sets[0]}\subseteq {sets[1]}"
        else:
            hypothesis = rf"{sets[1]}\supseteq {sets[0]}"
        if choice([True,False]):
            conclusion = rf"{sets[1]}\supseteq {sets[0]}\cup {sets[1]}"
        else:
            conclusion = rf"{sets[0]}\cup {sets[1]}\subseteq {sets[1]}"
    elif roll==5:
        sets = sets[:2]
        if choice([True,False]):
            hypothesis = rf"{sets[1]}\supseteq {sets[0]}\cup {sets[1]}"
        else:
            hypothesis = rf"{sets[0]}\cup {sets[1]}\subseteq {sets[1]}"
        if choice([True,False]):
            conclusion = rf"{sets[0]}\subseteq {sets[1]}"
        else:
            conclusion = rf"{sets[1]}\supseteq {sets[0]}"
    elif roll==6:
        if choice([True,False]):
            hypothesis = rf"{sets[0]}\subseteq {sets[1]}"
        else:
            hypothesis = rf"{sets[1]}\supseteq {sets[0]}"
        if choice([True,False]):
            conclusion = rf"{sets[2]}\setminus {sets[1]}\subseteq {sets[2]}\setminus {sets[0]}"
        else:
            conclusion = rf"{sets[2]}\setminus {sets[0]}\supseteq {sets[2]}\setminus {sets[1]}"
    elif roll==7:
        if choice([True,False]):
            hypothesis = rf"{sets[0]}\setminus {sets[1]}\subseteq {sets[2]}"
        else:
            hypothesis = rf"{sets[2]} \supseteq {sets[0]}\setminus {sets[1]}"
        if choice([True,False]):
            conclusion = rf"{sets[0]}\subseteq {sets[1]} \cup {sets[2]}"
        else:
            conclusion = rf"{sets[1]} \cup {sets[2]}\supseteq {sets[0]}"
    elif roll==8:
        if choice([True,False]):
            hypothesis = rf"{sets[0]}\subseteq {sets[1]} \cup {sets[2]}"
        else:
            hypothesis = rf"{sets[1]} \cup {sets[2]}\supseteq {sets[0]}"
        if choice([True,False]):
            conclusion = rf"{sets[0]}\setminus {sets[1]}\subseteq {sets[2]}"
        else:
            conclusion = rf"{sets[2]} \supseteq {sets[0]}\setminus {sets[1]}"
    elif roll==9:
        if choice([True,False]):
            hypothesis = rf"{sets[0]}\setminus {sets[1]}\subseteq {sets[2]}"
        else:
            hypothesis = rf"{sets[2]}\supseteq {sets[0]}\setminus {sets[1]}"
        if choice([True,False]):
            conclusion = rf"{sets[0]}\setminus {sets[2]}\subseteq {sets[1]}"
        else:
            conclusion = rf"{sets[1]}\supseteq {sets[0]}\setminus {sets[2]}"
    return {
        "sets": ",".join(sorted(sets)),
        "hypothesis": hypothesis,
        "conclusion": conclusion,
    }

def random_equal_sets():
    sets = sample(list("ABCDEHJKLMNPQRUVWXYZ"),3)
    roll = randrange(4)
    if roll==0:
        combos = [
            choice([
                rf"({sets[0]}\cap {sets[1]})\cup {sets[2]}",
                rf"{sets[2]}\cup ({sets[0]}\cap {sets[1]})",
            ]),
            rf"({sets[0]}\cup {sets[2]})\cap ({sets[1]}\cup {sets[2]})"
        ]
    elif roll==1:
        combos = [
            choice([
                rf"({sets[0]}\cup {sets[1]})\cap {sets[2]}",
                rf"{sets[2]}\cap ({sets[0]}\cup {sets[1]})",
            ]),
            rf"({sets[0]}\cap {sets[2]})\cup ({sets[1]}\cap {sets[2]})"
        ]
    elif roll==2:
        combos = [
            rf"{sets[0]}\setminus ({sets[1]}\cup {sets[2]})",
            rf"({sets[0]}\setminus {sets[1]})\cap ({sets[0]}\setminus {sets[2]})"
        ]
    elif roll==3:
        combos = [
            rf"{sets[0]}\setminus ({sets[1]}\cap {sets[2]})",
            rf"({sets[0]}\setminus {sets[1]})\cup ({sets[0]}\setminus {sets[2]})"
        ]
    shuffle(combos)
    return combos

def sum_formula(i,exp,start=0,end=None):
    # i is variable of formula exp used in summation
    # supports terms i^0 through i^2 in exp only
    if end is None:
        end = var("n")
    x = var("x")
    formula = sum([
        exp.coefficient(i,0)*x,
        exp.coefficient(i,1)*x*(x+1)/2,
        exp.coefficient(i,2)*x*(x+1)*(2*x+1)/6
    ])
    return formula(x=end)-formula(x=(start-1))