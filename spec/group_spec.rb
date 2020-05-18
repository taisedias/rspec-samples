require 'rspec'
require_relative '../lib/person'

describe Group do
  before :each do
    @sherman = Person.new('Sherman Klump', 'sklump@yeswecan.com', 'silly_password')
    @shape_up = @sherman.create_group('Shape Up')
  end
  
  it 'should show participant weight loss percentages' do
    adele = Person.new('Adele', 'adele@yeswecan.com', 'adele_silly_password')
    adele.join_group(@shape_up)
    adele.weight_per_week = { 1 => 100, 2 => 90 }
    expect(@shape_up.participants.length).to eq 1
    expect(@shape_up.participants.first.weight_loss_percentage).to eq 0.1
  end

  it 'should show participants ranking according to weight loss percentage' do
    adele = Person.new('Adele', 'adele@yeswecan.com', 'adele_silly_password')
    monica = Person.new('Monica Geller', 'mgeller@yeswecan.com', 'another_silly_password')
    adele.join_group(@shape_up)
    monica.join_group(@shape_up)
    @sherman.join_group(@shape_up)
    adele.weight_per_week = { 1 => 100, 25 => 55 }
    monica.weight_per_week = { 1 => 100, 25 => 60 }
    @sherman.weight_per_week = { 1 => 120, 25 => 90 }
    expect(@shape_up.ranking.map(&:full_name)).to eq [adele, monica, @sherman].map(&:full_name)
  end  
end
