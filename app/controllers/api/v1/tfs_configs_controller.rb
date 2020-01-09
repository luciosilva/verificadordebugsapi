module Api
  module V1
    class TfsConfigsController < ApplicationController
      before_action :set_tfs_config, only: [:show, :update, :destroy]

      # GET /tfs_configs
      def index
        @tfs_configs = TfsConfig.all

        render json: @tfs_configs
      end

      # GET /tfs_configs/1
      def show
        render json: @tfs_config
      end

      # POST /tfs_configs
      def create
        @tfs_config = TfsConfig.new(tfs_config_params)

        if @tfs_config.save
          render json: @tfs_config, status: :created, location: @tfs_config
        else
          render json: @tfs_config.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /tfs_configs/1
      def update
        if @tfs_config.update(tfs_config_params)
          render json: @tfs_config
        else
          render json: @tfs_config.errors, status: :unprocessable_entity
        end
      end

      # DELETE /tfs_configs/1
      def destroy
        @tfs_config.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_tfs_config
          @tfs_config = TfsConfig.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def tfs_config_params
          params.require(:tfs_config).permit(:connection_string, :login, :password)
        end
    end
  end
end