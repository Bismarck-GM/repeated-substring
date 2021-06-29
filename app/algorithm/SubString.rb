class SubString

  def self.resolve(text_string)
    return '' if text_string === nil || text_string.length === 0
    left, right = 0, 0
    result = {text: '', from: 0, to: 0, length: 0}
    set = Set.new
    while right < text_string.length
      current_char = text_string[right]
      while set.include?(current_char)
        set.delete(text_string[left])
        left += 1
      end
      set.add(current_char)
      if right - left + 1 > result[:text].length
        result[:text] = text_string[left..right]
        result[:from] = left
        result[:to] = right
        result[:length] = text_string[left..right].length
      end
      right += 1
    end
    result
  end

end