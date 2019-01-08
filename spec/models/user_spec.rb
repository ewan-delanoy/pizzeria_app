require'rails_helper'
describe User do
  it "is valid with a firstname, lastname, password and email" do
    user=User.new(
      first_name: 'Aaron',
      last_name: 'Hillegass',
      password: 'password',
      email: 'aaron.hillegass@example.com'
    )
    expect(user).to be_valid
  end
  it "is invalid without a firstname"
  it "is invalid without a lastname"
  it "is invalid without an email address"
  it "is invalid with a duplicate email address"
  it "returns a contact's full name as a string"
end
