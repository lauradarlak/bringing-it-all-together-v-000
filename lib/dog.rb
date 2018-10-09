class Dog

  attr_accessor :name, :breed
  attr_reader :id

  def initialize(dog_hash, id=nil)
    dog_hash.each{|k,v| self.send(("#{k}="), v)}

  end

end
