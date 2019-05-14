# simple cov configuration
SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/app/channels/'
  add_filter '/spec/' # for rspec
  add_filter '/test/' # for minitest
  add_filter '/features/' # for cucumber
end
