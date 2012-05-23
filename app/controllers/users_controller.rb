class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Thank you for signing up! You are now logged in."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end

  def rate
    @user = User.find(params[:id])
    @user.rate(params[:stars], current_user, params[:dimension])
    render :update do |page|
      page.replace_html @user.wrapper_dom_id(params), ratings_for(@user, params.merge(:wrap => false))
      page.visual_effect :highlight, @user.wrapper_dom_id(params)
    end
  end

end
