# test/system/rentals_test.rb

require "application_system_test_case"

class RentalsTest < ApplicationSystemTestCase
  setup do
    @rental = rentals(:one)
  end

  test "visiting the index" do
    visit rentals_url
    # Título do h1: "Alugueis" (a primeira letra é maiúscula)
    assert_selector "h1", text: "Alugueis"
  end

  test "should create rental" do
    visit rentals_url
    # Botão "Novo Aluguel" (note o "A" maiúsculo)
    click_on "Novo Aluguel"

    # Verifique os labels do formulário
    # Os nomes dos campos ("Book", "Rent date", etc.) provavelmente
    # são os mesmos se o seu HTML usa `f.label :book_id`.
    fill_in "Book", with: @rental.book_id
    fill_in "Rent date", with: @rental.rent_date
    fill_in "Return date", with: @rental.return_date
    fill_in "User", with: @rental.user_id

    # O botão de criar deve ser "Create Rental" ou "Criar Aluguel"
    # Se o scaffold gerou em inglês, o texto é "Create Rental".
    click_on "Criar Aluguel"

    # Mensagem de sucesso
    assert_text "Rental was successfully created"
    # O link "Back" geralmente não é traduzido, então deve estar correto.
    click_on "Voltar"
  end

  test "should update Rental" do
    visit rental_url(@rental)
    # Clique em "Editar este(a) rental".
    # O padrão do Rails é "Edit this <model_name>"
    # Ou "Editar este(a) <model_name>" se traduzido.
    # Vamos tentar o padrão que aparece no seu log, mas sem o (a).
    click_on "Editar", match: :first

    # Campos do formulário de atualização
    fill_in "Book", with: @rental.book_id
    fill_in "Rent date", with: @rental.rent_date
    fill_in "Return date", with: @rental.return_date
    fill_in "User", with: @rental.user_id

    # O botão de atualização deve ser "Update Rental" ou "Atualizar Rental"
    click_on "Atualizar Aluguel"

    # Mensagem de sucesso
    assert_text "Rental was successfully updated"
    click_on "Voltar"
  end

  test "should destroy Rental" do
    visit rental_url(@rental)
    # Clique em "Remover este(a) rental".
    # O padrão é "Destroy this <model_name>"
    # Ou "Remover este(a) <model_name>"
    click_on "Excluir", match: :first

    # Mensagem de sucesso
    assert_text "Rental was successfully destroyed"
  end
end
