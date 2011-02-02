require 'spec/rake/spectask'
require 'rake/rdoctask'
require 'rake/gempackagetask'

desc 'Default: run all specs'
task :default => :spec

desc 'Run all application-specific specs'
Spec::Rake::SpecTask.new(:spec) do |t|
  # t.rcov = true
end

desc "Report code statistics (KLOCs, etc) from the application"
task :stats do
  RAILS_ROOT = File.dirname(__FILE__)
  STATS_DIRECTORIES = [
    %w(Libraries  lib/),
    %w(Specs      spec/),
  ].collect { |name, dir| [ name, "#{RAILS_ROOT}/#{dir}" ] }.select { |name, dir| File.directory?(dir) }
  require 'code_statistics'
  CodeStatistics.new(*STATS_DIRECTORIES).to_s
end

namespace :doc do
  desc 'Generate documentation for the assert_request plugin.'
  Rake::RDocTask.new(:plugin) do |rdoc|
    rdoc.rdoc_dir = 'rdoc'
    rdoc.title    = 'Gravatar Rails Plugin'
    rdoc.options << '--line-numbers' << '--inline-source' << '--accessor' << 'cattr_accessor=rw'
    rdoc.rdoc_files.include('README')
    rdoc.rdoc_files.include('lib/**/*.rb')
  end
end

PKG_FILES = FileList[
  '[a-zA-Z]*',
  'generators/**/*',
  'lib/**/*',
  'rails/**/*',
  'spec/**/*',
  'tasks/**/*',
  'test/**/*'
]

spec = Gem::Specification.new do |s|
  s.name = "gravatar-plugin"
  s.version = "0.1.0"
  s.author = "Scott Woods"
  s.email = "scott@westarete.com"
  s.homepage = "http://github.com/woods/gravatar-plugin"
  s.platform = Gem::Platform::RUBY
  s.summary = "A Ruby on Rails plugin that supplies view helpers for displaying globally-recognized avatars (gravatars) more easily."
  s.files = PKG_FILES.to_a
  s.require_path = "lib"
  s.has_rdoc = true
end

desc 'Turn this plugin into a gem.'
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end
