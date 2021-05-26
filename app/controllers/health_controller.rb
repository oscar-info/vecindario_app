class HealthController < ApplicationController
    def health
        # constante ok = 200
        render json: {api: 'OK'}, status: :ok
    end
end