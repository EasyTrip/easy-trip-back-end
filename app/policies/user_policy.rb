# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    not_guest?
  end

  def show?
    not_guest?
  end
end
