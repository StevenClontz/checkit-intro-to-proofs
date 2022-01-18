load("library/common.sage")

def generator():
    es = list(range(10,100))
    shuffle(es)
    sets = list("ABCDEMNPQRSTUVWXYZ")
    A,B,C,D = [var(s) for s in sample(sets,4)]
    funcs = list("fghjkl")
    f,g,h = [var(t) for t in sample(funcs,3)]

    roll = randrange(6)
    if roll==0:
        # bi sur inj
        f_props = "injective, surjective, and bijective"
        g_props = "not injective, surjective, and not bijective"
        h_props = "injective, not surjective, and not bijective"
        comp = f"{f} \\circ {g}"
        compD = A
        compCD = C
        comp_props = "not injective, surjective, and not bijective"
        N = 4
        Aset = sorted([es.pop() for _ in range(N)])
        Bset = sorted([es.pop() for _ in range(N)])
        Cset = sorted([es.pop() for _ in range(N-1)])
        Dset = sorted([es.pop() for _ in range(N)])
        k = list(range(N))
        shuffle(k)
        fset = [(Aset[i],Bset[k[i]]) for i in range(N)]
        k = list(range(N-1))+[randrange(N-1)] #repeat
        shuffle(k)
        gset = [(Bset[i],Cset[k[i]]) for i in range(N)]
        k = list(range(N))
        shuffle(k)
        k.pop() # miss
        hset = [(Cset[i],Dset[k[i]]) for i in range(N-1)]
    elif roll==1:
        # bi inj sur
        f_props = "injective, surjective, and bijective"
        g_props = "injective, not surjective, and not bijective"
        h_props = "not injective, surjective, and not bijective"
        comp = f"{f} \\circ {g}"
        compD = A
        compCD = C
        comp_props = "injective, not surjective, and not bijective"
        N = 3
        Aset = sorted([es.pop() for _ in range(N)])
        Bset = sorted([es.pop() for _ in range(N)])
        Cset = sorted([es.pop() for _ in range(N+1)])
        Dset = sorted([es.pop() for _ in range(N)])
        k = list(range(N))
        shuffle(k)
        fset = [(Aset[i],Bset[k[i]]) for i in range(N)]
        k = list(range(N+1))
        shuffle(k)
        k.pop() # miss
        gset = [(Bset[i],Cset[k[i]]) for i in range(N)]
        k = list(range(N))+[randrange(N)] # repeat
        shuffle(k)
        hset = [(Cset[i],Dset[k[i]]) for i in range(N+1)]
    elif roll==2:
        # sur bi inj
        f_props = "not injective, surjective, and not bijective"
        g_props = "injective, surjective, and bijective"
        h_props = "injective, not surjective, and not bijective"
        if choice([True,False]):
            comp = f"{f} \\circ {g}"
            compD = A
            compCD = C
            comp_props = "not injective, surjective, and not bijective"
        else:
            comp = f"{g} \\circ {h}"
            compD = B
            compCD = D
            comp_props = "injective, not surjective, and not bijective"
        N = 4
        Aset = sorted([es.pop() for _ in range(N)])
        Bset = sorted([es.pop() for _ in range(N-1)])
        Cset = sorted([es.pop() for _ in range(N-1)])
        Dset = sorted([es.pop() for _ in range(N)])
        k = list(range(N-1))+[randrange(N-1)] #repeat
        shuffle(k)
        fset = [(Aset[i],Bset[k[i]]) for i in range(N)]
        k = list(range(N-1))
        shuffle(k)
        gset = [(Bset[i],Cset[k[i]]) for i in range(N-1)]
        k = list(range(N))
        shuffle(k)
        k.pop() # miss
        hset = [(Cset[i],Dset[k[i]]) for i in range(N-1)]
    elif roll==3:
        # inj bi sur
        f_props = "injective, not surjective, and not bijective"
        g_props = "injective, surjective, and bijective"
        h_props = "not injective, surjective, and not bijective"
        if choice([True,False]):
            comp = f"{f} \\circ {g}"
            compD = A
            compCD = C
            comp_props = "injective, not surjective, and not bijective"
        else:
            comp = f"{g} \\circ {h}"
            compD = B
            compCD = D
            comp_props = "not injective, surjective, and not bijective"
        N = 3
        Aset = sorted([es.pop() for _ in range(N)])
        Bset = sorted([es.pop() for _ in range(N+1)])
        Cset = sorted([es.pop() for _ in range(N+1)])
        Dset = sorted([es.pop() for _ in range(N)])
        k = list(range(N+1))
        shuffle(k)
        k.pop() # miss
        fset = [(Aset[i],Bset[k[i]]) for i in range(N)]
        k = list(range(N+1))
        shuffle(k)
        gset = [(Bset[i],Cset[k[i]]) for i in range(N+1)]
        k = list(range(N))+[randrange(N)] #repeat
        shuffle(k)
        hset = [(Cset[i],Dset[k[i]]) for i in range(N+1)]
    elif roll==4:
        # sur inj bi
        f_props = "not injective, surjective, and not bijective"
        g_props = "injective, not surjective, and not bijective"
        h_props = "injective, surjective, and bijective"
        comp = f"{g} \\circ {h}"
        compD = B
        compCD = D
        comp_props = "injective, not surjective, and not bijective"
        N = 4
        Aset = sorted([es.pop() for _ in range(N)])
        Bset = sorted([es.pop() for _ in range(N-1)])
        Cset = sorted([es.pop() for _ in range(N)])
        Dset = sorted([es.pop() for _ in range(N)])
        k = list(range(N-1))+[randrange(N-1)] #repeat
        shuffle(k)
        fset = [(Aset[i],Bset[k[i]]) for i in range(N)]
        k = list(range(N))
        shuffle(k)
        k.pop() # miss
        gset = [(Bset[i],Cset[k[i]]) for i in range(N-1)]
        k = list(range(N))
        shuffle(k)
        hset = [(Cset[i],Dset[k[i]]) for i in range(N)]
    elif roll==5:
        # inj sur bi
        f_props = "injective, not surjective, and not bijective"
        g_props = "not injective, surjective, and not bijective"
        h_props = "injective, surjective, and bijective"
        comp = f"{g} \\circ {h}"
        compD = B
        compCD = D
        comp_props = "not injective, surjective, and not bijective"
        N = 3
        Aset = sorted([es.pop() for _ in range(N)])
        Bset = sorted([es.pop() for _ in range(N+1)])
        Cset = sorted([es.pop() for _ in range(N)])
        Dset = sorted([es.pop() for _ in range(N)])
        k = list(range(N+1))
        shuffle(k)
        k.pop() # miss
        fset = [(Aset[i],Bset[k[i]]) for i in range(N)]
        k = list(range(N))+[randrange(N)] #repeat
        shuffle(k)
        gset = [(Bset[i],Cset[k[i]]) for i in range(N+1)]
        k = list(range(N))
        shuffle(k)
        hset = [(Cset[i],Dset[k[i]]) for i in range(N)]


    return {
        "A": A,
        "Aset": ",".join([latex(a) for a in Aset]),
        "B": B,
        "Bset": ",".join([latex(a) for a in Bset]),
        "C": C,
        "Cset": ",".join([latex(a) for a in Cset]),
        "D": D,
        "Dset": ",".join([latex(a) for a in Dset]),
        "f": f,
        "fset": ",".join([latex(a) for a in fset]),
        "f_props": f_props,
        "g": g,
        "gset": ",".join([latex(a) for a in gset]),
        "g_props": g_props,
        "h": h,
        "hset": ",".join([latex(a) for a in hset]),
        "h_props": h_props,
        "comp": comp,
        "comp_props": comp_props,
        "compD": compD,
        "compCD": compCD,
    }
