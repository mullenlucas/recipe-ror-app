require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns a 200 OK status' do
      get new_user_registration_path
      expect(response.status).to eq(200)
    end

    it 'it contains the Email placeholder text input' do
      get 'http://localhost:3000/users/sign_up'
      expect(response.body).to include('Email')
    end
  end
end
