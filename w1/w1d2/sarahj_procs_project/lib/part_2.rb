def reverser(str, &proc)
    proc.call(str.reverse)
end

def word_changer(str, &proc)
    str.split(" ").map {|word| proc.call(word)}.join(" ")
end

def greater_proc_value(num, proc_1, proc_2)
    res_1 = proc_1.call(num)
    res_2 = proc_2.call(num)
    res_1 > res_2 ? res_1 : res_2
end

def and_selector(arr, proc_1, proc_2)
    arr.select {|el| proc_1.call(el) && proc_2.call(el)}
end

def alternating_mapper(arr, proc_1, proc_2)
    arr.map.with_index do |el, i|
        i.even? ? proc_1.call(el) : proc_2.call(el)
    end
end