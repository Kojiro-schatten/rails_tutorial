require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
  def setup
    @user = users(:michael)
    remember(@user)
  end
  
  test "current user returns right users when session is nil" do
    # assert_equalの引数は「期待する値, 実際の値」の順序で書く点に注意
    assert_equal @user, current_user
    assert is_logged_in?
  end
  
  test "current_user returns nil when remember digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end