require 'rails_helper'


  feature "user views a list of all actors", %Q{
    As a user, I want to be able to go to a page
    and view a list of all the actors by their
    names
} do

  scenario "user views a page with all the actors names" do
    attrs = [
      {name: 'Billy Bob', description: 'old asshole'},
      {name: 'Johny Depp', description: 'Classy man'}
    ]
    actors = []
    attrs.each do |attri|
      actors << Actor.create(attri)
    end

    visit '/actors'
    actors.each do |actor|
      expect(page).to have_content actor.name
    end
  end
end
