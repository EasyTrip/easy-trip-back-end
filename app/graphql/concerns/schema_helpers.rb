# frozen_string_literal: true

module SchemaHelpers
  private

  def current_user
    context[:current_user]
  end
end
