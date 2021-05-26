class ProjectsController < ApplicationController
    before_action :authorize_resquest, except: :index

    rescue_from Exception do |e|
        render json: {error: e.message}, status: :internal_error
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
    end

    #metodo para listar los proyectos GET /project
    def index
        @projects = Project.all
        if !params[:search].nil? && params[:search].present?
            @projects = ProjectsSearchService.search(@projects, params[:search])
        end
        render json: @projects.includes(:user, :leads), status: :ok
    end

    #mostrar el detalle de un proyecto GET /project/{id}
    def show
        @project = Project.find(params[:id])
        render json: @project, status: :ok
    end

    #creacion project POST /projects
    def create
        #byebug
        @project = Project.new(create_params)
        @project.user_id = @current_user.id
        @project.save
        #@project = Project.create(name_project: "prueba", subsidy: true, parking: true, user_id: @current_user.id)
        #byebug
        render json: @project, status: :created
    end

    #creacion project PUT /projects/{id}
    def update
        @project = Projects.find(params[:id])
        @project.update!(update_params)
        render json: @project, status: :ok
    end

    #########
    #Muestra los proyectos asociados a un user id
    def showProjectsByUserId
        @project = Project.where(user_id: params[:id])

        if @project.empty?
            render json: {error: 'Not Found'}, status: :not_found
        else
            render json: @project, status: :ok
        end
    end

    private

    def create_params
        params.require(:project).permit(:name_project, :type_project, :city, :address, :price, :area, :subsidy, :restroom, :parking, {list_emails: []})
    end

    def update_params
        params.require(:project).permit(:name_project, :type_project, :city, :address, :price, :area, :subsidy, :restroom, :parking, {list_emails: []})
    end
end
