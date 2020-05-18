require_relative 'group'

class Person
  attr_accessor :full_name, :email, :password, :owned_groups, :joined_groups
  attr_writer :weight_per_week

  def initialize(full_name, email, password)
    @full_name = full_name
    @email = email
    @password = password
    @owned_groups = []
    @joined_groups = []
    @weight_per_week = {}
  end

  def create_group(name)
    group = Group.new(name, self)
    @owned_groups << group
    group
  end

  def join_group(group)
    group.participants << self
    @joined_groups << group
    group
  end

  def weight_loss_percentage
    last_week = @weight_per_week.keys.max
    (@weight_per_week[1].to_f - @weight_per_week[last_week].to_f)/@weight_per_week[1]
  end  
end
