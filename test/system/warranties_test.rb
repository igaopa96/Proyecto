require "application_system_test_case"

class WarrantiesTest < ApplicationSystemTestCase
  setup do
    @warranty = warranties(:one)
  end

  test "visiting the index" do
    visit warranties_url
    assert_selector "h1", text: "Warranties"
  end

  test "creating a Warranty" do
    visit warranties_url
    click_on "New Warranty"

    fill_in "Dias restantes", with: @warranty.dias_restantes
    fill_in "Estado", with: @warranty.estado
    fill_in "Fecha adq", with: @warranty.fecha_adq
    fill_in "No identificacion", with: @warranty.no_identificacion
    fill_in "Nombre", with: @warranty.nombre
    fill_in "Periodo dias", with: @warranty.periodo_dias
    fill_in "User", with: @warranty.user_id
    click_on "Create Warranty"

    assert_text "Warranty was successfully created"
    click_on "Back"
  end

  test "updating a Warranty" do
    visit warranties_url
    click_on "Edit", match: :first

    fill_in "Dias restantes", with: @warranty.dias_restantes
    fill_in "Estado", with: @warranty.estado
    fill_in "Fecha adq", with: @warranty.fecha_adq
    fill_in "No identificacion", with: @warranty.no_identificacion
    fill_in "Nombre", with: @warranty.nombre
    fill_in "Periodo dias", with: @warranty.periodo_dias
    fill_in "User", with: @warranty.user_id
    click_on "Update Warranty"

    assert_text "Warranty was successfully updated"
    click_on "Back"
  end

  test "destroying a Warranty" do
    visit warranties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Warranty was successfully destroyed"
  end
end
