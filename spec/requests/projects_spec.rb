require "rails_helper"

#Implementando la prueba al endpoint
RSpec.describe "Projects", type: :request do

    describe "GET /projects" do
        before { get '/projects' }

        it "should return OK" do
            playload = JSON.parse(response.body)
            expect(playload).to be_empty
            expect(response).to have_http_status(200)
        end

        # it "should return 404 if post not exists" do
        #     get "/projects/0"

        #     expect(response).to have_http_status(404)
        # end
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
end