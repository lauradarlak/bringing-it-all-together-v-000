class Dog

  attr_accessor :name, :breed, :id

  def initialize(dog_hash)
    dog_hash.each{|k,v| self.send(("#{k}="), v)}
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE dogs (
        id INTEGER PRIMARY KEY,
        name INTEGER,
        breed TEXT
      )
    SQL

    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE dogs
    SQL

    DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL
      INSERT INTO dogs (name, breed)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.breed)

    # query the table for the ID of the lasted inserted row
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    # => [[1]]
    self
  end

  def self.create(dog_hash)
    dog_hash.each do |attribute, data|
      self.send(("#{attribute}="), data)
    end
  end


  # def self.new_from_db(row)
  #   self.new(id: row[0], name: row[1], breed: row[2])
  # end

end
