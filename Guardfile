
guard :rspec, :cli => "--color --format nested --fail-fast" do
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')                        { "spec" }
  watch(%r{^spec/.+_spec\.rb$})
end

