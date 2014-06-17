require 'rails_helper'

  feature 'user adds an actor', %Q{
    As a user I want to be able to
    navigate to a page with a form
    that allows me to create a new
    actor
} do


  scenario "user adds an actor" do
      attrs = {
        name: 'Johny Depp',
        description: 'Classy classy actor'
      }

    actor = Actor.new(attrs)
    visit '/actors/new'
    fill_in "Name", with: actor.name
    fill_in "Description", with: actor.description
    click_on 'Submit'

    expect(page).to have_content actor.name
    expect(page).to have_content "Success"
  end

  scenario "user submits empty form" do
    visit "/actors/new"
    click_on 'Submit'

    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content "Success"
  end

  scenario "user submits duplicate actor" do
    attrs = {
      name: "Peter Dinklige",
      description: "Awesome guy, awesome actor"
    }
    actor = Actor.create(attrs)

    visit '/actors/new'
    fill_in "Name", with: actor.name
    fill_in "Description", with: actor.description
    click_on 'Submit'

    expect(page).to have_content "actor already exists"
    expect(page).to_not have_content actor.name
    expect(page).to_not have_content "Success"
  end
end
