require "pry"

class Pokemon
  attr_accessor :type, :id, :name, :db, :hp

  def initialize(id:, name:, type:, db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(current_name, current_type, current_db)
    current_db.execute("INSERT INTO pokemon (name, type)
    values(?, ?) ",current_name, current_type)
  end

  def self.find(id, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=(?)", id).flatten
    self.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
  end

  def alter_hp(new_hp, db)
    binding.pry
  end
end
