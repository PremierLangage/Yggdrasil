import re
import pathlib

doc = "Commande qui regarde dans le répertoire courrant et les sous dossiers si il existe un fichier .py qui contient le motif passé en parametre"

def run(dir, exp, extension=".py"):
    for file in dir.iterdir():  # Pour chaque fichier dans le répertoire courrant
        if file.is_dir():
            run(file, exp)
        else:
            if not file.name.endswith(extension):
                continue
            with open(dir / file, "r") as f:  # Ouvre le fichier en lecture seule
                result = exp.findall(f.read())  # Si le motif est trouvé
                if result != None:
                    print("found", file.name)  # Affiche le nom du fichier
                    print(result)

if __name__ == "__main__":
    exp =  re.compile(input("Motif à rechercher : "))
    run(pathlib.Path.cwd(),exp)


