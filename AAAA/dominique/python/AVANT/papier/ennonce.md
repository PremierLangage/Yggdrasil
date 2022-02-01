Les elfes manquent de papier d'emballage et doivent donc en commander davantage. Ils ont une liste des dimensions (longueur l, largeur l et hauteur h) de chaque cadeau et veulent seulement commander exactement ce dont ils ont besoin.

Heureusement, chaque cadeau est une boîte (un parfait prisme rectangulaire droit), ce qui facilite un peu le calcul du papier d'emballage requis pour chaque cadeau : trouvez la surface de la boîte, qui est de 2*l*l + 2*l*h + 2*h*l. Les lutins ont aussi besoin d'un peu de papier supplémentaire pour chaque cadeau : la zone du plus petit côté.

Par example:
 
    Un cadeau de dimensions 2x3x4 nécessite 2*6 + 2*12 + 2*8 = 52 décimètre carrés de papier d'
    emballage plus 6 décimètre carrés de mou, pour un total de 58 décimètre carrés.
    Un cadeau de dimensions 1x1x10 nécessite 2*1 + 2*10 + 2*10 = 42 décimètre carrés de papier d'
    emballage plus 1 décimetre carré de mou, pour un total de 43 décimètre carrés.
    
Tous les nombres de la liste des elfes sont en décimètre. Combien de décimètre carrés de papier d'emballage doivent-ils commander ?

pour vous aider il y a un fichier "exemple" pour lequel la réponce est 1588178. Vous pouvez par ecrire : 

    def Question1():
        total=0
        with open("exemple","r") as f:
            ...# votre code 
            total += 

        print(total) 

Cela devrai afficher 1588178

Vous devez écrire une fonction Question1() qui lit le fichier "data" avec les données et qui retourne le nombre de décimètre carrées néccessaire pour embaler les cadeau du fichier data.

-------
Les elfes sont également à court de ruban. Le ruban a la même largeur,
 ils n'ont donc qu'à se soucier de la longueur dont ils ont besoin pour commander, qu'ils aimeraient à nouveau être exacte.

Le ruban requis pour emballer un cadeau est la distance la plus courte autour de ses côtés, soit le périmètre du plus petit coté.
Chaque cadeau nécessite également un arc fait de ruban; les décimètres de ruban requis pour l'arc parfait sont égaux aux décimètres cubes de volume du présent.
Ne demandez pas comment ils attachent l'arc, cependant; ils ne le diront jamais.

Par example:

    Un cadeau de dimensions 2x3x4 nécessite 2+2+3+3 = 10 décimètres de ruban pour envelopper
    le cadeau plus 2*3*4 = 24 décimètres de ruban pour l'arc, pour un total de 34 décimètres.
    Un cadeau de dimensions 1x1x10 nécessite 1+1+1+1 = 4 décimètres de ruban pour envelopper
    le cadeau plus 1*1*10 = 10 décimètres de ruban pour l'arc, pour un total de 14 décimètres.

Combien de décimètres de ruban au total doivent-ils commander ? 

pour le fichier "exemple" la solution est 3783758. 

Vous devez écrire une fonction Question2() qui lit le fichier data avec les données et qui retourne le nombre de décimètre de ruban
 néccessaire pour embaler les cadeaux du fichier data.

