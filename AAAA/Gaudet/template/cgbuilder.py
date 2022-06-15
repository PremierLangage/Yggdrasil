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

    # add languages to the CodeEditor
    for lang in required_languages:
        context['editor'].codes.append({
            'language': lang,
            'code': langhandlers.get_base_code(lang)
        })

    # default language is first one in the list
    context['editor'].language = required_languages[0]

    # Execute 'before' script
    if 'before' in context:
        glob = {}
        exec(context['before'],context)
        exec("", glob)
        for key in glob:
            if key in context and context[key] == glob[key]:
                del context[key]
    else:
        print(("Builder 'before' need a script declared in the key 'before'. "
               + "See documentation related to this builder."),
              file = sys.stderr)
        sys.exit(1)

    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(context, unpicklable=False))
    
    sys.exit(0)
