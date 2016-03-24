class UsersController < ApplicationController

skip_before_filter :verify_authenticity_token, :only => [:update]

  def create
    if (User.create(user_params).valid?)
        puts ("true")
      elsif
        puts(" false")
      end
  end

  def show
    @users = User.all
    render json: @users
  end

  def ranking
    @users = User.order(score: 'desc')
    render json: @users
  end

  private
  def user_params
    params.require(:user).permit(:name , :email, :score, :idFacebook)
  end

end
