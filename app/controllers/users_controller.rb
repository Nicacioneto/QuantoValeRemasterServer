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
    user = User.find_by_email(params[:email])
    if !user.blank?
      if user && user.authenticate(params[:password])
        session[:user_token] = user.token
        render json: User.find_by(token: session[:user_token])
      end
    else
      user = User.create(user_params)
      User.login(user)
    end
  end

  def update_score
    user = User.find_by_email(params[:email])
    if user.update(score_params) && user.authenticate(params[:token])
      render json: User.find_by_email(params[:email])
      puts 'Score atualizado'
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

  private
  def score_params
    params.require(:user).permit(:score)
  end

end
