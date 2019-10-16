class Startup
  attr_accessor :startup_name , :domain 
  attr_reader:founder
  @@all = [] 
  def initialize(startup_name,founder,domain)
    @startup_name = startup_name
    @founder = founder  
    @domain = domain
    @@all << self 
    
  end 
  
  def self.all
    @@all 
  end
  
  def self.add_domains(new_domain)
    @domains << new_domain
    new_domain.domains = self
    
  end  
  
  
  def self.find_by_founder(name)
    self.all.find do |name_s|
      name_s.founder == name 
    end
    
  end   
  
  def self.domains
    self.all.map do |right_domain|
      right_domain.domain
    end 
  end  
  
  
  def sign_contract(ventureCapitalist,type,investment)
    new_object=FundingRound.new(self,ventureCapitalist,type,investment)
  end
  
  
  def num_funding_rounds
     FundingRound.all.select {|funding_rounds| funding_rounds.startup}.count
  end
  
  
  def total_funds
      FundingRound.all.map {|funding_rounds| funding_rounds.investment}.sum
  end 
  
  
  def investors
     founding_round=FundingRound.all.select{|round| round.startup == self }
      founding_round.map {|round|round.ventureCapitalists}.uniq
  end  
  
  def big_investors
   self.investors.map {|round| round.ventureCapitalists == "Tres Commas"}
  end  
  
  
  
  
  
end
