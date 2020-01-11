require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end

  test "index including pagination" do
    log_in_as(@user) # Log in as setup user :michael.
    get users_path # Head to users page.
    assert_template 'users/index' # Check that index page renders.
    assert_select 'div.pagination', count: 2 # Check div class 'pagination'.
    User.paginate(page: 1).each do |user| # Iterate through each user in the first page.
      assert_select 'a[href=?]', user_path(user), text: user.name
    end
  end
end
