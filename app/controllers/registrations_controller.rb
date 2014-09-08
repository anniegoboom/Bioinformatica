class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:info] = 'Registrations are not allowed, please contact joe or annie'
    redirect_to root_path
  end

  def create
    flash[:info] = 'Registrations are not allowed, please contact joe or annie'
    redirect_to root_path
  end
end
