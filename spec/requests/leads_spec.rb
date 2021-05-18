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

    describe "POST /leads" do
        let!(:project) { create(:project) }

        it "should create a lead" do
        req_payload = {
            lead: {
                name: "Luis",
                last_name: "Mondragon",
                phone: 23882398,
                email: "luis.mondragon@gmail.com",
                creation_date: "2021-05-17",
                project_id: project.id
            }
        }

        post "/leads", params: req_payload
        payload = JSON.parse(response.body)
        expect(payload).to_not be_empty
        expect(payload["id"]).to_not be_nil
        expect(response).to have_http_status(:created)
        end

        it "should return error message on invalidlead" do
            req_payload = {
                lead: {
                    last_name: "Mondragon",
                    phone: 23882398,
                    email: "luis.mondragon@gmail.com",
                    creation_date: "2021-05-17",
                    project_id: project.id
                }
            }
    
            post "/leads", params: req_payload
            payload = JSON.parse(response.body)
            expect(payload).to_not be_empty
            expect(payload["error"]).to_not be_nil
            expect(response).to have_http_status(:unprocessable_entity)
        end
    end

    describe "PUT /leads/{id}" do
        let!(:lead) { create(:lead) }

        it "should create a lead" do
            req_payload = {
                lead: {
                    name: "Jorge",
                    last_name: "Mondragon",
                    phone: 23882398,
                    email: "luis.mondragon@gmail.com",
                    creation_date: "2021-05-17",
                }
            }

            put "/leads/#{lead.id}", params: req_payload
            payload = JSON.parse(response.body)
            expect(payload).to_not be_empty
            expect(payload["id"]).to eq(lead.id)
            expect(response).to have_http_status(:ok)
        end

        it "should return error message on invalidlead" do
            req_payload = {
                lead: {
                    name: nil,
                    last_name: nil,
                    phone: 23882398,
                    email: "luis.mondragon@gmail.com",
                    creation_date: "2021-05-17"
                }
            }
    
            put "/leads/#{lead.id}", params: req_payload
            payload = JSON.parse(response.body)
            expect(payload).to_not be_empty
            expect(payload["error"]).to_not be_nil
            expect(response).to have_http_status(:unprocessable_entity)
        end
    end
end