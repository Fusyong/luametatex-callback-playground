本项目的目的在于探索LuaTeX的开放给用户的处理钩子——回调（callback），同时也是学习LuaTeX排版的机制和流程。LuaTeX有多种类别的回调，本文重点探索**结点列表**相关回调，或兼及输入、输出缓存、PDF、字体相关回归。实际的运行环境是LuaMetaTex(LuaTeX的后继者，简称LMTX)和ConTeXt。

代码库：[luametatex-callback-playground](https://github.com/Fusyong/luametatex-callback-playground)

## 使用方法

* 安装ConTeXt LMTX
* 运行`context luametatex-callback-playground.lmtx`，编译
* 如果控制台输出汉字乱码，可用命令`chcp 65001`临时改变代码页
* 观察控制台和pdf输出
* play `luametatex-callback-playground.lmtx`和`luametatex-callback-playground.lua`并编译
* 观察并 play again, and on and on

## 详细教程

[ LuaTeX回调游乐场](https://blog.xiiigame.com/2022-02-23-luametatex-callback-playground/)

