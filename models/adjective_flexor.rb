class AdjectiveFlexor
  def self.transform(adjective, dst_gender)
    do_transform(adjective, gender(adjective), dst_gender)
  end

  def self.gender(word)
    case word
    when /[иі]й$/
      :male
    when /[ая]$/
      :female
    else
      :male
    end
  end

  def self.do_transform(adjective, src_gender, dst_gender)
    case true
    when src_gender == dst_gender
      adjective
    when src_gender == :male
      if adjective =~ /ий$/
        adjective.sub(/ий$/, 'а')
      elsif adjective =~ /ій$/
        adjective.sub(/ій$/, 'я')
      end
    when src_gender == :female
      if adjective =~ /а$/
        adjective.sub(/а$/, 'ий')
      elsif adjective =~ /я$/
        adjective.sub(/я$/, 'ій')
      end
    end
  end
end
