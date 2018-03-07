require 'variation_generator'
require 'json'
require 'pp'

json = JSON.parse(IO.read(ARGV.shift))
generator = VariationGenerator.new
generator.generate(json["entries"]).each do |result|
  puts result
end


