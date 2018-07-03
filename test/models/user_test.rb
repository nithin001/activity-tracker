require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should return id when given emailid" do
    user = User.find_by emailid: "test@test.com"
    assert_equal user.name, "Dan Brown"
  end

  test "should create user when not present" do
    User.create_with(name: 'JRR Tolkien').find_or_create_by(emailid: 'new@new.com')
    user = User.find_by emailid: "new@new.com"
    assert_equal user.name, "JRR Tolkien"
  end

  test "should not persist user without name" do
    new_user = User.new(emailid: "archer@new.com")
    refute new_user.valid?
  end
end
