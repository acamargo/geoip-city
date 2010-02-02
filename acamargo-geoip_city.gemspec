spec = Gem::Specification.new do |s|
  s.name = 'acamargo-geoip_city'
  s.version = '1.0'

  s.author = "André Camargo"
  s.email = "andre@boaideia.inf.br"

  s.summary = 'A Ruby binding to the GeoIP C Library'
  s.description = "Generic GeoIP lookup tool. Based on the geoip_city RubyGem by Ryan Dahl"
  s.homepage = "http://github.com/acamargo/geoip_city"

  s.files = ["extconf.rb", "geoip_city.c", "Rakefile", "README.md", "test.rb"]
  s.test_files = "test.rb"
  s.extensions = ["extconf.rb"]
  s.require_path = "."
end
