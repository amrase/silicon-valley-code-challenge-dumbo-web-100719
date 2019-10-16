class VentureCapitalist
  # attr_reader :venture_name
  attr_accessible :venture_name, :total_worth
  @@all=[]
  def initialize(venture_name)
    @venture_name=venture_name
    @total_worth=total_worth
    
    @@all << self 
  end   
  
  def self.all
    @@all
  end
  
  
  def self.tres_commas_club
    self.all.select do |names|
      names.total_worth > 1000000000
  end
  
  
  def offer_contract(startup,type,investment)
    new_offer = FounderRound.new(startup,self,type,investment)

  end
  
  def funding_rounds
    FundingRound.all.select {|founding_roung|founding_roung.ventureCapitalist}
    
  end  
  
  def portfolia 
    
   ventureCapitalist= FundingRound.all.select {|founding_round|funding_round.startup==self }
    ventureCapitalist.map.{ventureCapitalist}
  end  

end
