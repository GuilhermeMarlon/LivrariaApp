require "application_system_test_case"

class AuthorsTest < ApplicationSystemTestCase
  setup do
    @author = authors(:one)
  end

  test "visiting the index" do
    visit authors_url

    assert_selector "h1", text: "Autores"
  end

  test "should create author" do
    visit authors_url

    click_on "Novo autor"

    fill_in "Name", with: @author.name

    click_on "Criar Autor"

    assert_text "Author was successfully created"
    click_on "Voltar"
  end

  test "should update Author" do
    visit author_url(@author)
    click_on "Editar", match: :first

    fill_in "Name", with: @author.name

    click_on "Atualizar Autor"

    assert_text "Author was successfully updated"
    click_on "Voltar"
  end

  test "should destroy Author" do
    visit author_url(@author)

    click_on "Excluir", match: :first

    assert_text "Author was successfully destroyed"
  end
end
