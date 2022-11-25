class Api::V1::UserController < ApplicationController
  # before_action :set_user, only: %i[ show edit update destroy ]
  def index
    @users = User.all
    render json: @users
  end

  # def show
  #   render json: @user
  # end
  # def new
  #    @user = User.new

  # end

  # def create
  #    @user = User.create(user_params)
  #   render json: @users
  # end

  # def update
  # end

  # def destroy 
  # end
end