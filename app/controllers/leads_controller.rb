class LeadsController < ApplicationController

    rescue_from Exception do |e|
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
        # @lead = Lead.find(params[:id])
        # render json: @lead, status: :ok
        begin
            @lead = Lead.find(params[:id])
            render json: @lead, status: :ok
        rescue ActiveRecord::RecordNotFound
            render json: {error: 'Not Found'}, status: :not_found
        end
    end

    #POST /leads
    def create
        #byebug
        @lead = Lead.create!(create_params)
        render json: @lead, status: :created
    end

    #PUT /leads/{id}
    def update
        @lead = Lead.find(params[:id])
        @lead.update!(update_params)
        render json: @lead, status: :ok
    end

    ##################
    # Muestra los leads asociados a un proyecto
    def showLeadsByProject
        @leads = Lead.where(project_id: params[:id])

        if @leads.empty?
            render json: {error: 'Not Found'}, status: :not_found
        else
            render json: @leads, status: :ok
        end
    end

    private

    def create_params
        params.require(:lead).permit(:name, :last_name, :email, :phone, :project_id)
    end

    def update_params
        params.require(:lead).permit(:name, :last_name, :email, :phone)
    end
end
