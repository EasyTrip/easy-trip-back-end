# frozen_string_literal: true

module PunditHelpers
  private

  def authorize(record, action)
    context[:pundit].send(:authorize, record, action)
  end
end
