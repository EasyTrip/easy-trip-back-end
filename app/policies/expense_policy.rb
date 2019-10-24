# frozen_string_literal: true

class ExpensePolicy < ApplicationPolicy
  def index?
    not_guest?
  end

  def show?
    not_guest?
  end

  def create?
    not_guest?
  end

  def update?
    not_guest?
  end

  def destroy?
    not_guest?
  end
end
