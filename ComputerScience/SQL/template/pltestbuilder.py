
import sqlite3
import sys


def runsql(commande, conn=None ):
    if not conn:
        conn=sqlite3.connect('example.db')
    # creation du résultat 
    try:
        s= [ x for x  in conn.execute(commande)]
    except OperationalError as  msg:
        print( " Erreur de commande SQL: "+ msg, file=sys.err)
        return (0," modifier votre proposition"+msg)
    except  Exception as e:
        print( "Exception pendant l'execution de SQL "+str( msg), file=sys.err)
        return (0," modifier votre proposition"+msg)
    return str(s)


def buildpltest(soluce, student):
    def preparepltest(soluce,student):
    s=runsql(soluce)
    return """>>> runsql({})\n{}\n""".format(student,s)

