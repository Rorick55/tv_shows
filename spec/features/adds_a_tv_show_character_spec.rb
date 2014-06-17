require 'pry'
require 'rails_helper'

feature 'user adds a new character', %Q{
  As a site visitor
  I want to add my favorite TV show characters
  So that other people can enjoy their crazy antics
  } do

    #     Acceptance Criteria:
    # * I can access a form to add a character on a TV show's page
    # * I must specify the character's name and the actor's name
    # * I can optionally provide a description
    # * If I do not provide the required information, I receive an error message
    # * If the character already exists in the database, I receive an error message

    scenario 'user adds a new character' do
      attrs = {
        character_name: 'Tyler Durden',
        actor_name: 'Brad Pitt'
      }

      show_attrs = {
        title: 'Game of Thrones',
        network: 'HBO'
      }

      character = Character.new(attrs)
      show = TelevisionShow.create(show_attrs)

      visit "/television_shows/#{show.id}/characters/new"
      fill_in 'Character name', with: character.character_name
      fill_in 'Actor name', with: character.actor_name
      fill_in 'Description', with: character.description
      click_on 'Submit'

      expect(page).to have_content 'Success'
      expect(page).to have_content character.character_name
      expect(page).to have_content character.actor_name
    end

    scenario 'without required attributes' do
        show_attrs = {
        title: 'Game of Thrones',
        network: 'HBO'
      }

      show = TelevisionShow.create(show_attrs)

      visit "/television_shows/#{show.id}/characters/new"
      click_on 'Submit'

      expect(page).to have_content "can't be blank"
      expect(page).to_not have_content "Success"
    end

    scenario 'user cannot add a character that is already' do
      attrs = {
        character_name: 'Tyler Durden',
        actor_name: 'Brad Pitt'
      }

      show_attrs = {
        title: 'Game of Thrones',
        network: 'HBO'
      }
      show = TelevisionShow.create(show_attrs)
      first_character = Character.new(attrs)
      first_character.television_show_id = show.id
      first_character.save

      visit "/television_shows/#{show.id}/characters/new"
      fill_in 'Character name', with: first_character.character_name
      fill_in 'Actor name', with: first_character.actor_name
      click_on 'Submit'

      expect(page).to_not have_content 'Success'
      expect(page).to have_content 'has already been taken'
    end
  end

