require "bunny"

class TransactionPublisher
  attr_reader :transaction

  def initialize(transaction)
    @transaction = transaction
  end

  def publish
    return if transaction.nil?

    exchange = channel.direct("transaction")
    exchange.publish(payload, routing_key: queue.name, persistent: true)
    connection.close
  end

  private

  def payload
    transaction.to_json
  end

  def connection
    @conn ||= begin
                conn = Bunny.new
                conn.start
              end
  end

  def channel
    @channel ||= connection.create_channel
  end

  def queue
    @queue ||= channel.queue("transactions", durable: true)
  end
end
