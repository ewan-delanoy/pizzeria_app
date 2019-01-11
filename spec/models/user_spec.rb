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
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end
end
