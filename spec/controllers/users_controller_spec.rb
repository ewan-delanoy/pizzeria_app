require 'rails_helper'

describe UsersController, type: :controller do
  describe 'GET #show' do
    subject { get :show, params: { id: user } }

    context 'given a user' do
      let(:user) { create(:user) }

      it 'assigns it to @user' do
        subject
        expect(assigns(:user)).to eq user
      end
    end
  end
end
