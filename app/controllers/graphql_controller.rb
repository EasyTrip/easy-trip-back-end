# frozen_string_literal: true

class GraphqlController < ApplicationController
  def execute
    result = EasyTripBackEndSchema.execute(params[:query],
                                           variables: ensure_hash(params[:variables]),
                                           context: context,
                                           operation_name: params[:operationName])
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development e
  end

  private

  def context
    { current_user: current_user, pundit: self }
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      ambiguous_param.present? ? ensure_hash(JSON.parse(ambiguous_param)) : {}
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(error)
    logger.error error.message
    logger.error error.backtrace.join("\n")
    render json: { error: { message: error.message, backtrace: error.backtrace }, data: {} },
           status: 500
  end
end
