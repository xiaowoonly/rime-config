local function time_translator(input, seg)
    if (input == "time") then
        --- Candidate(type, start, end, text, comment)
        -- 普通时间1
        yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日🉐%H:%M:%S"), "1"))
        -- 普通时间2，类似2022年02月25日15时58分08秒
        date1 = os.date("%Y年%m月%d日%H时%M分%S秒")
        date_y = os.date("%Y") -- 取年
        date_m = os.date("%m") -- 取月
        date_d = os.date("%d") -- 取日
        date_s = os.date("%H") -- 取时
        date_f = os.date("%M") -- 取分
        date_mm = os.date("%S") -- 取秒
        yield(Candidate("date", seg.start, seg._end, date1, "2"))
        -- 普通时间3
        yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d" .. "," .. "%H-%M-%S"), "3"))
    end
end
return time_translator
