


def raiseifabsent(name, comment=" variable obligatoire"):
    if not name in globals():
        raise Exception(" Missing variable :"+name+comment)


def additems(group, listitem, step):
    group.items = []
    for num,item in enumerate(listitem) :
        group.items.append({
            "id": f"crit{step}_{num}",
            "content": item
        })
    return group
    