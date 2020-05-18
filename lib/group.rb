class Group
  attr_accessor :name, :owner, :participants

  def initialize(name, owner)
    @name = name
    @owner = owner
    @participants = []
  end

  def ranking
    ranking = {}
    participants.each do |participant|
      ranking[participant] = participant.weight_loss_percentage
    end
    ranking.values.sort!
    ranking.keys
  end
end
