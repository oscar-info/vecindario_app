class LeadsController < ApplicationController

    rescue_from Exception do |e|
        log.error "#{e.message}"
        render json: {error: e.message}, status: :internal_error
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
    end

    #GET /leads
    def index
        @leads = Lead.all
        render json: @leads, status: :ok

    end

    #GET /leads/{id}
    def show
        @lead = Lead.find(params[:id])
        render json: @lead, status: :ok
    end

    #POST /leads
    def create
        @lead = Lead.create!(create_params)
        render json: @lead, status: :created
    end

    #PUT /leads/{id}
    def update
        @lead = Lead.find(params[:id])
        @lead.update!(update_params)
        render json: @lead, status: :ok
    end

    private

    def create_params
        params.require(:lead).permit(:name, :last_name, :email, :phone, :creation_date, :project_id)
    end

    def update_params
        params.require(:lead).permit(:name, :last_name, :email, :phone, :creation_date)
    end
end
