require "rails_helper"

RSpec.describe "Leads", type: :request do

    describe "GET /leads" do
        before { get '/leads' }

        it "should return OK" do
            playload = JSON.parse(response.body)
            expect(playload).to be_empty
            expect(response).to have_http_status(200)
        end
    end

    describe "with data in the DB" do
        let!(:leads) { create_list(:lead, 5) }

        it "should return all the leads" do
            get "/leads"
            playload = JSON.parse(response.body)
            expect(playload.size).to eq(leads.size)
            expect(response).to have_http_status(200)
        end
    end

    describe "GET /leads/{id}" do
        let!(:lead) { create(:lead) }

        it "should return a lead" do
            get "/leads/#{lead.id}"
            playload = JSON.parse(response.body)
            expect(playload).to_not be_empty
            expect(playload["id"]).to eq(lead.id)
            expect(response).to have_http_status(200)
        end
    end
end