require'rails_helper'

describe'GET usercontroller#show'do
  it "assigns the requested user to @user" do
      user = create(:user)
      get :show, params: { id: user}
      expect(assigns(:user)).to eq user
  end
end
