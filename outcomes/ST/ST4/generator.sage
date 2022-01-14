load("library/common.sage")

def generator():
    digits = list(range(1,10))
    shuffle(digits)
    Acard = choice([2,3])
    Bcard = choice([2,3])
    A = sorted(digits[:Acard])
    B = sorted(digits[Acard:Acard+Bcard])

    if choice([True,False]):
        product = r"A\times B"
        set_list =  ",".join([f"({a},{b})" for a in A for b in B])
    else:
        product = r"B\times A"
        set_list =  ",".join([f"({b},{a})" for b in B for a in A])
    products = [{
        "product": product,
        "cardinality": Acard*Bcard,
        "set_list": set_list,
    }]

    if choice([True,False]):
        product = r"A^2"
        cardinality = Acard^2
        set_list =  ",".join([f"({a},{b})" for a in A for b in A])
    else:
        product = r"B^2"
        cardinality = Bcard^2
        set_list =  ",".join([f"({a},{b})" for a in B for b in B])
    products += [{
        "product": product,
        "cardinality": cardinality,
        "set_list": set_list,
    }]

    shuffle(products)
    return {
        "A": Set(A),
        "B": Set(B),
        "products": products,
    }