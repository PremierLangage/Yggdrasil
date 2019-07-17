
import sqlite3

def runsql(commande, conn=None ):
    if not conn:
        conn=sqlite3.connect('example.db')
    # creation du résultat 
    try:
        s= [ x for x  in conn.execute(commande)]
    except OperationalError as  msg:
        print( " Erreur de commande SQL: "+ msg, file=sys.err)
        grade=(0," modifier votre proposition"+msg)
    except  Exception as e:
        print( "Exception pendant l'execution de SQL "+str( msg), file=sys.err)
        grade=(0," modifier votre proposition"+msg)
    return str(s)

def buildtest(soluce,studentsql):
    return """>>> runsql({})\n{}\n""".format(student,runsql(soluce))

