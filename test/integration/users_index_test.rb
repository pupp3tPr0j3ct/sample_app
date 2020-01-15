require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin      = users(:michael)
    @non_admin  = users(:archer)
  end

  # test "index including pagination" do
  #   log_in_as(@user) # Log in as setup user :michael.
  #   get users_path # Head to users page.
  #   assert_template 'users/index' # Check that index page renders.
  #   assert_select 'div.pagination', count: 2 # Check div class 'pagination'.
  #   User.paginate(page: 1).each do |user| # Iterate through each user in the first page.
  #     assert_select 'a[href=?]', user_path(user), text: user.name
  #   end
  # end

  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: 'delete'
      end
    end
    # Make sure a non-admin user was deleted.
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end

  # Make sure a non-admin user logs in and cannot view a delete link.
  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
end # End of Class
