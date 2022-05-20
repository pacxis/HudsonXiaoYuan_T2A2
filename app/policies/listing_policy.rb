# frozen_string_literal: true

class ListingPolicy
  attr_reader :user, :record, :listing

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    return @user && @user.has_any_role?(:seller)
  end

  def new?
    create?
  end

  def update?
    return @user && @user.has_any_role?(:admin, :seller)
  #   puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  #   puts @user.user_profile
  #   puts @listing
  #   return (@user.has_any_role?(:seller, :admin) && @user.user_profile.id == @record.user_profile_id)
  end

  def edit?
    return update?
  #   puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  #   puts @user.user_profile.id
  #   puts @listing
  #   return @user.has_any_role?(:seller, :admin
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
