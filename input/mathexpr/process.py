import re

def process_config(config,name):
    pass

def process_answer(answer,name,config):
    config['value']=re.escape(answer[name])


