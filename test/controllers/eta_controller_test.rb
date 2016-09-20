require 'test_helper'

class EtaControllerTest < ActionController::TestCase
  test "should get time" do
    eta = Eta.new
    assert_not eta.save
  end

end
