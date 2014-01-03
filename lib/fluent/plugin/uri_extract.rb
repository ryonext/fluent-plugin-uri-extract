class UriExtract < Fluent::Output
  Fluent::Plugin.register_output('uri_extract', self)

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
    es.each {|time,record|
      $stderr.puts "OK!"
    }
  end

end
