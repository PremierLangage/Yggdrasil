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
    context = get_context()

    # Builder stuff
    editor = CodeEditor()
    editor.theme = 'dark'
    editor.height = '500px'
    editor.language = 'python'

    
    editor.codes = []
    for lang in langhandlers.get_available_languages():
        editor.codes.append({
            'language': lang,
            'code': langhandlers.get_base_code(lang)
        })
    
    context['editor'] = editor
    context['form'] = '{{editor|component}}'

    # Encoding + writing output JSON    
    buildsave(sys.argv[2], context)
    
    sys.exit(0)
