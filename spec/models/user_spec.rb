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

  describe'GET#show'do
    it "assigns the requested user to @user" do
        contact = create(:user)
        get :show, id: user
        expect(assigns(:user)).to eq user
    end
  end

end
