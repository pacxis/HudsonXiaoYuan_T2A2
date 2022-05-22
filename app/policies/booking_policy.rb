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
    return create?
  end

  def update?
    return index?
  end

  def edit?
    return update?
  end

  def destroy?
    return @user && @user.has_any_role?(:seller, :buyer)
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
