require ('pg')

class SpaceCowboy

  attr_accessor(:name)
  # attr_reader(:id)

  def initialize(space_cowboy_details)
    @id = space_cowboy_details[:id] if space_cowboy_details[:id]
    @name = space_cowboy_details[:name]
    @species = space_cowboy_details[:species]
    @danger_level = space_cowboy_details[:danger_level]
    @bounty = space_cowboy_details[:bounty]  
  end

  def save()
    db = PG.connect({dbname: 'bounty', host:'localhost'})
    sql = "
    INSERT INTO space_cowboys
    (name, species, danger_level, bounty)
    VALUES
    ('#{@name}', '#{@species}', '#{@danger_level}', #{@bounty})
    RETURNING id;"
    @id = db.exec(sql)[0]['id'].to_i
    db.close
  end


    def update()
      db = PG.connect({dbname: 'bounty', host:'localhost'})
      sql = " UPDATE space_cowboys 
        SET name = '#{@name}', species = '#{@species}', danger_level = '#{@danger_level}', bounty = #{@bounty}
        WHERE id = #{@id}"
      db.exec(sql)
      db.close
    end

  def self.delete_all()
    db = PG.connect({dbname: 'bounty', host:'localhost'})
    sql = "DELETE FROM space_cowboys"
    db.exec(sql)
    db.close
  end

  def delete()
    db = PG.connect({dbname: 'bounty', host:'localhost'})
    sql = "DELETE FROM space_cowboys WHERE id = #{@id}"
    db.exec(sql)
    db.close
  end

  def self.find(id_number)
    db = PG.connect({dbname: 'bounty', host:'localhost'})
    sql = "
    SELECT * FROM space_cowboys WHERE id = #{id_number}"
    cowboys = db.exec(sql)
    db.close
    return cowboys.map { |cowboy| SpaceCowboy.new(cowboy) }
  end


end