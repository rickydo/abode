require 'rails_helper'

describe UsersController do
<<<<<<< HEAD
  describe 'sign up' do
    it 'should show sign up page without session active' do
      get :new
      expect(response.status).to eq 200
      expect(response).to render_template(:new)
    end

    it 'should redirect to show page if user is created successfully' do
      get :new

      # post :create, user: {}
    end
  end
end
