# spec/support/devise.rb
RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
end
