# frozen_string_literal: true

class TripPolicy < ApplicationPolicy
  def index?
    not_guest?
  end

  def show?
    not_guest? && accessible?
  end

  def create?
    not_guest?
  end

  def update?
    not_guest? && accessible?
  end

  def destroy?
    not_guest? && accessible?
  end

  private

  def accessible?
    record.creator == user || admin?
  end
end
