require 'rails_helper'

feature 'user views list of characters', %Q{
 As a site visitor
I want to view a list of people's favorite TV characters
So I can find wonky characters to watch
} do


  scenario 'user views characters' do
    show = TelevisionShow.create(title: 'Game of Thrones', network: 'HBO')

    character_attrs = [
      { character_name: 'Tyrion', actor_name: 'Peter', television_show_id: show.id},
      { character_name: 'Jeoffry', actor_name: 'James', television_show_id: show.id}
    ]
    characters = []
    character_attrs.each do |attrs|
      characters << Character.create(attrs)
    end

    visit 'characters'
    characters.each do |character|
      expect(page).to have_content character.character_name
      expect(page).to have_content character.television_show.title
    end
  end
end
