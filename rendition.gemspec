# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rendition/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jake Hoffner"]
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
  gem.rubyforge_project = "rendition"

  gem.add_dependency 'activesupport', '~> 3.2'
  gem.add_dependency 'actionpack', '~> 3.2'

  gem.add_development_dependency 'ammeter', '~> 0.2.2'
  gem.add_development_dependency 'rake', '~> 0.9.2'
  gem.add_development_dependency 'rspec', '~> 2.10'
  gem.add_development_dependency 'rails', '~> 3.2.3'
end
