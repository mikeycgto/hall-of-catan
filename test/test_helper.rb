ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def grant_access!
    @controller.stubs(:access_required).returns(true)
  end
  
  def revoke_access!
    @controller.stubs(:access_required).returns(false)
  end
  
  include Factory::Syntax::Methods
end

require 'mocha'