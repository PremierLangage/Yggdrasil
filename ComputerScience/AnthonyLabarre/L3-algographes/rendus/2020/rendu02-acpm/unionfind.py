"""
Anthony Labarre © 2020.

Implémentation de la structure de données Union-Find, avec compression de
chemins."""


class UnionFind(object):
    """Implémentation de la structure de données Union-Find."""
    def __init__(self, ensemble):
        """Initialisation des structures de données nécessaires."""
        # self.parent[i] stocke le parent de i (égalité à la racine)
        self.parent = list(range(len(ensemble)))
        # affecter un identifiant unique à chaque élément au cas où l'on
        # recevrait autre chose que des entiers
        self.identifiants = {elem: i for i, elem in enumerate(ensemble)}
        # stocker les rangs de chaque élément, qui sont supérieurs ou égaux à
        # la profondeur de l'élément dans son arbre
        self.rang = [0] * len(ensemble)

    def find(self, element):
        """Renvoie le numéro de la classe à laquelle appartient l'élément."""
        # remonter dans le sous-arbre contenant l'élément jusqu'à sa racine
        racine = self.identifiants[element]
        elements_rencontres = set()
        while self.parent[racine] != racine:
            elements_rencontres.add(racine)
            racine = self.parent[racine]

        # compression du chemin element -> racine: tous les sommets de ce
        # chemin deviennent les descendants directs de la racine
        for id_elem in elements_rencontres:
            self.parent[id_elem] = racine

        return racine

    def union(self, premier, second):
        """Fusionne les classes contenant les deux éléments donnés."""
        # identifier les classes concernées
        racine_1, racine_2 = self.find(premier), self.find(second)
        if racine_1 == racine_2:
            return

        # placer l'arbre de rang inférieur sous la racine de l'autre; le rang
        # n'augmente donc que si les deux arbres sont de même rang, d'où les
        # trois cas
        if self.rang[racine_1] < self.rang[racine_2]:
            self.parent[racine_1] = racine_2
        elif self.rang[racine_2] < self.rang[racine_1]:
            self.parent[racine_2] = racine_1
        else:  # égalité, on tranche arbitrairement (racine_1 sous racine_2)
            self.parent[racine_2] = racine_1
            self.rang[racine_1] += 1


def unionfind_vers_collection(structure, univers):
    """Renvoie la partition représentée par la structure unionfind."""
    partition = dict()
    for elem in univers:
        classe = structure.find(elem)
        if classe not in partition:
            partition[classe] = set()
        partition[classe].add(elem)

    return {
        frozenset(classe) for classe in partition.values()
    }


def main():
    import doctest
    resultats_des_tests = doctest.testmod()
    if not resultats_des_tests.failed:
        print(
            "Les", resultats_des_tests.attempted, "tests se sont déroulés "
            "comme prévu."
        )


if __name__ == "__main__":
    main()


