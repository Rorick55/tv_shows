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
      expect(page).to have_content actor.characters.character_name
      expect(page).to have_content actor.television_shows.title
    end
  end
