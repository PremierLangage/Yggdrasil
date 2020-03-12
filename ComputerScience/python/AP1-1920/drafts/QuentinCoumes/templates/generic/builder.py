#!/usr/bin/env python3
# coding: utf-8

import sys, jsonpickle
import sandboxio


class BuilderError(Exception):
    pass


if __name__ == "__main__":
    if len(sys.argv) < 3:
        msg = ("Sandbox did not call builder properly:\n"
               "Usage: python3 builder.py [input_json] [output_json]")
        print(msg, file=sys.stderr)
        sys.exit(1)

    context = sandboxio.get_context()

    if 'before' in context:
        glob = {}
        context['BuilderError'] = BuilderError
        try:
            exec(context['before'], context)
        except BuilderError as e:
            print(e, file=sys.stderr)

    output_json = sys.argv[2]
    with open(output_json, "w+") as f:
        f.write(jsonpickle.encode(context, unpicklable=False))
