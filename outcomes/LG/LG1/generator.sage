load("library/common.sage")

def generator():
    # statement
    qualifier = choice([
        "Every",
        "At least one",
        "Exactly one",
        "No",
        "Any",
    ])
    verb = choice([
        "is",
        "is not",
    ])
    subjective = choice([
        "is hard to solve for",
        "is easy to understand",
        "is fun to think about",
        "frustrates many students",
        "has fascinated mathematicians for years",
        "is used only in homework problems",
        "is studied widely by mathematicians",
        "may be asked about on the exam",
        "is featured in cutting-edge research",
        "would be publishable in the Proceedings journal",
    ])
    stemprop, prop = random_property_words(2)
    obj, = random_object_words(1)
    varx = var(random_letter())
    if choice([True,False]):
        stempprop = ""
    fake_stem = choice([
        "fake_sentence",
        "fake_open",
    ])
    sentences = [
        {"statement":True},
        {"open":True},
        {"neither":True},
    ]
    shuffle(sentences)
    return {
        "data": {
            "qualifier": qualifier,
            "stemprop": stemprop,
            "prop": prop,
            "obj": obj,
            "verb": verb,
            "subjective": subjective,
            "variable": varx,
            fake_stem: True,
            "sentences": sentences,
        }
    }
