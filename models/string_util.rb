module StringUtil

  def downcase(line)
    defined?(UnicodeUtils) ? UnicodeUtils.downcase(line) : line
  end

  def titlecase(line)
    defined?(UnicodeUtils) ? UnicodeUtils.titlecase(line) : line
  end
end
