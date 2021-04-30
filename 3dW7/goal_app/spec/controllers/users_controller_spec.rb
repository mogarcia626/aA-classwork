require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    subject(:user) do
        User.create!(
        username: "mogarcia",
        password: "1234567")
    end

    describe 'GET #new' do
        it 'renders the new links page' do
            get :new, link: {}
            expect(response).to redner_template('new')
            expect(response).to have_http_status(200)
        end
    end

    describe 'POST #create' do
        context 'with invalid params' do
            it 'validates the presence of username and password' do
                post :create, params: {user:
                {username: 'mogarcia', password: ""  }}
                expect(response).to render_template('new')
                expect(flas[:errors]).to be_present
            end
        end
        context 'with valid params' do
            it 'redirects to the #show' do
            post :create, params: {user:{
                username: 'mogarcia', password: '1234567'
            }}
            expect(response).to redirect_to(user_url(:user))
            end
        end
    end    
end
