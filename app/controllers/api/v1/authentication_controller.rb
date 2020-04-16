module Api
  module V1
    class AuthenticationController < ApiController

      skip_before_action :authenticate_request

      def create
        command = AuthenticateUserApi.call(params[:login], params[:password])

        if command.success?
          render json: {auth_token: command.result}
        else
          render json: {error: command.errors}, status: :unauthorized
        end
      end

    end
  end
end