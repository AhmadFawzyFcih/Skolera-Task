class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      options = {}
      options[:meta] = { status: true }
      options[:params] = {base_url: base_url}
      render json: UserSerializer.new(resource , options).serialized_json, status: :ok 
    end

    def respond_to_on_destroy
      render json: {data: 'you logged out successfully...!' , meta: {status: true} } , status: :ok
    end
end