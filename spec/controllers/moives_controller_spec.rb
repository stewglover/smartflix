require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe 'GET show' do
    it 'renders movie object' do
      get(:show)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Mary Poppins')
    end
  end
end
