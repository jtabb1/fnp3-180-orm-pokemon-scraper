class Pokemon

  attr_accessor :name, :type
  attr_reader :id, :db

  def initialize(name:, type:, id: nil, db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end

  def self.save(name,type,db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) 
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id,db)
    sql = <<-SQL
      SELECT * FROM pokemon 
      WHERE id = ?
    SQL
    rw = db.execute(sql, id)[0]
    self.new(name: rw[1], type: rw[2], id: rw[0], db: db)
  end



end
