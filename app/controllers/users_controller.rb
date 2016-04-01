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
    if(true)
          puts "Login"
          render json: User.find_by_email(params[:email])
          puts "Login"
          puts User.find_by_email(params[:email])
    elsif
        render json: User.find_by_email(params[:email])
        puts "Erro"
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
    params.require(:user).permit(:name , :email, :score, :idFacebook, :password,
      :password_confirmation)
  end

  private
  def login_params
    params.require(:user).permit(:email)
  end

end
