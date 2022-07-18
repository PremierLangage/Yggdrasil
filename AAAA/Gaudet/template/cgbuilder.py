# Date : 16/06/2022
# Auteur : Clément Gaudet

# Builder pour les templates cgbasic et cginteractive

#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle
from sandboxio import get_context
import langhandlers

if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    output_json = sys.argv[2]
    
    context = get_context()
    
    context['editor'].codes = []
    available_languages = langhandlers.get_available_languages()

    # get required language, if none then all languages proposed by default
    if context['languages'].strip() == '':
        required_languages = available_languages
    else:
        required_languages = context['languages'].split('\n')
        required_languages = list(map(lambda s: s.lower(), required_languages))

    # add languages to the CodeEditor
    for lang in required_languages:
        context['editor'].codes.append({
            'language': lang,
            'code': langhandlers.get_base_code(lang)
        })
    context['editor'].language = required_languages[0]
    if 'solution' in context:
        context['editor'].codes.append({'language': "debug",
                'code': context['solution']
        })
    # Execute 'before' script if it's set
    if 'before' in context:
        glob = {}
        exec(context['before'], context)

        # Remove keys related to general execution context
        exec("", glob)
        for key in glob:
            if key in context and context[key] == glob[key]:
                del context[key]

    # save json
    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(context, unpicklable=False))
    
    sys.exit(0)
