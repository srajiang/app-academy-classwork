def sub(arr)
    p arr
    return [[]] if arr.empty?
    last = arr.pop
    prev_call = sub(arr[0..-1])
    prev_call.each.with_index {|ele, idx| prev_call[idx] << last}
end