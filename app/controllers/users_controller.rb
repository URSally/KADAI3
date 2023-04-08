class UsersController < ApplicationController

  def new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book=Book.new

  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] ="You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def edit
     @user=User.find(params[:id])
     @books=@user.books
    if @user == current_user
       render :edit
    else
       redirect_to user_path(current_user)
    end
  end

  def index
    @user=current_user
    @book=Book.new
    @users=User.all
  end



  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end


end
