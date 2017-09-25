require "pry"

class Pokemon
  attr_accessor :type, :id, :name, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(current_name, current_type, current_db)
    current_db.execute("INSERT INTO pokemon (name, type)
    values(?, ?) ",current_name, current_type)
  end

  def self.find(id, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=(?)", id).flatten
    self.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
  end
end
