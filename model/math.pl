extends = basic.pl

@ /model/serialization/JSONEncoder.py [json_encoder.py]
@ /model/jinja_env/jinja_env_math.pl [jinja_env.py]
@ /model/serialization/serialize_sympy.py [serialize2.py]
@ /model/namespace/namespace_math.py [namespace.py]
@ /utils/sympy/evalsympy.py
@ /utils/sympy/latex2sympy.py
@ /utils/sympy/sympy2latex.py
@ /utils/sympy/randsympy.py
@ /utils/graphics/plmpl.py
@ /utils/plrandom.py
@ /utils/keyboards.JSON [keyboards.JSON]
@ /utils/components/jsxgraph.py [customjsxgraph.py]
@ /utils/components/mathmatrix.py [custommathmatrix.py]

message.Success = 
message.NotEqual = 
message.NotExpr = La réponse doit être une expression mathématique.
message.NotFrac = La réponse doit être une fraction.
message.NotRealOrInf = La réponse doit être un nombre réel ou $! +\infty !$ ou $! -\infty !$.
message.NotRSet = La réponse doit être un intervalle ou une réunion d'intervalles.
message.NotCplx = La réponse doit être un nombre complexe.
message.NotCplxCartesian = La réponse doit être un nombre complexe sous forme cartésienne.
message.NotCplxExponential = La réponse doit être un nombre complexe sous forme exponentielle.
message.NotSet = La réponse doit être un ensemble.
message.NotTuple = La réponse doit être un n-uplet (un vecteur ligne).
message.NotPoly = La réponse doit être un polynôme.
message.NotPhysical = La réponse doit être une valeur numérique suivie d'une unité physique.
message.PhysicalNotNumeric = La partie numérique doit être un nombre décimal.
message.WrongUnit = Mauvaise unité.
message.RSetNotDisjoint = Les ensembles de cette réunion ne sont pas disjoints. La réponse peut être simplifiée.
message.PolyNotExpanded = La réponse doit être un polynôme développé.
message.PolyNotFactorized = La réponse doit être un polynôme factorisé.
message.MatWrongSize = La matrice n'a pas la bonne taille.
message.NotRatSimp = L'expression peut encore être simplifiée.
message.Duplicates = Il ya des doublons dans l'ensemble.
message.UnauthorizedFunc = Votre réponse utilise des fonctions non-autorisées.
message.NotChainIneq = La réponse doit être un encadrement.
message.WrongIneq =
message.WrongBounds =






