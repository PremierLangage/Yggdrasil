


def raiseifabsent(name, comment,dic):
    if not name in dic:
        raise Exception(" Missing variable :"+name+comment+"\n"+str(dic))


def additems(group, listitem, step):
    group.items = []
    for num,item in enumerate(listitem) :
        group.items.append({
            "id": f"crit{step}_{num}",
            "content": item
        })
    return group
    

    