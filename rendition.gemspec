# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rendition/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["jake hoffner"]
  gem.email         = ["jake.hoffner@hoffnercorporation.com"]
  gem.description   = %q{Rails 3 MVC Presenter pattern library}
  gem.summary       = %q{}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rendition"
  gem.require_paths = ["lib"]
  gem.version       = Rendition::VERSION
end
