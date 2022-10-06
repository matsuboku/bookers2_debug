class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @books = @user.books.page(params[:page])
    @today_book =  @books.created_today
    @yesterday_book = @books.created_yesterday
    @this_week_book = @books.created_this_week
    @last_week_book = @books.created_last_week

  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit

  end

  def update
    @books = Book.all
    if @user.update(user_params)
      redirect_to user_path, notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def daily_posts

    user = User.find(params[:user_id])
    @books = user.books.where(created_at: params[:created_at].to_date.all_day)
    render :daily_posts_form
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
