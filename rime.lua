function date_translator(input, seg)
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
    if (input == "week") then
        local weekTab = {'日', '一', '二', '三', '四', '五', '六'}
        yield(Candidate("week", seg.start, seg._end, "周" .. weekTab[tonumber(os.date("%w") + 1)], ""))
        yield(Candidate("week", seg.start, seg._end, "星期" .. weekTab[tonumber(os.date("%w") + 1)], ""))
        yield(Candidate("week", seg.start, seg._end, "礼拜" .. weekTab[tonumber(os.date("%w") + 1)], ""))
    end
    if (input == "date") then
        -- 英文日期
        local date_d = os.date("%d")
        local date_m = os.date("%m")
        local date_y = os.date("%Y")
        local date_m1 = ""
        local date_m2 = ""
        if date_m == "01" then
            date_m1 = "Jan."
            date_m2 = "January"
        end
        if date_m == "02" then
            date_m1 = "Feb."
            date_m2 = "February"
        end
        if date_m == "03" then
            date_m1 = "Mar."
            date_m2 = "March"
        end
        if date_m == "04" then
            date_m1 = "Apr."
            date_m2 = "April"
        end
        if date_m == "05" then
            date_m1 = "May."
            date_m2 = "May"
        end
        if date_m == "06" then
            date_m1 = "Jun."
            date_m2 = "June"
        end
        if date_m == "07" then
            date_m1 = "Jul."
            date_m2 = "July"
        end
        if date_m == "08" then
            date_m1 = "Aug."
            date_m2 = "August"
        end
        if date_m == "09" then
            date_m1 = "Sept."
            date_m2 = "September"
        end
        if date_m == "10" then
            date_m1 = "Oct."
            date_m2 = "October"
        end
        if date_m == "11" then
            date_m1 = "Nov."
            date_m2 = "November"
        end
        if date_m == "12" then
            date_m1 = "Dec."
            date_m2 = "December"
        end

        if date_d == "0" then
            symbal = "st"
        elseif date_d == "1" then
            symbal = "nd"
        elseif date_d == "2" then
            symbal = "rd"
        else
            symbal = "th"
        end
        date5 = date_m1 .. "" .. date_d .. symbal .. ", " .. date_y
        date6 = date_m2 .. " " .. date_d .. symbal .. ", " .. date_y
        yield(Candidate("date", seg.start, seg._end, date6, "English"))
        yield(Candidate("date", seg.start, seg._end, date5, "English"))
        ------------------------------------------------------------------------------------
        yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d"), "1"))
        ------------------------------------------------------------------------------------
        -- 普通日期1，类似2022年01月02日
        date1 = os.date("%Y年%m月%d日")
        date_y = os.date("%Y") -- 取年
        date_m = os.date("%m") -- 取月
        date_d = os.date("%d") -- 取日
        yield(Candidate("date", seg.start, seg._end, date1, "2"))
        ------------------------------------------------------------------------------------
        -- 普通日期2，类似2022年1月1日
        num_m = os.date("%m") + 0
        num_m1 = math.modf(num_m)
        num_d = os.date("%d") + 0
        num_d1 = math.modf(num_d)
        date2 = os.date("%Y年") .. tostring(num_m1) .. "月" .. tostring(num_d1) .. "日"
        yield(Candidate("date", seg.start, seg._end, date2, "3"))
        ------------------------------------------------------------------------------------
        -- 普通日期3，类似1月1日
        num_m = os.date("%m") + 0
        num_m1 = math.modf(num_m)
        num_d = os.date("%d") + 0
        num_d1 = math.modf(num_d)
        date3 = tostring(num_m1) .. "月" .. tostring(num_d1) .. "日"
        yield(Candidate("date", seg.start, seg._end, date3, "4"))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y/%m/%d"), "5"))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), "6"))
        ------------------------------------------------------------------------------------
        -- 大写日期，类似二〇二〇年十一月二十六日
        date_y = date_y:gsub("%d", {
            ["1"] = "一",
            ["2"] = "二",
            ["3"] = "三",
            ["4"] = "四",
            ["5"] = "五",
            ["6"] = "六",
            ["7"] = "七",
            ["8"] = "八",
            ["9"] = "九",
            ["0"] = "〇"
        })
        date_y = date_y .. "年"
        date_m = date_m:gsub("%d", {
            ["1"] = "一",
            ["2"] = "二",
            ["3"] = "三",
            ["4"] = "四",
            ["5"] = "五",
            ["6"] = "六",
            ["7"] = "七",
            ["8"] = "八",
            ["9"] = "九",
            ["0"] = ""
        })
        date_m = date_m .. "月"
        if num_m1 == 10 then
            date_m = "十月"
        end
        if num_m1 == 11 then
            date_m = "十一月"
        end
        if num_m1 == 12 then
            date_m = "十二月"
        end
        date_d = date_d:gsub("%d", {
            ["1"] = "一",
            ["2"] = "二",
            ["3"] = "三",
            ["4"] = "四",
            ["5"] = "五",
            ["6"] = "六",
            ["7"] = "七",
            ["8"] = "八",
            ["9"] = "九",
            ["0"] = ""
        })
        date_d = date_d .. "日"
        if num_d1 > 9 then
            if num_d1 < 19 then
                date_d = "十" .. string.sub(date_d, 4, #date_d)
            end
        end
        if num_d1 > 19 then
            date_d = string.sub(date_d, 1, 3) .. "十" .. string.sub(date_d, 4, #date_d)
        end
        date4 = date_y .. date_m .. date_d
        yield(Candidate("date", seg.start, seg._end, date4, "7"))
        ------------------------------------------------------------------------------------
    end
end

--- 过滤器：单字在先
function single_char_first_filter(input)
    local l = {}
    for cand in input:iter() do
        if (utf8.len(cand.text) == 1) then
            yield(cand)
        else
            table.insert(l, cand)
        end
    end
    for cand in ipairs(l) do
        yield(cand)
    end
end
