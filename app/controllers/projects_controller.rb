class ProjectsController < ApplicationController

    before_action :authenticate_user!, only: [:create, :update]

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
        if(Current.user && @project.user_id == Current.user.id)
            render json: @project, status: :ok
        else
            render json: {error: 'Not Found'}, status: :not_found
    end

    #creacion project POST /projects
    def create
        @project = Current.user.projects.create!(create_params)
        render json: @project, status: :created
    end

    #creacion project PUT /projects/{id}
    def update
        @project = Current.user.projects.find(params[:id])
        @project.update!(update_params)
        render json: @project, status: :ok
    end

    private

    def create_params
        params.require(:project).permit(:name_project, :type_project, :city, :address, :price, :area, :subsidy, :restroom, :parking, {list_emails: []})
    end

    def update_params
        params.require(:project).permit(:name_project, :type_project, :city, :address, :price, :area, :subsidy, :restroom, :parking, :list_emails)
    end

    def authenticate_user!
        token_regex = /Bearer (\w+)/
        headers = request.headers
        if headers['Authorization'].present? && headers['Authorization'].match(token_regex)
            token = headers['Authorization'].match(token_regex)[1]
            if(Current.user = User.find_by_auth_token(token))
                return
            end
        end
        render json: {error: 'Unauthorized'}, status: :unauthorized
    end
end
end