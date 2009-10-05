require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "watch-me-now"
    gem.summary = %Q{script to continuous test any sort of Ruby project}
    gem.description = %Q{watchr provides flexible continuous testing.  watch-me-now is a simple script to try and test most types of Ruby projects}
    gem.email = "rsanheim@gmail.com"
    gem.homepage = "http://github.com/rsanheim/watch-me-now"
    gem.authors = ["Rob Sanheim"]
    gem.add_dependency "watchr"
    gem.add_development_dependency "gemcutter"
    
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

task :default => :check_dependencies

desc "Push it real good"
task :push => ['release', 'gemcutter:release']