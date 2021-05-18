class ProjectsController < ApplicationController

    rescue_from Exception do |e|
        render json: {error: e.message}, status: :internal_error
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
    end

    #metodo para listar los proyectos GET /project
    def index
        @projects = Project.all
        render json: @projects, status: :ok
    end

    #mostrar el detalle de un proyecto GET /project/{id}
    def show
        @project = Project.find(params[:id])
        render json: @project, status: :ok
    end

    #creacion project POST /projects
    def create
        @project = Project.create!(create_params)
        render json: @project, status: :created
    end

    #creacion project PUT /projects/{id}
    def update
        @project = Project.find(params[:id])
        @project.update!(update_params)
        render json: @project, status: :ok
    end

    private

    def create_params
        params.require(:project).permit(:name_project, :type_project, :city, :address, :price, :area, :subsidy, :restroom, :parking, {list_emails: []}, :user_id)
    end

    def update_params
        params.require(:project).permit(:name_project, :type_project, :city, :address, :price, :area, :subsidy, :restroom, :parking, :list_emails)
    end
end