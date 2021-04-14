class ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end

  Actions = [:create, :retrieve, :update, :delete]

  delegate :user, :session, to: :@user_context

  def initialize(user_context, record)
    @user_context = user_context
    @record = record
  end

  Actions.each do |action|
    define_method "#{action}?" do
      authorized?(action)
    end
  end

  private
    def resource_name
      class_name = (@record.is_a? Class) ? @record.name : @record.class.name
      class_name.demodulize.underscore
    end

    def has_role?(r)
      session[:roles].include?(r)
    end

    def has_permission?(p)
      session[:permissions].include?(p)
    end

    def is_admin?
      'admin' == user.username || has_role?('admin')
    end

    def authorized?(action)
      nil != user && (is_admin? || has_permission?("#{action}_#{resource_name}"))
    end
end
