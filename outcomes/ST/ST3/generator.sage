load("library/common.sage")

def generator():
    odd = 2*randrange(-4,4)+1
    even = 2*randrange(-3,4)
    elements = [choice([
        {
            "description": "The number",
            "element": odd,
            "is_int?": True,
            "is_odd?": True,
        },
        {
            "description": "The number",
            "element": even,
            "is_int?": True,
            "is_even?": True,
        }
    ])]

    singleton_even_odd = choice(["D","E"])
    if singleton_even_odd == "D":
        singleton = Set([odd+choice([-2,2])])
    else:
        singleton = Set([even+choice([-2,2])])
    elements += [{
        "description": "The set",
        "element": singleton,
        "is_int_sub?": True,
        "is_odd_sub?":  (singleton_even_odd=="D"),
        "is_even_sub?":  (singleton_even_odd=="E"),
        "is_int_sing?": True,
        "is_odd_sing?":  (singleton_even_odd=="D"),
        "is_even_sing?":  (singleton_even_odd=="E"),
    }]

    doubleton_even_odd = choice(["mixed","D","E"])
    if doubleton_even_odd == "D":
        doubleton = Set([odd,odd+choice([-2,2])])
    elif doubleton_even_odd == "E":
        doubleton = Set([even,even+choice([-2,2])])
    else:
        doubleton = Set([odd+choice([-2,2]),even+choice([-2,2])])
    elements += [{
        "description": "The set",
        "element": doubleton,
        "is_int_sub?": True,
        "is_odd_sub?":  (doubleton_even_odd=="D"),
        "is_even_sub?":  (doubleton_even_odd=="E"),
        "is_int_doub?": True,
        "is_odd_doub?":  (doubleton_even_odd=="D"),
        "is_even_doub?":  (doubleton_even_odd=="E"),
    }]

    doub_sing_even_odd = choice(["D","E","mixed"])
    if doub_sing_even_odd == "D":
        doub_sing = Set([Set([odd]),Set([odd+choice([-2,2])])])
    elif doub_sing_even_odd == "E":
        doub_sing = Set([Set([even]),Set([even+choice([-2,2])])])
    else:
        doub_sing = Set([Set([odd+choice([-2,2])]),Set([even+choice([-2,2])])])
    sing_doub_even_odd = choice(["D","E","mixed"])
    if sing_doub_even_odd == "D":
        sing_doub = Set([Set([odd,odd+choice([-2,2])])])
    elif sing_doub_even_odd == "E":
        sing_doub = Set([Set([even,even+choice([-2,2])])])
    else:
        sing_doub = Set([Set([odd+choice([-2,2]),even+choice([-2,2])])])
    elements += [choice([
        {
            "description": "The set of sets",
            "element": doub_sing,
            "is_int_sing_sub?": True,
            "is_odd_sing_sub?":  (doub_sing_even_odd=="D"),
            "is_even_sing_sub?":  (doub_sing_even_odd=="E"),
        },
        {
            "description": "The set of sets",
            "element": sing_doub,
            "is_int_doub_sub?": True,
            "is_odd_doub_sub?":  (sing_doub_even_odd=="D"),
            "is_even_doub_sub?":  (sing_doub_even_odd=="E"),
        }
    ])]

    shuffle(elements)
    return {
        "data": {
            "elements": elements,
        }
    }