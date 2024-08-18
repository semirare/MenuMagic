# frozen_string_literal: true

class Api::V1::ApiController < ApplicationController
  protect_from_forgery with: :null_session

  def render_error(status, errors)
    render json: { errors: }, status:
  end
end
