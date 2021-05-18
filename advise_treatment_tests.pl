:- consult(advise_treatment).

:- begin_tests(advise_treatment).
%test the has_severe_symptoms predicate with one positive symptom
test(has_severe_symptoms_positive) :- 
        see('testdata/input_has_severe_symptoms_positive.dat'),
        has_severe_symptoms('TestUser'),
        seen.

%test the has_severe_symptoms predicate with no positive symptoms
test(has_severe_symptoms_negative) :- 
        see('testdata/input_has_severe_symptoms_negative.dat'),
        \+ has_severe_symptoms('TestUser'),
        seen.

%test the has_mild_symptoms predicate with one positive symptom
test(has_mild_symptoms_positive) :- 
        see('testdata/input_has_mild_symptoms_positive.dat'),
        has_mild_symptoms('TestUser'),
        seen.


%test the has_mild_symptoms predicate with one positive symptom
test(has_mild_symptoms_negative) :- 
        see('testdata/input_has_mild_symptoms_negative.dat'),
        \+ has_mild_symptoms('TestUser'),
        seen.

%full test - user has one severe symptom
test(advise_action_01):- 
        see('testdata/advise_action_01.dat'),
        advise_action('TestUser'),
        seen.

%full test - user has no severe symptoms, and one mild
test(advise_action_01):- 
        see('testdata/advise_action_02.dat'),
        advise_action('TestUser'),
        seen.


%full test - user has no symptoms, but has risk factors
test(advise_action_01):- 
        see('testdata/advise_action_03.dat'),
        advise_action('TestUser'),
        seen.

%full test - user has no symptoms, and has no risk factors
test(advise_action_01):- 
        see('testdata/advise_action_04.dat'),
        advise_action('TestUser'),
        seen.
:- end_tests(advise_treatment).
