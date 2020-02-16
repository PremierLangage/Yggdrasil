extends = /template/basicinput.pl

input.type = number

title = Addition

before ==
import random as rd
a=rd.randint(10,20)
b=rd.randint(10,20)
==

text ==
Calculer {{a}} + {{b}}.
            <ion-header class="app-header">
    <ion-toolbar>
        <div class="app-title">
            <span>Premier Langage</span>
            <span class='app-version'>0.7.4</span>
        </div>
        <nav class="app-nav ion-hide-sm-down">
            <ion-buttons>
                <ion-button id="header-courses" class="app-nav-link" href="/">
                    <i class="app-nav-icon fas fa-graduation-cap"></i>Cours
                </ion-button>
                
                <ion-button id="header-editor" class="app-nav-link" href="/editor/">
                    <i class="app-nav-icon fas fa-cloud"></i>Editeur
                </ion-button>
                <ion-button id="header-ask" class="app-nav-link" href="/ask/">
                    <i class="app-nav-icon fas fa-question-circle"></i>Faq
                </ion-button>
                <ion-button id="header-documentation" class="app-nav-link" href="https://documentationpl.readthedocs.io/fr/latest/" target="_blank">
                    <i class="app-nav-icon fas fa-book"></i>Documentation
                </ion-button>
                
                
            </ion-buttons>
            <div class="app-spacer"></div>
            <ion-buttons>
                
                <ion-button class="app-nav-link" href="/profile/">
                    <i class="app-nav-icon fas far fa-user-circle"></i>
                    David DOYEN
                </ion-button>
                <ion-button class="app-nav-link" href="/activity/logout/">
                    <i class="app-nav-icon fas fa-power-off fa-lg"></i>
                </ion-button>
                
            </ion-buttons>
        </nav>
        <ion-buttons class="ion-hide-md-up" slot="end">
                
                <ion-button class="app-nav-link" href="/profile/">
                    <i class="app-nav-icon fas far fa-user-circle"></i>
                    David DOYEN
                </ion-button>
                
            <ion-button onclick="toggleHeaderNav()">
                <ion-icon slot="icon-only" name="menu"></ion-icon>
            </ion-button>
        </ion-buttons>
    </ion-toolbar>
</ion-header>
==

evaluator ==
try:
    if int(input.value)==a+b:
        grade=(100,"")
    else:
        grade=(0,"%d + %d = %d" % (a,b,a+b))
except:
    grade=(-1,"Votre réponse n'est pas un nombre entier.")
==




