class UsersController < ApplicationController

skip_before_filter :verify_authenticity_token, :only => [:update]

  def create
    if (User.create(user_params).valid?)
          User.create(user_params)
          puts "Delete"
    elsif
          User.find_by(email: user_params.email)
        puts "Delete"
      end
  end

  def login
    if( User.where(login_params).exists? )
          puts "Login"
          render json: User.find_by(login_params)
    elsif
        #render json: User.find_by(login_params)
        puts User.where(login_params).exists?
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

  private
  def login_params
    params.require(:user).permit(:email)
  end

end
