load("library/common.sage")

def generator():
    first_coeffs = [randrange(1,10)*choice([-1,1]) for _ in range(5)]
    second_coeffs = [randrange(1,10)*choice([-1,1]) for _ in range(5)]
    if first_coeffs[0]+second_coeffs[0]==0:
        second_coeffs[0]+=randrange(1,6)
    solution = randrange(2,5)*choice([-1,1])
    terms = [first_coeffs[i]*x^(5-i) for i in range(5)]
    terms += [second_coeffs[i]*x^(5-i) for i in range(5)]
    constant = -sum(term(x=solution) for term in terms)
    terms += [constant]
    equation = CheckIt.shuffled_equation(*terms)
    return {
        "data": {
            "equation": equation,
            "solution": solution,
        }
    }
