class AdminUsersController < ApplicationController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  # GET /admin_users
  def index
    @admin_users = AdminUser.all
  end

  # GET /admin_users/1
  def show
  end

  # GET /admin_users/new
  def new
    @admin_user = AdminUser.new
  end

  # GET /admin_users/1/edit
  def edit
  end

  # POST /admin_users
  def create
    @admin_user = AdminUser.new(admin_user_params)

    if @admin_user.save
      redirect_to @admin_user, notice: 'Admin user was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin_users/1
  def update
    if @admin_user.update(admin_user_params)
      redirect_to @admin_user, notice: 'Admin user was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin_users/1
  def destroy
    @admin_user.destroy
    redirect_to admin_users_url, notice: 'Admin user was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = AdminUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_user_params
      params.require(:admin_user).permit(:name)
    end
end
