# CSCK502-Assignment1

An example expert system written in Prolog for Assignment 1 of the Reasoning and Intelligent Systems module of the MSc in Artificial Intelligence, University of Liverpool.

The brief is to produce and expert system that would advise appropriate action based on diagnostic questions.

## Running the system
```
swipl advise_treatment.pl
```
SWI-Prolog will start and you will be greeted with text similar to this:
```
Welcome to SWI-Prolog (threaded, 64 bits, version 8.2.4)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit https://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).
```

At the '?' prompt, issue this command:
```
advise_action("Jim").
```
or 
```
advise_action("Jane").
```
or 
```
advise_action("Archibald"). 
```
You get the picture....

## Unit testing
This code comes with a set of tests, to execute run:

``` bash
$ swipl -g run_tests -t halt advise_treatment_tests.pl
```
