%%% Symptoms of the virus varied in severity from being asymptomatic to having more than one symptoms. 
%%% Most common symptoms were fever, persistent dry cough, and tiredness. 
%%% Less common symptoms were aches and pains, sore throat, diarrhoea, conjunctivitis, headache, anosmia/hyposmia 
%%% (total/partial loss of sense of smell and taste), and running nose. 
%%% Serious symptoms included difficulty breathing or shortness of breath, chest pain or feeling of chest pressure, loss of speech or movement. 
%%% People with serious symptoms needed to seek immediate medical attention, proceeding with an initial assessment call (no contacts) 
%%% to the doctor or health facility. People with mild symptoms had to manage their symptoms at home, without a doctor assessment. 
%%% Elderly people (above 70 year old) and those with pre-existent health conditions 
%%% (e.g. hypertension, diabetes, cardiovascular disease, chronic respiratory disease and cancer) were considered to be more at risk of developing severe symptoms. 
%%% Males in these groups also appeared to be at a slightly higher risk than females. 
%%% Most infected people developed mild to moderate illness and recovered without hospitalization.

%%%Provide a mechanism to get an input from the user
presents_symptom(Patient, Question)     :- format(Question, Patient),
                                        write(' [y/n] '),
                                        read(Code),
                                        nl,
                                        Code = 'y'.

%%% Age and gender risk rules
has_age_risk(Patient)   :- format('How old is ~w? ', Patient),
                        read(Age),
                        nl,
                        Age >= 70.

has_gender_risk(Patient)  :- format('What gender is ~w?', Patient),
                                    write(' [m/f] '),
                                    read(Gender),
                                    Gender = 'm'.

%other risk factors
%hypertension, diabetes, cardiovascular disease, chronic respiratory disease and cancer
has_hypertension_risk(Patient)   :- presents_symptom(Patient, 'Does ~w suffer from hypertension?').
has_diabete_risks(Patient)       :- presents_symptom(Patient, 'Does ~w suffer from diabetes?').
has_cardiovascular_risk(Patient) :- presents_symptom(Patient, 'Does ~w suffer from cardiovascular disease?').
has_crd_risk(Patient)            :- presents_symptom(Patient, 'Does ~w suffer from chronic respiratory disease?').
has_cancer_risk(Patient)         :- presents_symptom(Patient, 'Does ~w suffer from cancer?').

%%Risk assessment
assess_risk(Patient)    :- has_age_risk(Patient);
                        has_gender_risk(Patient);
                        has_hypertension_risk(Patient);
                        has_cardiovascular_risk(Patient);
                        has_crd_risk(Patient);
                        has_cancer_risk(Patient).

%% Symptom Rules

%%%Questions for serious symptoms
has_trouble_breathing(Patient)      :- presents_symptom(Patient, 'Does ~w have difficulty breathing or shortness of breath?').
has_chest_pain(Patient)             :- presents_symptom(Patient, 'Does ~w have chest pain or a feeling of chest pressure?').
has_loss_of_movement(Patient)       :- presents_symptom(Patient, 'Has ~w experienced any loss of speech or movement?').
has_high_temperature(Patient)       :- format('What is ~w''s temperature? ', Patient),
                                    read(Num),
                                    nl,
                                    Num >= 38.

%%%Questions for mild symptoms
has_dry_cough(Patient)            :- presents_symptom(Patient, 'Does ~w have a persistant dry cough?').
is_tired(Patient)                 :- presents_symptom(Patient, 'Does ~w experience tiredness?').
has_aches_pains(Patient)          :- presents_symptom(Patient, 'Does ~w experience aches and pains?').
has_sore_throat(Patient)          :- presents_symptom(Patient, 'Does ~w have a sore throat?').
has_diarrhoea(Patient)            :- presents_symptom(Patient, 'Does ~w have a runny or upset stomach?').
has_conjunctivitis(Patient)       :- presents_symptom(Patient, 'Does ~w have inflamation in the membrane of their eye?').
has_headache(Patient)             :- presents_symptom(Patient, 'Does ~w have a headache?').
has_anosmia(Patient)              :- presents_symptom(Patient, 'Is ~w experiencing a loss of smell and/or taste?').
has_runny_nose(Patient)           :- presents_symptom(Patient, 'Does ~w have a runny nose?').


%%Determine if the patient dispays at least one of the severe symptoms
has_severe_symptoms(Patient)       :- has_chest_pain(Patient);
                                    has_trouble_breathing(Patient);
                                    has_loss_of_movement(Patient);
                                    has_high_temperature(Patient).

%%Determine if the patient dispays at least one of the severe symptoms
has_mild_symptoms(Patient)  :-  has_dry_cough(Patient);
                            is_tired(Patient);
                            has_aches_pains(Patient);
                            has_sore_throat(Patient);
                            has_diarrhoea(Patient);
                            has_conjunctivitis(Patient);
                            has_headache(Patient);
                            has_anosmia(Patient);
                            has_runny_nose(Patient).

%%Advice predecate - if one or more severe symptom is reported
advise_severe_symptoms(Patient)     :- has_severe_symptoms(Patient),
                                    format(atom(Advice), '~w has severe symptoms and should consult a doctor immediately!', Patient),
                                    (
                                        write(Advice)
                                    ).
                            
%%Advice predecate - if one or more mild symptom is reported
advise_mild_symptoms(Patient)   :- has_mild_symptoms(Patient),
                                format(atom(Advice), '~w has mild symptoms and can manage their symptoms at home', Patient),
                                (
                                    write(Advice)
                                ).

%%Advice predecate - if no symptoms are reported
advise_no_symptoms(Patient)   :- assess_risk(Patient), 
                                    format(atom(Advice), '~w does not present any symptoms but presents significant risk factors', Patient),
                                    (
                                        write(Advice)
                                    );
                                format(atom(Advice), '~w does not present any symptoms.', Patient),
                                (
                                    write(Advice)
                                ).

%%Advice predecate - composition of the three specific advice predecates
has_symptoms(Patient)           :-  advise_severe_symptoms(Patient);
                                advise_mild_symptoms(Patient);
                                advise_no_symptoms(Patient).

%%Entrypoint predecate.
advise_action(Patient)          :-  has_symptoms(Patient).