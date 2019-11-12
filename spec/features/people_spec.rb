require 'rails_helper'

RSpec.feature 'People', type: :feature do
  given(:person) { create(:person) }

  specify "visiting the index" do
    visit people_url
    expect(page).to have_selector "h1", text: "People"
  end

  specify "creating a Person" do
    visit people_url
    click_on "New Person"

    fill_in "Age", with: person.age
    fill_in "Favorite color", with: person.favorite_color
    fill_in "Name", with: person.name
    click_on "Create Person"

    expect(page).to have_text "Person was successfully created"
    click_on "Back"
  end

  specify "updating a Person" do
    visit people_url
    click_on "Edit", match: :first

    fill_in "Age", with: person.age
    fill_in "Favorite color", with: person.favorite_color
    fill_in "Name", with: person.name
    click_on "Update Person"

    expect(page).to have_text "Person was successfully updated"
    click_on "Back"
  end

  specify "destroying a Person" do
    visit people_url
    click_on "Destroy", match: :first

    expect(page).to have_text "Person was successfully destroyed"
  end
end
