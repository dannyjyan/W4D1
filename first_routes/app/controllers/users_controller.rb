class UsersController < ApplicationController
  def index
    users = User.all
    render json: users 

  end

  def create
    # params = {
    #   user: {
    #     username: "Carly",
    #     email: "alksdjfklsdj"
    #   }
    # }
    # user = User.new(username: params[:user][:username])

    user = User(user_params)
    #user = User.new(name: params['user']['name'], email: params['user']['email'])
    # replace the `user_attributes_here` with the actual attribute keys
    if user.save!
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    # render plain: "whew"
    if user == nil
      render plain: "User not found"
    else 
      render json: user
    end
  end

  def update
    user = User.find_by(id: params[:id])
    # render plain: "whew"
    if user
      user.update(user_params)
      render json: user
      # render json: User.all
    else 
      render plain: "User not found"
    end
  end 

  def destroy
    user = User.find_by(id: params[:id])
    if user
      user.delete
      render json: user
      # render json: User.all
    else 
      render plain: "User not found"
    end 
  end

  private 
  def user_params
    params.require(:user).permit(:name, :email)
  end 


end 