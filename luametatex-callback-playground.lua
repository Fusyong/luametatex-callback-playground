userdata = userdata or {}
local glyphs = nodes.nodecodes.glyph -- node.id("glyph")
function userdata.processmystuff(head)
    context(nodes.tosequence(head))
    context.par()
    return head, true
end

--把`userdata.processmystuff`函数挂载到processors回调的normalizers类别中。
nodes.tasks.appendaction("processors", "after", "userdata.processmystuff")

nodes.tasks.disableaction("processors", "userdata.processmystuff")
nodes.tasks.disableaction("processors", "userdata.processmystuff")