Gem::Specification.new do |s|
  s.name        = 'angularnode'
  s.version     = '0.0.1'
  s.date        = '2015-01-21'
  s.summary     = "Easy as 1..2..NodeJs/Express/AngularJs"
  s.description = "Auto generate a NodeJS/Express/AngularJS application"
  s.authors     = ["Michael West"]
  s.email       = 'mpwest929@gmail.com'
  s.files       = ["lib/angularnode.rb", "bin/an"]
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.homepage    = 'http://rubygems.org/gems/angularnode'
  s.license     = 'MIT'
end
