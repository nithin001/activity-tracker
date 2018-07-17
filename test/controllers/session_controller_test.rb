require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should create and persist new user in the db" do
    identityMock = MiniTest::Mock.new
    identityMock.expect(:email_address, "some_random_id@test.com")
    identityMock.expect(:name, "Test User")
    GoogleSignIn::Identity.stub(:new, identityMock) do
      SecureRandom.stub :hex, "123456" do
        post "/login", params: { google_id_token: "some_random_id"}
        assert_equal session[:user_id], "123456"
        assert_response :redirect
      end
    end
  end

  test "should return existing user in the db" do
    identityMock = MiniTest::Mock.new
    identityMock.expect(:email_address, "test@test.com")
    identityMock.expect(:name, "Test User")
    GoogleSignIn::Identity.stub(:new, identityMock) do
      post "/login", params: { google_id_token: "some_random_id"}
      assert_equal session[:user_id], "52750b30ffbc7de3b362"
      assert_response :redirect
    end
  end
end
