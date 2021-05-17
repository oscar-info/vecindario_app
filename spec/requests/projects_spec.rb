require "rails_helper"

#Implementando la prueba al endpoint
RSpec.describe "Projects", type: :request do

    describe "GET /project" do
        before { get '/project' }

        it "should return OK" do
            playload = JSON.parse(response.body)
            expect(playload).to be_empty
            expect(response).to have_http_status(200)
        end
    end

    describe "With data in the DB" do
        before { get '/project' }
        let(:projects) { create_list(:project, 10) }
        it "should return all the projects" do
            playload = JSON.parse(response.body)
            expect(playload.size).to eq(projects.size)
            expect(response).to have_http_status(200)
        end
    end

    describe "GET /project/{id}" do
        let(:project) { create(:project) }

        it "should return a project" do
            get "/project/#{project.id}"
            playload = JSON.parse(response.body)
            expect(playload).to_not be_empty
            expect(playload["id"]).to eq(post.id)
            expect(response).to have_http_status(200)
        end
    end
end