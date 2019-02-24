class SessionsController < Devise::SessionsController

    private

    def respond_with(resource, _opts = {})
      render_resource(resource)
    end

    def respond_to_on_destroy
      render json: {data: 'you logged out successfully...!' , meta: {status: true} } , status: :ok
    end
end