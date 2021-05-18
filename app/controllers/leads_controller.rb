class LeadsController < ApplicationController
    #GET /lead
    def index
        @leads = Lead.all
        render json: @leads, status: :ok

    end

    #GET /lead/{id}
    def show
        @lead = Lead.find(params[:id])
        render json: @lead, status: :ok
    end
end
