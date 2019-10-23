# frozen_string_literal: true

class TripPolicy < ApplicationPolicy
  def create?
    not_guest? && user.has_role?(Role::ADMIN)
  end
end
