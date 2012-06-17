# coding: utf-8
class Word
  def self.expand(name)
    name = Name.new(name)
    adjectives = name.letters.empty? ? [] : Adjective.checked.starts_with(name.letters.uniq.join).order('RANDOM()'.lit).select('word'.lit).collect {|adj| adj.word }.group_by {|adj| adj.chars.first }
    name.letters.collect do |letter|
      if group = adjectives[letter]
        if adj = group.shift
          AdjectiveFlexor.transform(adj, name.gender)
        end
      end
    end.compact
  end

end
