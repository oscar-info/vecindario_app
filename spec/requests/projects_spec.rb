require "rails_helper"

#Implementando la prueba al endpoint
RSpec.describe "Projects", type: :request do

    describe "GET /projects" do
        it "should return OK" do
            get '/projects'
            playload = JSON.parse(response.body)
            expect(playload).to be_empty
            expect(response).to have_http_status(200)
        end

        describe "Search" do
            let!(:project1) { create(:project, name_project: 'proyecto 1') }
            let!(:project2) { create(:project, name_project: 'proyecto 2') }
            let!(:project3) { create(:project, name_project: 'project 3') }

            it "should filter projects" do
                get "/projects?search=proyecto"
                payload = JSON.parse(response.body)
                expect(payload).to_not be_empty
                expect(payload.size).to eq(2)
                expect(payload.map { |p| p["id"] }.sort).to eq([project1.id, project2.id].sort)
            end
        end
    end

    describe "With data in the DB" do
        let!(:projects) { create_list(:project, 10) }
        it "should return all the projects" do
            get '/projects'
            playload = JSON.parse(response.body)
            expect(playload.size).to eq(projects.size)
            expect(response).to have_http_status(200)
        end
    end

    describe "GET /projects/{id}" do
        let!(:project) { create(:project) }

        it "should return a project" do
            get "/projects/#{project.id}"
            playload = JSON.parse(response.body)
            expect(playload).to_not be_empty
            expect(playload["id"]).to eq(project.id)
            expect(response).to have_http_status(200)
        end
    end

    describe "POST /projects" do
        let!(:user) { create(:user) }

        it "should create a project" do
            req_payload = {
                project: {
                    name_project: "Name of project",
                    type_project: "Apartment",
                    city: "City project",
                    address: "address",
                    price: 12,
                    area: 56,
                    subsidy: true,
                    restroom: 2,
                    parking: false,
                    list_emails: ["ListOfEmails"],
                    user_id: user.id
                }
            }

            post "/projects", params: req_payload
            payload = JSON.parse(response.body)
            expect(payload).to_not be_empty
            expect(payload["id"]).to_not be_nil
            expect(response).to have_http_status(:created)
        end

        it "should return error message on invalid post" do
            req_payload = {
                project: {
                    type_project: "Apartment",
                    city: "City project",
                    address: "address",
                    price: 12,
                    area: 56,
                    subsidy: true,
                    restroom: 2,
                    parking: false,
                    list_emails: ["email1", "email2"],
                    user_id: user.id
                }
            }

            post "/projects", params: req_payload
            payload = JSON.parse(response.body)
            expect(payload).to_not be_empty
            expect(payload["error"]).to_not be_empty
            expect(response).to have_http_status(:unprocessable_entity)
        end
    end

    describe "PUT /projects/{id}" do
        let!(:project) { create(:project) }

        it "should create a project" do
            req_payload = {
                project: {
                    name_project: "Name of project",
                    type_project: "Apartment",
                    city: "City project",
                    address: "address",
                    price: 10,
                    area: 56,
                    subsidy: true,
                    restroom: 2,
                    parking: false,
                    list_emails: ["email1", "email2"]
                }
            }

            put "/projects/#{project.id}", params: req_payload
            payload = JSON.parse(response.body)
            expect(payload).to_not be_empty
            expect(payload["id"]).to eq(project.id)
            expect(response).to have_http_status(:ok)
        end

        it "should return error message on invalid post" do
            req_payload = {
                project: {
                    name_project: nil,
                    type_project: nil,
                    city: "City project",
                    address: "address",
                    price: 12,
                    area: 56,
                    subsidy: true,
                    restroom: 2,
                    parking: false,
                    list_emails: ["email1", "email2"]
                }
            }

            put "/projects/#{project.id}", params: req_payload
            payload = JSON.parse(response.body)
            expect(payload).to_not be_empty
            expect(payload["error"]).to_not be_empty
            expect(response).to have_http_status(:unprocessable_entity)
        end
    end
end