class UsersController < ApplicationController
  def index
    # search_string = params[:search]
    # render json: User.select(:username, :id).where('LOWER(username) LIKE ?', "%#{search_string.downcase}%")
  end

  def login; end

  def signed_in
    user = User.find_by(username: params[:username])
    if user && user.password == params[:password]
      cookies['token'] = user.token
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def new; end

  def logout
    cookies['secret'] = nil
    current_user.update_token if current_user
    redirect_to '/'
  end

  def create
    return if User.find_by(username: params[:username]).present?

    user = User.new(username: params[:username])
    user.password = params[:password]
    user.save
    cookies['token'] = user.token
    redirect_to '/'
  end

  def search
    results = User.where('lower(username) LIKE ?', "%#{params[:username].downcase}%")
    render json: { results: }, status: 200
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
