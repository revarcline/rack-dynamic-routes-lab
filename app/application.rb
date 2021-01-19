class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    case req.path
    when /items/
      item_name = req.path.split('/items/').last
      item = Item.find_by_name(item_name)
      if item
        resp.write item.price
      else
        resp.write 'Item not found'
        resp.status = 400
      end
    else
      resp.write 'Route not found'
      resp.status = 404
    end
    resp.finish
  end
end
