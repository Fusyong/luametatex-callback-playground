Thirddata = Thirddata or {}
Thirddata.watch = Thirddata.watch or {}

local glue_id = nodes.nodecodes.glue --node.id("glue")
local glyph_id = nodes.nodecodes.glyph
local hlist_id = nodes.nodecodes.hlist
local penalty_id = nodes.nodecodes.penalty

---[[
local function show_detail(n, label) 
    print(">>>>>>>>>"..label.."<<<<<<<<<<")
    print(nodes.toutf(n))
    for i in node.traverse(n) do
        local char
        if i.id == glyph_id then
            char = utf8.char(i.char)
            print(i, char)
        elseif i.id == penalty_id then
            print(i, i.penalty)
        elseif i.id == glue_id then
            print(i, i.width, i.stretch, i.shrink)
        elseif i.id == hlist_id then
            print(i, nodes.toutf(i.list))
        else
            print(i)
        end
    end
end
--]]



function Thirddata.watch.processors_before(head)
    show_detail(head,"processors_before")
-- 仅限单用标点：标点与字间加空
-- 左开标点
-- <node :    nil <=   2265 =>   2353 : par vmodepar>
-- <node :   2265 <=   2353 =>   2531 : glue indentskip>   2622000 0       0
-- <node :   2353 <=   2531 =>   2543 : glyph unset>       标
-- <node :   2531 <=   2543 =>   2555 : glyph unset>       标
-- <node :   2543 <=   2555 =>   2318 : glyph unset>       ‘
-- <node :   2555 <=   2318 =>   2567 : glue spaceskip>    327750  163875  109250
-- <node :   2318 <=   2567 =>   2579 : glyph unset>       标
-- <node :   2567 <=   2579 =>   2253 : glyph unset>       “
-- <node :   2579 <=   2253 =>   2591 : glue spaceskip>    327750  163875  109250
-- ...

-- 右关标点，同前
-- 结束标点，同前
-- 破折号，省略号同前
    return head, true
end

function Thirddata.watch.processors_after(head)
    show_detail(head,"processors_after")
-- 左开标点
-- <node :    nil <=   2265 =>   2353 : par vmodepar>
-- <node :   2265 <=   2353 =>   2531 : glue indentskip>   2622000 0       0
-- <node :   2353 <=   2531 =>   2469 : glyph unset>       标
-- <node :   2531 <=   2469 =>   2543 : glue userskip>     0       655500  0
-- <node :   2469 <=   2543 =>    570 : glyph unset>       标
-- <node :   2543 <=    570 =>   2423 : penalty userpenalty>       10000
-- <node :    570 <=   2423 =>   2417 : glue userskip>     0       655500  0
-- <node :   2423 <=   2417 =>   2555 : glue userskip>     0       0       655500
-- <node :   2417 <=   2555 =>    609 : glyph unset>       ‘
-- <node :   2555 <=    609 =>   2318 : penalty userpenalty>       10000
-- <node :    609 <=   2318 =>   2567 : glue userskip>     0       655500  0
-- <node :   2318 <=   2567 =>    573 : glyph unset>       标
-- <node :   2567 <=    573 =>   2475 : penalty userpenalty>       10000
-- <node :    573 <=   2475 =>   2411 : glue userskip>     0       655500  0
-- <node :   2475 <=   2411 =>   2579 : glue userskip>     0       0       655500
-- <node :   2411 <=   2579 =>    606 : glyph unset>       “
-- <node :   2579 <=    606 =>   2253 : penalty userpenalty>       10000
-- <node :    606 <=   2253 =>   2591 : glue userskip>     0       655500  0
-- ...
-- <node :   2927 <=   2819 =>   2405 : glyph unset>       ｛
-- <node :   2819 <=   2405 =>    nil : glue spaceskip>    327750  163875  109250

-- 右关标点
-- <node :    nil <=   2371 =>   2989 : par vmodepar>
-- <node :   2371 <=   2989 =>   3025 : glue indentskip>   2622000 0       0
-- <node :   2989 <=   3025 =>   3397 : glyph unset>       标
-- <node :   3025 <=   3397 =>   3037 : glue userskip>     0       655500  0
-- <node :   3397 <=   3037 =>    669 : glyph unset>       标
-- <node :   3037 <=    669 =>   3403 : penalty userpenalty>       10000
-- <node :    669 <=   3403 =>   3049 : glue userskip>     0       655500  0
-- <node :   3403 <=   3049 =>   3061 : glyph unset>       ’
-- <node :   3049 <=   3061 =>   3067 : glue spaceskip>    327750  163875  109250
-- <node :   3061 <=   3067 =>    672 : glyph unset>       标
-- <node :   3067 <=    672 =>   3409 : penalty userpenalty>       10000
-- <node :    672 <=   3409 =>   3079 : glue userskip>     0       655500  0
-- <node :   3409 <=   3079 =>   3091 : glyph unset>       ”
-- <node :   3079 <=   3091 =>   3097 : glue spaceskip>    327750  163875  109250
-- ...
-- <node :   3490 <=   3379 =>   3391 : glyph unset>       ｝
-- <node :   3379 <=   3391 =>    nil : glue spaceskip>    327750  163875  109250

-- 结束标点，同前。`％`和`─`例外
-- 破折号，省略号同前

    return head, true
end

function Thirddata.watch.finalizers_before(head)
    if head.next then
        show_detail(head.next.head,"finalizers_before")
-- 左开标点
-- <node :    nil <=   2965 =>   2959 : glue lefthangskip> 0       0       0
-- <node :   2965 <=   2959 =>   2935 : glue leftskip>     0       0       0
-- <node :   2959 <=   2935 =>   2265 : glue parfillleftskip>      0       0       0
-- <node :   2935 <=   2265 =>   2405 : par vmodepar>
-- <node :   2265 <=   2405 =>   2353 : glue parinitleftskip>      0       0       0
-- <node :   2405 <=   2353 =>   2531 : glue indentskip>   2622000 0       0
-- <node :   2353 <=   2531 =>   2469 : glyph unset>       标
-- <node :   2531 <=   2469 =>   2543 : glue userskip>     0       655500  0
-- <node :   2469 <=   2543 =>    570 : glyph unset>       标
-- <node :   2543 <=    570 =>   2423 : penalty userpenalty>       10000
-- <node :    570 <=   2423 =>   2417 : glue userskip>     0       655500  0
-- <node :   2423 <=   2417 =>   2555 : glue userskip>     0       0       655500
-- <node :   2417 <=   2555 =>    609 : glyph unset>       ‘
-- <node :   2555 <=    609 =>   2318 : penalty userpenalty>       10000
-- <node :    609 <=   2318 =>   2567 : glue userskip>     0       655500  0
-- <node :   2318 <=   2567 =>    573 : glyph unset>       标
-- <node :   2567 <=    573 =>   2475 : penalty userpenalty>       10000
-- <node :    573 <=   2475 =>   2411 : glue userskip>     0       655500  0
-- <node :   2475 <=   2411 =>   2579 : glue userskip>     0       0       655500
-- <node :   2411 <=   2579 =>    606 : glyph unset>       “
-- <node :   2579 <=    606 =>   2253 : penalty userpenalty>       10000
-- <node :    606 <=   2253 =>   2591 : glue userskip>     0       655500  0
-- ...
-- <node :   2927 <=   2819 =>    666 : glyph unset>       ｛
-- <node :   2819 <=    666 =>   2941 : penalty linepenalty>       10000
-- <node :    666 <=   2941 =>   2947 : glue parfillskip>  0       65536   0
-- <node :   2941 <=   2947 =>   2953 : glue parinitrightskip>     0       0       0
-- <node :   2947 <=   2953 =>   2971 : glue rightskip>    0       0       0
-- <node :   2953 <=   2971 =>    nil : glue righthangskip>        0       0       0

-- 右关标点
-- <node :    nil <=   3537 =>   3517 : glue lefthangskip> 0       0       0
-- <node :   3537 <=   3517 =>   3499 : glue leftskip>     0       0       0
-- <node :   3517 <=   3499 =>   2371 : glue parfillleftskip>      0       0       0
-- <node :   3499 <=   2371 =>   3391 : par vmodepar>
-- <node :   2371 <=   3391 =>   2989 : glue parinitleftskip>      0       0       0
-- <node :   3391 <=   2989 =>   3025 : glue indentskip>   2622000 0       0
-- <node :   2989 <=   3025 =>   3397 : glyph unset>       标
-- <node :   3025 <=   3397 =>   3037 : glue userskip>     0       655500  0
-- <node :   3397 <=   3037 =>    669 : glyph unset>       标
-- <node :   3037 <=    669 =>   3403 : penalty userpenalty>       10000
-- <node :    669 <=   3403 =>   3049 : glue userskip>     0       655500  0
-- <node :   3403 <=   3049 =>   3061 : glyph unset>       ’
-- <node :   3049 <=   3061 =>   3067 : glue spaceskip>    327750  163875  109250
-- <node :   3061 <=   3067 =>    672 : glyph unset>       标
-- <node :   3067 <=    672 =>   3409 : penalty userpenalty>       10000
-- <node :    672 <=   3409 =>   3079 : glue userskip>     0       655500  0
-- <node :   3409 <=   3079 =>   3091 : glyph unset>       ”
-- ...
-- <node :   3367 <=   3487 =>   3490 : penalty userpenalty>       10000
-- <node :   3487 <=   3490 =>   3379 : glue userskip>     0       655500  0
-- <node :   3490 <=   3379 =>   3496 : glyph unset>       ｝
-- <node :   3379 <=   3496 =>   3505 : penalty linepenalty>       10000
-- <node :   3496 <=   3505 =>   3511 : glue parfillskip>  0       65536   0
-- <node :   3505 <=   3511 =>   3527 : glue parinitrightskip>     0       0       0
-- <node :   3511 <=   3527 =>   3543 : glue rightskip>    0       0       0
-- <node :   3527 <=   3543 =>    nil : glue righthangskip>        0       0       0

-- 结束标点，同前。`％`和`─`例外
-- 破折号，省略号同前

    end
    return head, true
end

function Thirddata.watch.finalizers_after(head)
    if head.next then
        show_detail(head.next.head,"finalizers_after")
-- 左开标点
-- <node :    nil <=   2965 =>   2959 : glue lefthangskip> 0       0       0
-- <node :   2965 <=   2959 =>   2935 : glue leftskip>     0       0       0
-- <node :   2959 <=   2935 =>   2265 : glue parfillleftskip>      0       0       0
-- <node :   2935 <=   2265 =>   2405 : par vmodepar>
-- <node :   2265 <=   2405 =>   2353 : glue parinitleftskip>      0       0       0
-- <node :   2405 <=   2353 =>   2531 : glue indentskip>   2622000 0       0
-- <node :   2353 <=   2531 =>   2469 : glyph unset>       标
-- <node :   2531 <=   2469 =>   2543 : glue userskip>     0       655500  0
-- <node :   2469 <=   2543 =>    570 : glyph unset>       标
-- <node :   2543 <=    570 =>   2423 : penalty userpenalty>       10000
-- <node :    570 <=   2423 =>   2417 : glue userskip>     0       655500  0
-- <node :   2423 <=   2417 =>   2555 : glue userskip>     0       0       655500
-- <node :   2417 <=   2555 =>    609 : glyph unset>       ‘
-- <node :   2555 <=    609 =>   2318 : penalty userpenalty>       10000
-- <node :    609 <=   2318 =>   2567 : glue userskip>     0       655500  0
-- <node :   2318 <=   2567 =>    573 : glyph unset>       标
-- <node :   2567 <=    573 =>   2475 : penalty userpenalty>       10000
-- <node :    573 <=   2475 =>   2411 : glue userskip>     0       655500  0
-- <node :   2475 <=   2411 =>   2579 : glue userskip>     0       0       655500
-- <node :   2411 <=   2579 =>    606 : glyph unset>       “
-- <node :   2579 <=    606 =>   2253 : penalty userpenalty>       10000
-- <node :    606 <=   2253 =>   2591 : glue userskip>     0       655500  0
-- ...
-- <node :   2927 <=   2819 =>    666 : glyph unset>       ｛
-- <node :   2819 <=    666 =>   2941 : penalty linepenalty>       10000
-- <node :    666 <=   2941 =>   2947 : glue parfillskip>  0       65536   0
-- <node :   2941 <=   2947 =>   2953 : glue parinitrightskip>     0       0       0
-- <node :   2947 <=   2953 =>   2971 : glue rightskip>    0       0       0
-- <node :   2953 <=   2971 =>    nil : glue righthangskip>        0       0       0

-- 右关标点
-- <node :    nil <=   3537 =>   3517 : glue lefthangskip> 0       0       0
-- <node :   3537 <=   3517 =>   3499 : glue leftskip>     0       0       0
-- <node :   3517 <=   3499 =>   2371 : glue parfillleftskip>      0       0       0
-- <node :   3499 <=   2371 =>   3391 : par vmodepar>
-- <node :   2371 <=   3391 =>   2989 : glue parinitleftskip>      0       0       0
-- <node :   3391 <=   2989 =>   3025 : glue indentskip>   2622000 0       0
-- <node :   2989 <=   3025 =>   3397 : glyph unset>       标
-- <node :   3025 <=   3397 =>   3037 : glue userskip>     0       655500  0
-- <node :   3397 <=   3037 =>    669 : glyph unset>       标
-- <node :   3037 <=    669 =>   3403 : penalty userpenalty>       10000
-- <node :    669 <=   3403 =>   3049 : glue userskip>     0       655500  0
-- <node :   3403 <=   3049 =>   3061 : glyph unset>       ’
-- <node :   3049 <=   3061 =>   3067 : glue spaceskip>    327750  163875  109250
-- <node :   3061 <=   3067 =>    672 : glyph unset>       标
-- <node :   3067 <=    672 =>   3409 : penalty userpenalty>       10000
-- <node :    672 <=   3409 =>   3079 : glue userskip>     0       655500  0
-- <node :   3409 <=   3079 =>   3091 : glyph unset>       ”
-- ...
-- <node :   3367 <=   3487 =>   3490 : penalty userpenalty>       10000
-- <node :   3487 <=   3490 =>   3379 : glue userskip>     0       655500  0
-- <node :   3490 <=   3379 =>   3496 : glyph unset>       ｝
-- <node :   3379 <=   3496 =>   3505 : penalty linepenalty>       10000
-- <node :   3496 <=   3505 =>   3511 : glue parfillskip>  0       65536   0
-- <node :   3505 <=   3511 =>   3527 : glue parinitrightskip>     0       0       0
-- <node :   3511 <=   3527 =>   3543 : glue rightskip>    0       0       0
-- <node :   3527 <=   3543 =>    nil : glue righthangskip>        0       0       0

-- 结束标点，同前。`％`和`─`例外
-- 破折号，省略号同前
    end
    return head, true
end

function Thirddata.watch.register()
    nodes.tasks.appendaction("processors", "before", "Thirddata.watch.processors_before")
    nodes.tasks.appendaction("processors", "after", "Thirddata.watch.processors_after")
    nodes.tasks.appendaction("finalizers", "before", "Thirddata.watch.finalizers_before")
    nodes.tasks.appendaction("finalizers", "after", "Thirddata.watch.finalizers_after")
end

return Thirddata.watch
