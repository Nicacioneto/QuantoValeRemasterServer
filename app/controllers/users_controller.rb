class UsersController < ApplicationController

skip_before_filter :verify_authenticity_token, :only => [:update]

  def create
    User.create(user_params);
  end

  def show
    @users = User.all
    render json: @users
  end

  def ranking
    @users = User.order(score: 'desc')
    render json: @users
  end

  def user_params
    params.require(:user).permit(:name,:email,:score)
  end

end
