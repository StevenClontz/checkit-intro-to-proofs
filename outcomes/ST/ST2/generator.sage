CheckIt.load("../../library/common.sage")

def generator():
    letters = list("abcdefghij")
    shuffle(letters)

    # count how many used in both, how many in just first,
    # how many in just second
    both_count = randrange(2,4)
    just_X_count = randrange(1,4)
    X = letters[:both_count+just_X_count]
    shuffle(X)
    just_Y_count = randrange(1,4)
    Y = letters[:both_count] + \
        letters[both_count+just_X_count:both_count+just_X_count+just_Y_count]
    shuffle(Y)
    
    unio = sorted(list(set(X).union(Y)))
    inte = sorted(list(set(X).intersection(Y)))
    if choice([True,False]):
        comp = sorted(list(set(letters)-set(X)))
        comp_set = "X"
    else:
        comp = sorted(list(set(letters)-set(Y)))
        comp_set = "Y"
    if choice([True,False]):
        diff = sorted(list(set(X)-set(Y)))
        diff_first = "X"
        diff_second = "Y"
    else:
        diff = sorted(list(set(Y)-set(X)))
        diff_first = "Y"
        diff_second = "X"

    return {
        "X": ",".join(X),
        "Xcard": len(X),
        "Y": ",".join(Y),
        "Ycard": len(Y),
        "union": ",".join(unio),
        "intersection": ",".join(inte),
        "complement": ",".join(comp),
        "complement_set": comp_set,
        "difference": ",".join(diff),
        "difference_first": diff_first,
        "difference_second": diff_second,
    }