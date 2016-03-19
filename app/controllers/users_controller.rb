class UsersController < ApplicationController

skip_before_filter :verify_authenticity_token, :only => [:update]

  def create
    @user = User.new(user_params);
    @use.create;
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
