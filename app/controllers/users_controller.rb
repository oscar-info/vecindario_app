class UsersController < ApplicationController

    # before_action :authorize_resquest, except: :create
    # before_action :find_user, except: %i[create index]

    # GET /users
    def index
        @users = User.all
        render json: @users, status: :ok
    end

    # GET /users/{email}
    def show
        render json: @user, status: :ok
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
        @user = User.find_by_email!(params[:email])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'User not found' }, status: :not_found
    end

    def user_params
        params.permit(
            :name, :last_name, :phone, :email, :auth_token
        )
    end
end