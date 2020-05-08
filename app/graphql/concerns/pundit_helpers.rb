# frozen_string_literal: true

module PunditHelpers
  SUPPORTED_ACTIONS = %w[index? show? create? update? destroy?].freeze
  QUERY_SUFFIX = 'Query'

  # if action is not passed, method will try to find corresponding action from receiver's class name
  def authorize(record, action = nil)
    action ||= guess_action!
    context[:pundit].send(:authorize, record, action)
  end

  private

  def guess_action!
    action = if is_a?(::Mutations::BaseMutation)
               mutation_class_action + '?'
             elsif is_a?(::Queries::BaseQuery)
               singular?(query_class_action) ? 'show?' : 'index?'
             end
    return action if SUPPORTED_ACTIONS.include?(action)

    raise ArgumentError, I18n.t('graphql.errors.policy_action',
                                action: action, class_name: self.class)
  end

  def mutation_class_action
    self.class.name.split('::').last.split(/(?=[A-Z])/).first.downcase
  end

  def query_class_action
    self.class.name.split('::').last.delete_suffix(QUERY_SUFFIX)
  end

  def singular?(string)
    string.singularize == string
  end
end
