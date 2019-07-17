import psycopg2
import sys

def getconnection():
    global cnx
    if cnx:
        return cnx
    try:
        cnx = psycopg2.connect(dbname='magasin') 
        #on peut aussi passer en argument l'adresse de l'hôte, l'identifiant et le mot de passe
        print("La connexion est établie")
        return cnx
    except:
        print("La connexion a échoué")
        sys.exit(1)





cursor = cnx.cursor()
cnx.autocommit = True

#exécution de la requête
cursor.execute("SELECT prenom||' '||nom FROM client;")

#le cursor est un itérateur dont chaque élément est une des lignes de la réponse
#chaque résultat est un tuple dont l'arité est le nombre de colonnes de la réponse
for result in cursor:
	print(result[0])

#on ferme le curseur et la connexion
cursor.close()
cnx.close()

