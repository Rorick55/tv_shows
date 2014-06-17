require 'rails_helper'

  feature 'user views a actors page', %Q{
    As a user I would like to navigate to
    a page with an individual actor's
    information.
  } do

    scenario "user navigates to an actors page" do
      actor = Actor.create(name: 'Peter Dinklage', description: 'Never disapoints')

      visit "actors/#{actor.id}"
      expect(page).to have_content actor.name
      actor.characters.each do |character|
        expect(page).to have_content character.character_name
      end
      actor.television_shows.each do |television_show|
        expect(page).to have_content television_show.title
      end
    end
  end
