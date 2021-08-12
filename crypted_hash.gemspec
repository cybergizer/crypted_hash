Gem::Specification.new do |s|
  s.name        = 'crypted_hash'
  s.version     = '0.0.2'
  s.date        = '2018-07-20'
  s.summary     = "CryptedHash"
  s.description = "Rubizza I need you! This is the only hash you would ever need! Let's make it great together!"
  s.authors     = ["Sergey Sergyenko"]
  s.email       = 'sergy@cybergizer.com'
  s.files       = ["lib/crypted_hash.rb"]
  s.homepage    =
    'http://rubygems.org/gems/crypted_hash'
  s.license     = 'Apache-2.0'

  s.files       = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 2.0"
  s.add_development_dependency "rake", "~> 12.0"
  s.add_development_dependency "rspec", "~> 3.0"
end
