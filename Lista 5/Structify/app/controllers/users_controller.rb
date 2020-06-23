class UsersController < ApplicationController

  def create
    user = User.new(songs_params)
    begin
      user.save!
      flash[:notice] = "Usuário de email #{user.email} criado com sucesso!"
      redirect_to root_path
    rescue => err
      flash[:notice] = err
      redirect_to new_user_path
    end
  end

  def new
    @user = User.new
  end

  private
  def users_params
    params.require('user').permit(:email, :password)
  end

end