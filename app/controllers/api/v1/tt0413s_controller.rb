module Api
  module V1
    class Tt0413sController < ApiController

      skip_before_action :authenticate_request, only: [:create]

      def create
        tt0413 = Tt0413.new(tt0413_params)
        if tt0413.save
          render json: {}, status: :created
        else
          render_errors(tt0413, :bad_request)
        end
      end

      private

      def tt0413_params
        params.permit(:first_name, :last_name, :email, :phone, :company, :job, :country)
      end

    end
  end
end
