require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    unique_email = "new_user_#{Time.now.to_i}_#{rand(1000)}@example.com"
    unique_phone = "999888#{rand(1000000).to_s.rjust(6, '0')}"

    assert_difference("User.count") do
      post users_url, params: { user: {
        name: "Novo Usuário de Teste",
        email: unique_email,
        phone: unique_phone
      } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    updated_email = "updated_user_#{Time.now.to_i}_#{rand(1000)}@example.com"

    patch user_url(@user), params: { user: {
      name: "Nome Atualizado do Teste",
      email: updated_email,
      phone: @user.phone
    } }

    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
