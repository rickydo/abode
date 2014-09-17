class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to action: "show", id: @user.id
    else
      flash.now[:error] = "Try again"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
    end
end
