require 'rails_helper'

RSpec.describe 'Submissions API', type: :request do
  describe 'POST /submissions' do
    let(:valid_attributes){
      {
          first_name: 'Olakunle',
          last_name: 'Salami',
          email_address: 'kunsal@email.com',
          slogan: 'This shall be called boulder tour'
      }
    }

    context 'when the request is valid' do
      before { post '/submissions', params: {
        first_name: 'Olakunle',
        last_name: 'Salami',
        email_address: 'kunsal@email.com',
        slogan: 'This shall be called boulder tour'
      } }

      # it 'creates a submission' do
      #   expect(json['first_name']).to eq("Olakunle")
      #   expect(json['last_name']).to eq('Salami')
      #   expect(json['email_address']).to eq('kunsal@email.com')
      # end

      it 'returns a status of 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when first name is empty' do
      before { post '/submissions', params: {} }

      it 'should return status 400' do
        expect(response).to have_http_status(400)
      end
    end

    context 'when last name is empty' do
      before { post '/submissions', params: { first_name: 'Ola' } }

      it 'should return status 400' do
        expect(response).to have_http_status(400)
      end
    end

    context 'when email address is empty' do
      before { post '/submissions', params: { first_name: 'Ola', last_name: 'Salam' } }

      it 'should return status 400' do
        expect(response).to have_http_status(400)
      end
    end

    context 'when email address is not valid' do
      before { post '/submissions', params: { first_name: 'Ola', last_name: 'Salam', email: 'hello' } }

      it 'should return status 400' do
        expect(response).to have_http_status(400)
      end
    end

    context 'when slogan is empty' do
      before { post '/submissions', params: { first_name: 'Ola', last_name: 'Salam', email: 'hello@email.com' } }

      it 'should return status 400' do
        expect(response).to have_http_status(400)
      end
    end

  end
end