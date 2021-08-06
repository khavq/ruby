class Database
  @@connection

  def self.connection
    @@connection
  end

  def self.connection=connection
    @@connection ||= connection
  end

  def self.set_connection=connection
    @@connection=connection
  end
end

Database.connection=1
Database.set_connection=nil
Database.connection=2
p Database.connection
