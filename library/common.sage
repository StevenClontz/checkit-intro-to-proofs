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