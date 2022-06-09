#!/usr/bin/env python3
# coding: utf-8

import sys, json, jsonpickle
from sandboxio import get_context, buildsave
import langhandlers


if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               +"Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)
    
    # Reading + decoding input JSON
    with open(input_json, "r") as f:
        context = json.load(f)
    
    editor = CodeEditor()
    editor.theme = 'dark'
    editor.height = '500px'
    editor.language = 'python'

    # Builder stuff
    editor.codes = []
    for lang in langhandlers.get_available_languages():
        editor.codes.append({
            'language': lang,
            'code': langhandlers.get_base_code(lang)
        })
    
    context['editor'] = editor
    context['form'] = '{{editor|component}}'

    # Encoding + writing output JSON    
    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(context, unpicklable=False))
    
    sys.exit(0)
