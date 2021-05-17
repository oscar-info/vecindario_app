require "rails_helper"

#Implementando la prueba al endpoint
RSpec.describe "Health endpoint", type: :request do

    describe "GET /health" do
        before { get '/health' }

        it "should return OK" do
            playload = JSON.parse(response.body)
            expect(playload).not_to be_empty
            expect(playload['api']).to eq('OK')
        end

        it "should return status code 200" do
            expect(response).to have_http_status(200)
        end
    end
end