
"""
            questions.append({'type': question_type, 
            'text': statement, 
            'items': items, 
            'index': index, 
            'options': options,
            'extended': extended
            })
"""


def buildquestion(question):
    """
    Question 

    """
    if question.get('extended') == False:
        return question
    if question.get('type') == 'Radio':
        
