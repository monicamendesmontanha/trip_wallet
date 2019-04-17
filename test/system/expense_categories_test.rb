require "application_system_test_case"

class ExpenseCategoriesTest < ApplicationSystemTestCase
  setup do
    @expense_category = expense_categories(:one)
  end

  test "visiting the index" do
    visit expense_categories_url
    assert_selector "h1", text: "Expense Categories"
  end

  test "creating a Expense category" do
    visit expense_categories_url
    click_on "New Expense Category"

    fill_in "Name", with: @expense_category.name
    click_on "Create Expense category"

    assert_text "Expense category was successfully created"
    click_on "Back"
  end

  test "updating a Expense category" do
    visit expense_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @expense_category.name
    click_on "Update Expense category"

    assert_text "Expense category was successfully updated"
    click_on "Back"
  end

  test "destroying a Expense category" do
    visit expense_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expense category was successfully destroyed"
  end
end
