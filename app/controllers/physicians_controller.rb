class PhysiciansController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def index
    @physicians = User.where(user_type: "physician")
  end

  def show
    respond_with(@physician)
  end

  def new
    @physician = User.new
  end

  def edit
    @physician = User.find(params[:id])
  end

  def create
    @physician = User.new(physician_params)
    @physician.email     = "#{SecureRandom.base64}@physician.com"
    @physician.user_code = "physician"
    @physician.password  = "physician"
    @physician.is_change_password = false
    @physician.user_type = "physician"

    if @physician.save
      @physician.update_attributes(password: "physician#{@physician.id}", user_code: "physician#{@physician.id}")
      redirect_to physicians_path
    else
      render "new"
    end
  end

  def update
    @physician = User.find(params[:id])
    @physician.update(physician_params)
    redirect_to physicians_path
  end

  def destroy
    @physician = User.find(params[:id])
    @physician.delete
    redirect_to physicians_path
  end

  private
    def set_physician
      @physician = Physician.find(params[:id])
    end

    def physician_params
      params.require(:user).permit(:first_name, :last_name, :birthdate, :gender)
    end
end
