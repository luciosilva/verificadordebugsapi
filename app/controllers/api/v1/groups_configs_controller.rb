module Api
  module V1
    class GroupsConfigsController < ApplicationController
      before_action :set_groups_config, only: [:show, :update, :destroy]

      # GET /groups_configs
      def index
        @groups_configs = GroupsConfig.all

        render json: @groups_configs
      end

      # GET /groups_configs/1
      def show
        render json: @groups_config
      end

      # POST /groups_configs
      def create
        @groups_config = GroupsConfig.new(groups_config_params)

        if @groups_config.save
          render json: @groups_config, status: :created, location: @groups_config
        else
          render json: @groups_config.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /groups_configs/1
      def update
        if @groups_config.update(groups_config_params)
          render json: @groups_config
        else
          render json: @groups_config.errors, status: :unprocessable_entity
        end
      end

      # DELETE /groups_configs/1
      def destroy
        @groups_config.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_groups_config
          @groups_config = GroupsConfig.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def groups_config_params
          params.require(:groups_config).permit(:tfs_query, :name, :tfs_config_id)
        end
    end
  end
end