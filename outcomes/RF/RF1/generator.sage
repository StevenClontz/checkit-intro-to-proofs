load("library/common.sage")

def generator():
    symbols = [
        r"\lozenge",
        r"\star",
        r"\boxdot",
        r"\boxtimes",
        r"\circledast",
        r"\circleddash",
        r"\curlyvee",
        r"\curlywedge",
    ]
    shuffle(symbols)

    elements = [
        sample([var(l) for l in list("abcdef")],4),
        sample([var(l) for l in list("ghijkl")],4),
        sample([var(l) for l in list("mnpqrs")],4),
    ]
    shuffle(elements)

    # equiv relation
    a,b,c,d = elements[0]
    s = symbols[0]
    if choice([True,False]):
        #2 and 2
        relation = Set([
            (a,a),(a,b),(b,a),(b,b),
            (c,c),(c,d),(d,c),(d,d),
        ])
        relations = [{
            "relation": relation,
            "label": s,
            "property": "an equivlance relation",
            "reason": f"<m>{a}{s} {b}</m> and <m>{c}{s} {d}</m>",
            "domain": Set(elements[0]),
        }]
    else:
        #1 and 3
        relation = Set([
            (a,a),
            (b,b),(b,c),(b,d),
            (c,b),(c,c),(c,d),
            (d,b),(d,c),(d,d),
        ])
        relations = [{
            "relation": relation,
            "label": s,
            "property": "an equivlance relation",
            "reason": f"<m>{b}{s} {c}{s} {d}</m>, "+\
                f"and <m>{a}{s} {a}</m> only",
            "domain": Set(elements[0]),
        }]

    # partial order
    a,b,c,d = elements[1]
    s = symbols[1]
    if choice([True,False]):
        #non-strict (non-linear)
        relation = Set([
            (a,a),(a,b),(a,c),(a,d),
            (b,b),(b,d),
            (c,c),(c,d),
            (d,d),
        ])
        relations += [{
            "relation": relation,
            "label": s,
            "property": "a non-strict partial order",
            "reason": f"<m>{a}{s} {b}{s} {d}</m> "+\
                f"and <m>{a}{s} {c}{s} {d}</m>",
            "domain": Set(elements[1]),
        }]
    else:
        #strict (linear)
        relation = Set([
            (a,b),(a,c),(a,d),
            (b,c),(b,d),
            (c,d),
        ])
        relations += [{
            "relation": relation,
            "label": symbols[1],
            "property": "a strict partial order",
            "reason": f"<m>{a}{s} {b}{s} {c}{s} {d}</m>",
            "domain": Set(elements[1]),
        }]
    
    # none
    a,b,c,d = elements[2]
    s = symbols[2]
    roll = randrange(3)
    if roll==0:
        # sym & refl but not tran
        relation = Set([
            (a,a),(b,b),(c,c),(d,d),
            (a,b),(b,a),
            (b,c),(b,c),
        ])
        relations += [{
            "relation": relation,
            "label": s,
            "property": "none of these",
            "reason": "not transitive",
            "domain": Set(elements[2]),
        }]
    elif roll==1:
        # refl & tran but not sym/antisym
        relation = Set([
            (a,a),(a,b),(b,a),(b,b),
            (c,c),(c,d),(d,d),
        ])
        relations += [{
            "relation": relation,
            "label": s,
            "property": "none of these",
            "reason": "neither symmetric nor anti-symmetric",
            "domain": Set(elements[2]),
        }]
    elif roll==2:
        # antisym & tran but not refl/antirefl
        relation = Set([
            (a,a),(a,b),(a,c),(a,d),
            (b,b),(b,c),(b,d),
            (c,d),
        ])
        relations += [{
            "relation": relation,
            "label": s,
            "property": "none of these",
            "reason": "neither reflexive nor anti-reflexive",
            "domain": Set(elements[2]),
        }]

    shuffle(relations)
    return { 
        "relations": relations,
    }
