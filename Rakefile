require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "watch-me-now"
    gem.summary = %Q{script to continuous test any sort of Ruby project}
    gem.description = %Q{TODO: longer description of your gem}
    gem.email = "rsanheim@gmail.com"
    gem.homepage = "http://github.com/rsanheim/watch-me-now"
    gem.authors = ["Rob Sanheim"]
    gem.add_dependency "watchr"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

task :default => :check_dependencies

task :push => ['release', 'gemcutter:release']