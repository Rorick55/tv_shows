require 'rails_helper'

feature "user deletes a character", %Q{
  As a site visitor
  I want to delete a character I don't like
  So no one else will want to watch that character
  } do

    scenario "user deletes a character" do
      show = TelevisionShow.create(title: 'Game of Thrones', network: 'HBO' )
      character = Character.create(character_name: 'Tyrion', actor_name: 'Peter', television_show_id: show.id)
      visit "/characters/#{character.id}"
      click_on 'Delete'

      expect(page).to_not have_content character.character_name
      expect(page).to have_content 'character was deleted'
    end
  end
