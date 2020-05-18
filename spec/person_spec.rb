require 'rspec'
require_relative '../lib/person'

describe Person do
  before :all do
    @sherman = Person.new('Sherman Klump', 'sklump@yeswecan.com', 'silly_password')
  end

  it 'should add person with full name, email, and password' do
    expect(@sherman.full_name).to eq 'Sherman Klump'
    expect(@sherman.email).to eq 'sklump@yeswecan.com'
    expect(@sherman.password).to eq 'silly_password'
  end

  it 'should let a person create group' do
    expect(@sherman.owned_groups.length).to eq 0
    owned_group = @sherman.create_group('Shape Up')

    expect(owned_group.owner.full_name).to eq @sherman.full_name
    expect(owned_group.name).to eq 'Shape Up'
    expect(@sherman.owned_groups.length).to eq 1
  end

  it 'should let a person join a group, and see its participants' do
    monica = Person.new('Monica Geller', 'mgeller@yeswecan.com', 'another_silly_password')
    group = monica.create_group('Best Menus')
    expect(group.participants.length).to eq 0
    expect(@sherman.joined_groups.length).to eq 0
    @sherman.join_group(group)

    expect(@sherman.joined_groups.length).to eq 1
    expect(@sherman.joined_groups.first.participants.length).to eq 1
    expect(@sherman.joined_groups.first.participants.first.full_name).to eq 'Sherman Klump'
  end

  it 'should let a person record weight per week' do
    @sherman.weight_per_week = { 1 => 200 }

    begin
      @sherman.weight_per_week
    rescue NoMethodError => e
      expect(e.message).to include 'undefined method'
    end
  end
end
