module Api
  module V1
    class ApiController < ActionController::API

      def render_errors(obj, status = :unprocessable_entity)
        render json: { errors: obj.errors }, status: status
      end

    end
  end
end