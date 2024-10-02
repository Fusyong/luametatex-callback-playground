Thirddata = Thirddata or {}
local glyphs = nodes.nodecodes.glyph -- node.id("glyph")

-----------------------------
-- 
-- function Thirddata.processors_before(head)
--     print([[------processors_before-----]])
--     print(nodes.tosequence(head))
--     return head, true
-- end
-- --把函数挂载到processors回调的before小类
-- nodes.tasks.appendaction("processors", "before", "Thirddata.processors_before")
-- --[[
-- --]]
-- function Thirddata.processors_after(head)
--     print([[------processors_after-----]])
--     print(nodes.tosequence(head))
--     return head, true
-- end
-- nodes.tasks.appendaction("processors", "after", "Thirddata.processors_after")
-- --[[
-- 1. 字间加胶；
-- --]]

-----------------------------
-- 段落分行后回调

function Thirddata.finalizers_before(head)
    print([[------finalizers_before-----]])
    print(nodes.tosequence(head))
    return head, true
end
--把函数挂载到finalizers回调的before小类
nodes.tasks.appendaction("finalizers", "before", "Thirddata.finalizers_before")

function Thirddata.finalizers_after(head)
    print([[------finalizers_after-----]])
    print(nodes.tosequence(head))
    return head, true
end
nodes.tasks.appendaction("finalizers", "after", "Thirddata.finalizers_after")

-- -----------------------------

-- function Thirddata.shipouts_before(head)
--     print([[------shipouts_before-----]])
--     print(nodes.tosequence(head))
--     return head, true
-- end
-- --把函数挂载到shipouts回调的before小类
-- nodes.tasks.appendaction("shipouts", "before", "Thirddata.shipouts_before")

-- function Thirddata.shipouts_after(head)
--     print([[------shipouts_after-----]])
--     print(nodes.tosequence(head))
--     return head, true
-- end
-- nodes.tasks.appendaction("shipouts", "after", "Thirddata.shipouts_after")

-- -------------buildpage_filter----------------

-- function Thirddata.mvlbuilders_before(head)
--     print([[------mvlbuilders_before-----]])
--     print(nodes.tosequence(head))
--     return head, true
-- end
-- --把函数挂载到mvlbuilders回调的before小类
-- nodes.tasks.appendaction("mvlbuilders", "before", "Thirddata.mvlbuilders_before")

-- function Thirddata.mvlbuilders_after(head)
--     print([[------mvlbuilders_after-----]])
--     print(nodes.tosequence(head))
--     return head, true
-- end
-- nodes.tasks.appendaction("mvlbuilders", "after", "Thirddata.mvlbuilders_after")

-- -----------------------------

-- function Thirddata.vboxbuilders_before(head)
--     print([[------vboxbuilders_before-----]])
--     print(nodes.tosequence(head))
--     return head, true
-- end
-- --把函数挂载到vboxbuilders回调的before小类
-- nodes.tasks.appendaction("vboxbuilders", "before", "Thirddata.vboxbuilders_before")

-- function Thirddata.vboxbuilders_after(head)
--     print([[------vboxbuilders_after-----]])
--     print(nodes.tosequence(head))
--     return head, true
-- end
-- nodes.tasks.appendaction("vboxbuilders", "after", "Thirddata.vboxbuilders_after")

-- -----------------------------

-- function Thirddata.math_before(head)
--     print([[------math_before-----]])
--     print(nodes.tosequence(head))
--     return head, true
-- end
-- --把函数挂载到math回调的before小类
-- nodes.tasks.appendaction("math", "before", "Thirddata.math_before")

-- function Thirddata.math_after(head)
--     print([[------math_after-----]])
--     print(nodes.tosequence(head))
--     return head, true
-- end
-- nodes.tasks.appendaction("math", "after", "Thirddata.math_after")

-- -----------------------------

-- function Thirddata.pagebuilders_before(head)
--     print([[------pagebuilders_before-----]])
--     print(nodes.tosequence(head))
--     return head, true
-- end
-- --把函数挂载到pagebuilders回调的before小类
-- nodes.tasks.appendaction("pagebuilders", "before", "Thirddata.pagebuilders_before")

-- function Thirddata.pagebuilders_after(head)
--     print([[------pagebuilders_after-----]])
--     print(nodes.tosequence(head))
--     return head, true
-- end
-- nodes.tasks.appendaction("pagebuilders", "after", "Thirddata.pagebuilders_after")


-- print([[----回调列表--]])
-- local info = callback.list()
-- for i,c in pairs(info) do
--     print(i, c)
-- end
