class AuthorSessionsController < ApplicationController
  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(articles_path, notice: 'LOGGED IN SUCCESSFULLY')
    else
      flash.now.alert = "LOGIN FAILED"
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:authors, notice: 'LOGGED OUT')
  end
  
end
