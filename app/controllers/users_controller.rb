class UsersController < ApplicationController

    before_action :authorize_resquest, except: :create 
    before_action :find_user, except: %i[create index]

    # GET /users
    def index
        @users = User.all
        render json: @users, status: :ok
    end

    # GET /users/{id}
    def show

        begin
            @user = User.find(params[:id])
            
            render json: @user, status: :ok
        rescue ActiveRecord::RecordNotFound
            render json: {error: 'Not Found'}, status: :not_found
        end
    end

    # POST /users
    def create
        @user = User.new(user_params)
        
        if @user.save
            render json: @user, status: :created
        else
            render json: { errors: @user.errors.full_messages },
                   status: :unprocessable_entity
        end
    end

    # PUT /users/{email}
    def update
        unless @user.update(user_params)
            render json: { errors: @user.errors.full_messages },
                   status: :unprocessable_entity
        end
    end

    # DELETE /users?{email}
    def destroy
        @user.destroy
    end

    private

    def find_user
        @user = User.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'User not found' }, status: :not_found
    end

    def user_params
        params.permit(
            :name, :last_name, :phone, :email, :password
        )
    end
end