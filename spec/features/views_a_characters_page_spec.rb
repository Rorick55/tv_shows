require 'rails_helper'

feature "users view a character's details", %Q{
  As a site visitor
  I want to view the details for a TV show
  So I can learn more about it
} do


  scenario "user views a character's detail page" do
    show = TelevisionShow.create(title: 'Fight Club', network: 'HBO')
    character = Character.create(character_name: 'Tyler Durden', actor_name: 'Brad Pitt', television_show_id: show.id)
    visit "/characters/#{character.id}"
    expect(page).to have_content character.character_name
    expect(page).to have_content character.television_show.title
    expect(page).to have_content character.actor_name
  end
end



