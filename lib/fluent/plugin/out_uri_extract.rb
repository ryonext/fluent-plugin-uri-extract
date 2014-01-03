class UriExtract < Fluent::Output
  Fluent::Plugin.register_output('uri_extract', self)
  require "uri"

  def configure(conf)
    super
  end

  def start
    super
  end

  def shutdown
    super
  end

  def emit(tag, es, chain)
    chain.next
    es.each do |time,record|
      text = record["text"]
      uri = URI.extract(text, ["http", "https"])
      tweet_id = record["id"]
      record = {}
      record["uri"] = uri.first
      record["tweet_id"] = tweet_id
      Fluent::Engine.emit("uri.#{tag}", time, record)
    end
  end

end
