module Api
  module V1
    class BugsHistoriesController < ApplicationController
      before_action :set_bugs_history, only: [:show, :update, :destroy]

      # GET /bugs_histories
      def index
        @bugs_histories = BugsHistory.all

        render json: @bugs_histories
      end

      # GET /bugs_histories/1
      def show
        render json: @bugs_history
      end

      # POST /bugs_histories
      def create
        @bugs_history = BugsHistory.new(bugs_history_params)

        if @bugs_history.save
          render json: @bugs_history, status: :created, location: @bugs_history
        else
          render json: @bugs_history.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /bugs_histories/1
      def update
        if @bugs_history.update(bugs_history_params)
          render json: @bugs_history
        else
          render json: @bugs_history.errors, status: :unprocessable_entity
        end
      end

      # DELETE /bugs_histories/1
      def destroy
        @bugs_history.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_bugs_history
          @bugs_history = BugsHistory.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def bugs_history_params
          params.require(:bugs_history).permit(:name, :title, :url, :dt_created, :dt_resolution, :subproject, :environment, :id_groups_configs, :name_groups_configs)
        end
    end
  end
end