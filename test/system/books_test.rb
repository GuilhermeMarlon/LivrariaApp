# test/system/books_test.rb

require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Livros"
  end

  test "should create book" do
    visit books_url
    click_on "Novo livro"

    fill_in "Author", with: @book.author_id
    fill_in "Synopsis", with: @book.synopsis
    fill_in "Title", with: @book.title

    click_on "Novo Livro"

    assert_text "Livro foi criado com sucesso"
    click_on "Voltar"
  end

  test "should update Book" do
    visit book_url(@book)
    click_on "Editar", match: :first

    fill_in "Author", with: @book.author_id
    fill_in "Synopsis", with: @book.synopsis
    fill_in "Title", with: @book.title

    click_on "Atualizar Livro"

    assert_text "Livro foi atualizado com sucesso"
    click_on "Voltar"
  end

  test "should destroy Book" do
    visit book_url(@book)

    click_on "Excluir", match: :first
    assert_text "Livro foi removido com sucesso"
  end
end
