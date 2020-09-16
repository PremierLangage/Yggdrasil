# Imports ---------------------------------------------------------------------
import os
import random
from importlib import import_module
from platform import system
from random import choice, randint
from string import ascii_lowercase
from subprocess import check_call
from traceback import format_exc

import networkx as nx

# Variables globales ----------------------------------------------------------
PAD = " " * 6  # la taille de "[ ? ]" + un espace
SIGN = ["[ \033[1;31mx\033[0m ]", "[ \033[1;32mv\033[0m ]"]
if system() == "Windows":
    SIGN = ["[ x ]", "[ v ]"]


# ----- Instances pour les tests (listes d'arêtes) ----------------------------
PRIM_INSTANCE_COURS =  [
    (10, 11, 5), (10, 13, 4), (10, 14, 2), (11, 14, 2), (12, 13, 9), 
    (12, 15, 5), (13, 14, 3), (13, 15, 7), (13, 16, 4), (14, 16, 7), 
    (15, 16, 12)
]

PRIM_INSTANCE_TD = [
    (17, 18, 4), (17, 20, 3), (17, 21, 1), (17, 22, 8), (18, 19, 7), 
    (18, 20, 2), (18, 21, 3), (19, 21, 8), (19, 22, 5), (19, 23, 4), 
    (20, 21, 6), (21, 22, 9), (21, 23, 6), (22, 23, 2)
]


# Fonctions diverses ----------------------------------------------------------
def charger_module_etudiant(chemin, correction_deja_tentee=False):
    """Charge et renvoie le module spécifié."""
    try:
        return import_module(chemin)
    except TabError:
        print(
            "\nImpossible de charger le module de l'étudiant à cause d'un "
            "mélange de tabulations et d'espaces", end=""
        )
        if correction_deja_tentee:
            print(
                ", même après tentative de correction automatique par autopep8"
            )
            exit(-1)

        if which("autopep8"):
            reponse = prompt(
                ".\n\tJ'ai détecté autopep8, voulez-vous que je tente de corriger "
                "le fichier automatiquement?", ["o", "n"]
            )
            if reponse == "o":
                correction_autopep8(chemin + ".py")
                return charger_module_etudiant(chemin, True)

        else:
            print("; réglez le problème et relancez-moi ensuite.\n")

        exit(-1)
    except IndentationError:
        print(
            "\nImpossible de charger le module de l'étudiant à cause d'une "
            "erreur d'indentation."
        )
        montrer_derniere_erreur()
        exit(-1)
    except SyntaxError:
        print(
            "\nImpossible de charger le module de l'étudiant à cause d'une "
            "erreur de syntaxe."
        )
        montrer_derniere_erreur()
        exit(-1)


def correction_autopep8(fichier):
    """Copie fichier vers fichier.BAK et tente de corriger automatiquement ce
    qui peut l'être via autopep8."""
    print("\tCopie de", fichier, "vers", fichier + ".BAK")
    print("\tCorrection de", fichier, "par autopep8")
    check_call(["autopep8", "-i", fichier])


def montrer_derniere_erreur():
    """Affiche la dernière erreur qui s'est produite lors de l'exécution du
    code de l'étudiant."""
    print("\n" + PAD + format_exc().replace("\n", "\n      "))


def nom_aleatoire(num_lettres=8):
    """Renvoie une chaîne aléatoire de num_lettres lettres ASCII minuscules."""
    return "".join(choice(ascii_lowercase) for _ in range(num_lettres))


def prompt(question, choices, separator="/"):
    """Keeps asking user a question until one of the choices can be
    returned."""
    answer = ''
    message = ' '.join([question, (separator.join(choices)).join('[]'), ''])

    while answer not in choices:
        answer = input(message)

    return answer


def which(programme):
    """Renvoie True SSI programme est trouvable via la variable PATH."""
    # (stackoverflow.com/questions/377017/test-if-executable-exists-in-python)
    def is_exe(chemin_exec):
        """Vérifie que chemin_exec existe et est exécutable."""
        return os.path.isfile(chemin_exec) and os.access(chemin_exec, os.X_OK)

    fpath = os.path.split(programme)[0]
    if fpath and is_exe(programme):
        return True

    for path in os.environ["PATH"].split(os.pathsep):
        if is_exe(os.path.join(path, programme)):
            return True

    return False


def feedback(fonctions_problematiques):
    """Résumé des problèmes du module testé."""
    print("\nRésumé :")
    print("========\n")
    for key in fonctions_problematiques:
        fonctions_problematiques[key].discard("fonction_bidon")

    if fonctions_problematiques["manquantes"]:
        pretty_print(
            "introuvables: " +
            ", ".join(sorted(fonctions_problematiques["manquantes"])), False
        )

    if fonctions_problematiques["plantent"]:
        pretty_print(
            "provoquent des exceptions: " +
            ", ".join(sorted(fonctions_problematiques["plantent"])), False
        )

    if fonctions_problematiques["fausses"]:
        pretty_print(
            "donnent des résultats faux: " +
            ", ".join(sorted(fonctions_problematiques["fausses"])), False
        )

    if "non récursives" in fonctions_problematiques and fonctions_problematiques["non récursives"]:
        pretty_print(
            "les fonctions suivantes ne sont pas récursives: " +
            ", ".join(sorted(fonctions_problematiques["non récursives"])),
            False
        )

    if "récursivité infinie" in fonctions_problematiques and fonctions_problematiques["récursivité infinie"]:
        pretty_print(
            "les fonctions récursives suivantes sont infinies dans certains "
            "cas: " + ", ".join(
                sorted(fonctions_problematiques["récursivité infinie"])
            ), False
        )

    print()


# Fonctions en rapport avec des graphes ---------------------------------------

def poids_fcpm(liste_aretes_ponderees):
    """Renvoie le poids d'une forêt couvrante de poids minimum pour le graphe
    dont les arêtes pondérées sont données en paramètre sous la forme d'une
    liste de triplets au format (u, v, poids)."""
    graphe = nx.Graph()
    graphe.add_weighted_edges_from(liste_aretes_ponderees)
    return sum(
        graphe[u][v]['weight']
        for u, v in nx.algorithms.tree.minimum_spanning_tree(
            graphe, algorithm='prim'
        ).edges()
    )


# ----- Classification --------------------------------------------------------
def est_arbre(graphe):
    """Renvoie True si le graphe non orienté donné est un arbre, False
    sinon. graphe peut être de n'importe quel type implémentant:

        aretes(): renvoie un itérable d'arêtes sous la forme de tuples dont les
                  deux premiers éléments sont les extrémités de l'arête
    """
    # la compréhension ci-dessous sert à ignorer les poids et les autres
    # attributs éventuels
    return nx.is_tree(nx.Graph([(u, v) for u, v, *_  in graphe.aretes()]))


def est_arbre_couvrant(arbre, graphe):
    """Renvoie True si l'arbre passé en paramètre est un arbre et couvre bien
    tous les sommets du graphe, False sinon. graphe peut être de n'importe quel
    type implémentant:

        aretes():  renvoie un itérable d'arêtes sous la forme de tuples dont les
                   deux premiers éléments sont les extrémités de l'arête
        sommets(): renvoie un itérable des sommets du graphe

    """
    return est_arbre(arbre) and set(arbre.sommets()) == set(graphe.sommets())


def est_foret(graphe):
    """Renvoie True si le graphe non orienté donné est une forêt, False
    sinon. graphe peut être de n'importe quel type implémentant:

        aretes(): renvoie un itérable d'arêtes sous la forme de tuples dont les
                  deux premiers éléments sont les extrémités de l'arête
    """
    return all(
        nx.is_tree(composante) for composante in nx.connected_components(
            nx.Graph([(u, v) for u, v, *_  in graphe.aretes()])
        )
    )

def est_foret_couvrante(foret, graphe):
    """Renvoie True si l'arbre passé en paramètre est un arbre et couvre bien
    tous les sommets du graphe, False sinon."""
    # calculer les composantes connexes de la foret et du graphe
    '''
    composantes_foret = nx.connected_component_subgraphs(
        nx.Graph([(u, v) for u, v, *_  in foret.aretes()])
    )
    '''
    foret_nx = nx.Graph([(u, v) for u, v, *_  in foret.aretes()])
    composantes_foret = [
        foret_nx.subgraph(c) for c in nx.connected_components(foret_nx)
    ]
    
    '''
    composantes_graphe = nx.connected_component_subgraphs(
        nx.Graph([(u, v) for u, v, *_  in graphe.aretes()])
    )
    '''
    graphe_nx = nx.Graph([(u, v) for u, v, *_  in graphe.aretes()])
    composantes_graphe = [
        graphe_nx.subgraph(c) for c in nx.connected_components(graphe_nx)
    ]


    # calculer l'association entre les composantes (pas du tout efficace,
    # suffira pour l'instant)
    association = dict()
    for arbre in composantes_foret:
        # choisir un sommet aléatoire de l'arbre, qu'on cherchera dans les
        # composantes du graphe pour faire le lien entre les deux
        sommet = random.choice(list(arbre))
        for composante in composantes_graphe:
            if sommet in composante.nodes():
                association[arbre] = composante
                break

    # vérifier que tous les sommets sont couverts
    difference = set(graphe.sommets()).difference(foret.sommets())
    if difference:
        print("les sommets suivants ne sont pas couverts: " + str(sorted(difference)))
        return False

    # une fois l'association réalisée, vérifier que chaque arbre couvre bien
    # pour sa composante
    resultat = True
    for arbre, composante in association.items():
        if not nx.is_tree(arbre):
            print("le sous-graphe contenant les sommets " + str(arbre.nodes()) + " n'est pas un arbre")
            resultat = False
        if arbre.nodes() != composante.nodes():
            print("le sous-graphe contenant les sommets " + str(arbre.nodes()) + " ne couvre pas la composante contenant les sommets " + str(composante.nodes()))

    return resultat


# ----- Générateurs -----------------------------------------------------------
def graphe_connexe_aleatoire(nb_sommets, proba_arete=0.5):
    """
    Renvoie un graphe connexe aléatoire non orienté sur nb__sommets sommets,
    où chaque arête est rajoutée avec une probabilité proba_arete.

    :param nb_sommets:
    :param proba_arete:
    :return:
    """
    graphe = nx.generators.fast_gnp_random_graph(nb_sommets, proba_arete)

    while not nx.is_connected(graphe):
        graphe = nx.generators.fast_gnp_random_graph(nb_sommets, proba_arete)

    return graphe


def graphe_connexe_aleatoire_pondere(nb_sommets, poids_max = 50, proba_arete=0.5):
    """
    Renvoie un graphe connexe aléatoire non orienté sur nb__sommets sommets,
    où chaque arête est rajoutée avec une probabilité proba_arete.

    :param nb_sommets:
    :param proba_arete:
    :return:
    """
    graphe = nx.Graph()
    graphe.add_weighted_edges_from(
        (u, v, randint(1, poids_max))
        for u, v in graphe_connexe_aleatoire(nb_sommets, proba_arete).edges()
    )

    return graphe


def aretes_ponderees(graphe):
    """Renvoie les aretes du graphe munies de leur poids (networkx ne permet
    apparemment pas de le faire directement)."""
    return [(u, v, graphe[u][v]['weight']) for u, v in graphe.edges()]













