class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :bookmarks, :favorites, :entries, :confirm]
  before_action :correct_user, only: [:edit, :destroy]
  
  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def bookmarks
  end

  def favorites
  end

  def entries
  end

  def confirm
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user), alert: "他の会員の情報編集・削除は禁止です"
    end
  end
end
