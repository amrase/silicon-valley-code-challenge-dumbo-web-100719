
class FundingRound
  attr_reader :startup, :venturecapitalis 
  attr_accessor:funding_round,:type,:invesment
  @@all=[]
  def initialize(startup,venturecapitalis,type,invesment=0.0)
    @startup=startup
    @venturecapitalis=venturecapitalis
    @type=type
    @invesment=invesment
    @@all << self
  end
  
  def self.all
    @@all
  end  
  
  
end
