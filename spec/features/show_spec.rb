require 'rails_helper'

describe "When a user visits the vending machine show" do
  it "they see all the snack info for that machine" do
    owner = Owner.create(name: "Sam's Snacks")
    vend = owner.machines.create(location: "Turing")
    snickers = Snack.create(name: "Snickers", price: 1.50)
    cheetos = Snack.create(name: "Cheetos", price: 1.25)
    vend.snacks << snickers
    vend.snacks << cheetos

    visit machine_path(vend)

    expect(page).to have_content("Snickers")
    expect(page).to have_content("Cheetos")
    expect(page).to have_content(1.50)
    expect(page).to have_content(1.25)
  end
end
