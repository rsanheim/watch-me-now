# --------------------------------------------------
# Convenience Methods
# --------------------------------------------------
def test_folder
  @test_folder ||= %w[spec examples test].detect { |p| File.directory?(p) }
end

def include_lib_folder_if_exists
  "-Ilib" if File.directory?("lib")
end

def test_suffix
  case test_folder
  when "spec" then "spec"
  when "examples" then "example"
  when "test" then "test"
  end
end

def all_test_files
  Dir["#{test_folder}/**/*_#{test_suffix}.rb"]
end

def runner
  ENV["WATCHR_RUNNER"] || "ruby"
end

def run_test_matching(thing_to_match)
  matches = all_test_files.grep(/#{thing_to_match}/i)
  if matches.empty?
    puts "Sorry, thanks for playing, but there were no matches for #{thing_to_match}"  
  else
    run matches.join(' ')
  end
end

def run_all_tests
  run(all_test_files.join(' '))
end

def run(files_to_run)
  if files_to_run.strip.empty?
    puts "No files to run"
  else
    cmd = "#{runner} #{include_lib_folder_if_exists} -I#{test_folder} #{files_to_run}"
    execute cmd
  end
  no_int_for_you
end

def execute(cmd)
  puts("> #{cmd}")
  system(cmd)
end

def no_int_for_you
  @sent_an_int = nil
end

# --------------------------------------------------
# Watchr Rules
# --------------------------------------------------
watch("^lib/(.*)\.rb") { |m| run_test_matching(m[1]) }
watch("^#{test_folder}/(.*)_#{test_suffix}\.rb") { |m| run_test_matching(m[1]) }
watch("^#{test_folder}/(.*)\.rb") { |m| run_test_matching(m[1]) }
watch("^#{test_folder}/#{test_suffix}_helper\.rb") { run_all_tests }

watch('^features/(.*)') { execute "cucumber --tags @wip features" }

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
Signal.trap 'INT' do
  if @sent_an_int then      
    puts "   A second INT?  Ok, I get the message.  Shutting down now."
    exit
  else
    puts "   Did you just send me an INT? Ugh.  I'll quit for real if you do it again."
    @sent_an_int = true
    Kernel.sleep 1.5
    run_all_tests
  end
end

puts "watch-me-now loaded and watching..."