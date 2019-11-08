


def newDropList(name,content)
    for iname,icontent in zip(name,content):
        name=f"drag{i}"
        locals()[iname] = DragDrop()
        locals()[iname].content = icontent
        drag.append(locals()[iname])
