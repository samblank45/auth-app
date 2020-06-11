class Api::UsersController < ApplicationController

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      render 'show.json.jb'
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def index
    if current_user
      @users = User.all
      render 'index.json.jb'
    else 
      render json: []
    end
  end

  def show
    if current_user
      @user = User.find_by(id: params[:id])
      render 'show.json.jb'
    else
      render json: []
    end
  end

end
