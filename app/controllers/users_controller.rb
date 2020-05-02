class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
  @user = User.new(user_params)
    if @user.save
      # 次のコードと等価
      # redirect_to user_url(@user)
    # これはredirect_to @userというコードから (Railsエンジニアが) user_url(@user)といったコードを実行したいということを、Railsが推察してくれた結果になります。
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      
    else 
      render 'new'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
