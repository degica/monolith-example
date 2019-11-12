require 'rails_helper'

RSpec.feature 'Songs', type: :feature do
  given!(:song) { create(:song) }
  given!(:person) { create(:person) }

  specify "visiting the index" do
    visit songs_url
    expect(page).to have_selector "h1", text: "Songs"
  end

  specify "creating a Song" do
    visit songs_url
    click_on "New Song"

    fill_in "Author", with: person.id
    fill_in "Length", with: song.length
    fill_in "Title", with: "NEW TITLE"
    click_on "Create Song"

    expect(page).to have_text "Song was successfully created"
    click_on "Back"
  end

  specify "updating a Song" do
    visit songs_url
    click_on "Edit", match: :first

    fill_in "Author", with: song.author_id
    fill_in "Length", with: song.length
    fill_in "Title", with: "New title"
    click_on "Update Song"

    expect(page).to have_text "Song was successfully updated"
    click_on "Back"
  end

  specify "destroying a Song" do
    visit songs_url
    click_on "Destroy", match: :first

    expect(page).to have_text "Song was successfully destroyed"
  end
end
