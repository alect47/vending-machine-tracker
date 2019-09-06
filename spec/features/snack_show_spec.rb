require 'rails_helper'

describe "When a user visits the snack machine show" do
  it "they see all the snack info" do
    owner = Owner.create(name: "Sam's Snacks")
    vend = owner.machines.create(location: "Turing")
    vend_2 = owner.machines.create(location: "Union")
    snickers = Snack.create(name: "Snickers", price: 1.50)
    cheetos = Snack.create(name: "Cheetos", price: 1.25)
    vend.snacks << snickers
    vend.snacks << cheetos
    vend_2.snacks << snickers

    visit snack_path(snickers)
    expect(page).to have_content("Price: $1.50")
    expect(page).to have_content("Turing")
    expect(page).to have_content("of: $1.38")
    expect(page).to have_content("2 kinds of snacks")
    expect(page).to have_content("Union")
    expect(page).to have_content("of: $1.50")
    expect(page).to have_content("1 kinds of snacks")
  end
end
