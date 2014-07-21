class MessagesTable
  def initialize(database_connection)
    @database_connection = database_connection
  end

  def message_and_name(name, message)
    @database_connection.sql("INSERT INTO messages (name, message) VALUE (#{name}, #{message} ")
  end

  def retreive_name_and_message
    @database_conncetion.sql("SELECT * FROM messages")
  end

end