require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "user should can be found by name" do
    lindeman = User.create!(
        name: "Andy",
        email: "Lindeman@qq.com",
        password: "Andy",
        telephone_number: "12345678900")
    chelimsky = User.create!(
        name: "Bob",
        email: "Lindeman2@qq.com",
        password: "Bob",
        telephone_number: "12345678900")
    expect(User.find_by_name("Andy")).to eq(lindeman)
  end

  it "user should be created with id auto" do
    lindeman = User.create!(name: "Andy", email: "Lindeman@qq.com",password: "Andy", telephone_number: "12345678900")
    chelimsky = User.create!(name: "Bob", email: "Lindeman2@qq.com",password: "Bob", telephone_number: "12345678900")
    expect(User.find_by_name("Andy").id).to_not eq(nil)
  end

  it "user should can be found by name" do
    lindeman = User.create!(name: "Andy", email: "Lindeman@qq.com",password: "Andy", telephone_number: "12345678900")
    chelimsky = User.create!(name: "Bob", email: "Lindeman2@qq.com",password: "Bob", telephone_number: "12345678900")
    expect(User.find_by_id("1")).to eq(lindeman)
  end

  it "user should can be found by email" do
    lindeman = User.create!(name: "Andy", email: "Lindeman@qq.com",password: "Andy", telephone_number: "12345678900")
    chelimsky = User.create!(name: "Bob", email: "Lindeman2@qq.com",password: "Bob", telephone_number: "12345678900")
    expect(User.find_by_email("Lindeman@qq.com")).to eq(lindeman)
  end

end
