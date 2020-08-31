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

feedback.Success = 
feedback.NotEqual = 
feedback.NotExpr = La réponse doit être une expression mathématique.
feedback.NotRealOrInf = La réponse doit être un nombre réel ou $! +\infty !$ ou $! -\infty !$.
feedback.NotRSet = La réponse doit être un intervalle ou une réunion d'intervalles.
feedback.NotCplx = La réponse doit être un nombre complexe.
feedback.NotCplxCartesian = La réponse doit être un nombre complexe sous forme cartésienne.
feedback.NotCplxExponential = La réponse doit être un nombre complexe sous forme exponentielle.
feedback.NotSet = La réponse doit être un ensemble.
feedback.NotTuple = La réponse doit être un n-uplet (un vecteur ligne).
feedback.NotPoly = La réponse doit être un polynôme.
feedback.NotPhysical = La réponse doit être une valeur numérique suivie d'une unité physique.
feedback.PhysicalNotNumeric = La partie numérique doit être un nombre décimal.
feedback.WrongUnit = Mauvaise unité.
feedback.RSetNotDisjoint = Les ensembles de cette réunion ne sont pas disjoints. La réponse peut être simplifiée.
feedback.PolyNotExpanded = La réponse doit être un polynôme développé.
feedback.PolyNotFactorized = La réponse doit être un polynôme factorisé.
feedback.MatWrongSize = La matrice n'a pas la bonne taille.
feedback.NotRatSimp = L'expression peut encore être simplifiée.
feedback.Duplicates = Il y a des doublons dans l'ensemble.
feedback.UnauthorizedFunc = Votre réponse utilise des fonctions non-autorisées.
feedback_message.WrongForm = La réponse n'est pas sous la forme attendue.





