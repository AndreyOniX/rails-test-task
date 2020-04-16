module Api
  module V1
    class ApiController < ActionController::API

      before_action :authenticate_request

      attr_reader :current_user

      def render_errors(obj, status = :unprocessable_entity)
        render json: { errors: obj.errors }, status: status
      end

      private

      def authenticate_request
        @current_user = AuthorizeApiRequest.call(request.headers).result
        render json: {error: 'Not Authorized'}, status: :unauthorized unless @current_user
      end

    end
  end
end