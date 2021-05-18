:- consult(advise_treatment).

:- begin_tests(advise_treatment).

test(has_severe_symptoms_positive) :- 
        see('testdata/input_has_severe_symptoms_positive.dat'),
        has_severe_symptoms('TestUser'),
        seen.

test(has_severe_symptoms_negative) :- 
        see('testdata/input_has_severe_symptoms_negative.dat'),
        \+ has_severe_symptoms('TestUser'),
        seen.

:- end_tests(advise_treatment).