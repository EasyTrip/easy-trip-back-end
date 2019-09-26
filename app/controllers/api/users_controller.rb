# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    skip_before_action :authenticate_request!, only: [:create]

    def index
      users = User.with_attached_avatar.contacts(current_user)
      render json: UserSerializer.new(users, avatar_url).serialized_json, status: :ok
    end

    def create
      render Users::Create.call user_params
    end

    def update
      user = User.find params[:id].to_i
      # user.update_attributes user_params
      avatar = user.avatar
      avatar.attach(params[:image]) if params[:image]
      render json: { avatar: url_for(avatar) }, status: :ok
    end

    def show
      user = User.find params[:id].to_i
      render json: UserSerializer.new(user, avatar_url).serialized_json
    end

    def current
      render json: UserSerializer.new(current_user, avatar_url).serialized_json
    end

    private

    def user_params
      params.require(:user).permit(:email,
                                   :first_name,
                                   :last_name,
                                   :password,
                                   :password_confirmation)
    end

    def avatar_url
      url_callback = ->(attachment) { attachment.attached? ? url_for(attachment) : nil }
      { params: { avatar_url: url_callback } }
    end
  end
end
