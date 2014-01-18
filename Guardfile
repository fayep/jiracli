# vim: ft=ruby
# More info at https://github.com/guard/guard#readme
#
# More info also at https://github.com/guard/guard-rspec -- this one in
# particular details configuration options such as whether to run all tests
# after a failing test starts passing

guard :rspec, cli: '--tag ~slow' do
  watch(/^spec\/.+_spec\.rb/)
  watch(/^lib\/(.+)\.rb$/) do |match|
    %(unit integration qualification conformance).map do |kind|
      "spec/#{kind}/lib/#{match[1]}_spec.rb"
    end
  end
  watch('spec/spec_helper.rb')  { 'spec' }
  watch(%r{^spec/(fixtures|resources)(/|.rb)}) { 'spec' }
end

guard :rubocop, all_on_start: false do
  watch('Guardfile')
  watch(/.+\.rb$/)
  watch(/(?:.+\/)?\.rubocop\.yml$/) { |m| File.dirname(m[0]) }
end

guard :reek do
  watch(/^lib\/(.+)\.rb$/)
end
