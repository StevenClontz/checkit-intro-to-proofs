load("library/common.sage")

def generator():
    sets = sample(list("ABCDEHJKLMNPQRSUVWXYZ"),3)
    roll = randrange(10)
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
            conclusion = rf"{sets[0]}\subseteq {sets[0]}\cap {sets[1]}"
        else:
            conclusion = rf"{sets[0]}\cap {sets[1]}\supseteq {sets[0]}"
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
            conclusion = rf"{sets[1]}\supseteq {sets[0]}\cap {sets[1]}"
        else:
            conclusion = rf"{sets[0]}\cup {sets[1]}\subseteq {sets[1]}"
    elif roll==5:
        sets = sets[:2]
        if choice([True,False]):
            hypothesis = rf"{sets[1]}\supseteq {sets[0]}\cap {sets[1]}"
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

