class Pokemon
attr_accessor :id, :name, :type, :hp, :db

def initialize(id:, name:, type:, hp: nil, db:)
 @id, @name, @type, @hp, @db = id, name, type, hp, db
end
#saves an instance of a pokemon with the correct id
def self.save(name, type, db)
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
 end

 def self.find(id, db)
   pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
   Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
 end
    #  finds a pokemon from the database by
    # their id number and returns a new Pokemon object

    def alter_hp(new_hp, db)
      db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    end

end
