# frozen_string_literal: true

class BookingPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    return @user && @user.has_any_role?(:buyer, :admin)
  end

  def show?
    return index?
  end

  def create?
    return index?
  end

  def new?
    create?
  end

  def update?
    return @user && @user.has_any_role?(:admin, :seller)

  end

  def edit?
    return update?

  end

  def destroy?
    return create?
    # return @user.has_any_role?(:admin, :seller)
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
