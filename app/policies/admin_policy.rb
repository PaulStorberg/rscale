class AdminPolicy < Struct.new(:user, :admin)

  attr_reader :user, :admin

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.has_role? :admin
  end

  def edit?
    update?
  end

  def update?
    @user.has_role?(:admin)
  end

  def show?
    @user.has_role? :admin
  end
end
