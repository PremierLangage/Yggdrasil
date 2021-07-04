extends = /model/basic/temp.pl

@ /builder/before1.py [builder.py]
@ /grader/evaluator1.py [grader.py]
@ /utils/builderlib.py
@ /utils/plrandom.py
@ /utils/plcsv.py
@ /model/basic/jinja_basic.py [jinja_env.py]
@ /model/basic/json_basic.py [json_encoder.py]

before_scripts % ["importfunc", "before", "process"]
eval_scripts % ["getans", "evaluator", "evalprocess"]

importfunc == #|python|
from random import choice, choices, sample, shuffle
from plrandom import randint, sampleint
from plcsv import csv_choice, csv_sample, csv_col
==

title =
form = 
text = 

tplpage =@ template.html

style.basic == #|css|
<style>
.icon-check-after p::after {
    font-family: "Font Awesome 5 Free";
    color: green;
    margin-left: 1em;
    content: "\f00c";
    vertical-align: middle;
    font-weight: 900;
}

.icon-times-after p::after {
    font-family: "Font Awesome 5 Free";
    color: crimson;
    margin-left: 1em;
    content: "\f00d";
    vertical-align: middle;
    font-weight: 900;
}

.icon-check-before p::before {
    font-family: "Font Awesome 5 Free";
    color: green;
    margin-right: 1em;
    content: "\f00c";
    vertical-align: middle;
    font-weight: 900;
}

.icon-times-before p::before {
    font-family: "Font Awesome 5 Free";
    color: crimson;
    margin-right: 1em;
    content: "\f00d";
    vertical-align: middle;
    font-weight: 900;
}

.btn-audio::before {
    font-family: "Font Awesome 5 Free";
    color: white;
    content: "\f028";
    vertical-align: middle;
    font-weight: 900;
}

.error-text-unit {
    background-color: #f2dede;
    color: #a94442;
    text-decoration: line-through #a94442;
}

.success-text-unit {
    background-color: #dff0d8;
    color: #3c763d;
}

.missed-text-unit {
    color: #3c763d;
    text-decoration: underline wavy #3c763d;
}

.highlight-state {
    color: var(--brand-color-primary);
    background-color: #cce5ff;
}

.question p {
    font-size: 16px;
    font-weight: 500;
}

.question {
    font-size: 16px;
    font-weight: 500;
}

hr.divide {
  background-color: lightgray;
  height: 0.5px;
  border: 0;
}

.mat-form-field-wrapper{
  margin: 0 !important;
  padding-bottom: 0 !important;
}

.mat-form-field-appearance-outline .mat-form-field-infix {
    padding-top: 0.8em !important;
    padding-bottom: 0.6em !important;
}

.mat-form-field-suffix {
    top: 0 !important;
    padding-top: 0.8em !important;
    padding-bottom: 0.6em !important;
}

.img {
    margin-top: 0.5em;
    margin-bottom: 0.5em;
    height: auto;
    margin-left: auto;
    margin-right:auto;
}

.img-60 {
    max-width: 60%;
}
.img-50 {
    max-width: 50%;
}
.img-40 {
    max-width: 40%;
}

@media screen and (max-width: 768px) { /* css appliqué sur les tablettes */
    .img-60 {
        max-width: 80%;
    }
    .img-50 {
        max-width: 70%;
    }
    .img-40 {
        max-width: 60%;
    }
}

@media screen and (max-width: 576px) { /* css appliqué sur les téléphones */
    .img-60 {
        max-width: 100%;
    }
    .img-50 {
        max-width: 90%;
    }
    .img-40 {
        max-width: 80%;
    }
}


@media screen and (max-width: 768px) { /* css appliqué sur les tablettes */
    .img-40 {
        max-width: 60%;
        height: auto;
        margin: auto;
    }
}

@media screen and (max-width: 576px) { /* css appliqué sur les téléphones */
    .img-40 {
        max-width: 80%;
        height: auto;
        margin: auto;
    }
}
</style>
==