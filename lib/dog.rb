class Dog

  attr_accessor :name, :breed, :id

  def initialize(dog_hash)
    dog_hash.each{|k,v| self.send(("#{k}="), v)}
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABEL dogs (
        id INTEGER PRIMARY KEY,
        name INTEGER,
        breed TEXT
      )
    SQL

    DB[:conn].execute(sql)
  end

end
