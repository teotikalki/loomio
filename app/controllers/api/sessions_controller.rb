class API::SessionsController < Devise::SessionsController

  def create
    if self.resource = warden.authenticate(scope: resource_name)
      sign_in(resource_name, resource)
      flash[:notice] = t(:'devise.sessions.signed_in')
      render json: CurrentUserSerializer.new(resource).as_json
    else
      render json: { errors: { password: [t(:"devise.failure.invalid")] } }, status: 401
    end
  end

  def destroy
    sign_out
    flash[:notice] = t(:'devise.sessions.signed_out')
    head :ok
  end
end
