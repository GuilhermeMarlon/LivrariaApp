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

    click_on "Criar Usuário"

    assert_text "Usuário foi criado com sucesso"
    click_on "Voltar"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Editar", match: :first

    fill_in "Email", with: @user.email
    fill_in "Name", with: @user.name
    fill_in "Phone", with: @user.phone

    click_on "Atualizar Usuário"


    assert_text "Usuário foi atualizado com sucesso"
    click_on "Voltar"
  end

  test "should destroy User" do
    visit user_url(@user)

    click_on "Excluir", match: :first

    assert_text "Usuário foi removido com sucesso"
  end
end
