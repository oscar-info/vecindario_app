class ProjectsController < ApplicationController
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
end