require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'
require 'find'

# Don't include resource forks in tarballs on Mac OS X.
ENV['COPY_EXTENDED_ATTRIBUTES_DISABLE'] = 'true'
ENV['COPYFILE_DISABLE'] = 'true'

# Gemspec
gemspec = Gem::Specification.new do |s|
  s.rubyforge_project = 'riemann-mysql'

  s.name = 'riemann-mysql'
  s.version = '0.2.1'
  s.author = 'Fede Borgnia'
  s.email = 'fborgnia@gmail.com'
  s.license = 'MIT'
  s.homepage = 'https://github.com/riemann/riemann-mysql'
  s.platform = Gem::Platform::RUBY
  s.summary = 'MySQL client that submit events to Riemann.'

  s.add_dependency 'riemann-tools', '~> 0.2.18'
  s.add_dependency 'mysql2', '~> 0.4.0'

  s.files = FileList['lib/**/*', 'bin/*', 'LICENSE', 'README.md'].to_a
  s.executables |= Dir.entries('bin/')
  s.require_path = 'lib'
  s.has_rdoc = false

  s.required_ruby_version = '>= 2.0.0'
end

Gem::PackageTask.new gemspec do |p|
end

RDoc::Task.new do |rd|
  rd.main = 'Riemann MySQL'
  rd.title = 'Riemann MySQL'
  rd.rdoc_dir = 'doc'

  rd.rdoc_files.include('lib/**/*.rb')
end
