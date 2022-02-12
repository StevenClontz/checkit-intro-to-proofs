load("library/common.sage")

def generator():
    return {
        "data": random_set_conditional(allow_subtraction=True)
    }