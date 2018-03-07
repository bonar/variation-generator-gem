class VariationGenerator

  attr_writer :verbose

  def initialize
    @results = []
    @verbose = false
  end

  def generate(entries)
    @results = []
    visit("", entries, 0)
    @results
  end

  def visit(text, entries, depth)
    if !entries || entries.empty?
      @results.push text
      return
    end
    depth = depth + 1
    entry = entries[0]
    restOfEntries = entries[1..-1]
    entry.each do |option|
      debug("%s visit text:%s option:%s entries:%s" % [
        ("-" * depth), text, option, entries.to_s])
      visit(text + option, restOfEntries, depth)
    end
  end

  def debug(text)
    unless @verbose
      return
    end
    puts text
  end

end

