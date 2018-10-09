class Dog

  def initialize(dog_hash)
    dog_hash.each{|k,v| self.send(("#{k}="), v)}

  end

end
