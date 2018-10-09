class Dog

  attr_accessor :name, :breed, :id

  def initialize(dog_hash)
    dog_hash.each{|k,v| self.send(("#{k}="), v)}

  end

end
