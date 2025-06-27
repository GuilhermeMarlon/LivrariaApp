# test/system/users_test.rb

require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url

    assert_selector "h1", text: "Usuários"
  end

  test "should create user" do
    visit users_url
    click_on "Novo usuário"


    fill_in "Email", with: @user.email
    fill_in "Name", with: @user.name
    fill_in "Phone", with: @user.phone

    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Editar este(a) user", match: :first

    fill_in "Email", with: @user.email
    fill_in "Name", with: @user.name
    fill_in "Phone", with: @user.phone

    click_on "Update User"


    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)

    click_on "Remover este(a) user", match: :first

    assert_text "User was successfully destroyed"
  end
end
