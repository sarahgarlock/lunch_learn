class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save && params[:password] == params[:password_confirmation]
      api_key = SecureRandom.hex(24)
      @user.update(api_key: api_key)
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: "Passwords don't match or email is alreay in use" }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
