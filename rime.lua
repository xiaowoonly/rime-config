--------------------------获取当前时间日期------------------------------------
-- 在文件夹Lua中新建文件date_translator.lua(此处的文件名必需与上文require中的内容相同)
-- 并且luna_pinyin_simp.custom.yaml 中配置"engine/translators/@8": lua_translator@date_translator
date_translator = require("date_translator")
time_translator = require("time_translator")
week_translator = require("week_translator")
--------------------------获取当前时间日期------------------------------------

--- 过滤器：单字在先
single_char_first_filter = require("single_char_first_filter")
--- 过滤器：单字在先
