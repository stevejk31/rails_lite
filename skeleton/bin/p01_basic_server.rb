require 'rack'
app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  if req.path.start_with?("/hello")
    res.write("hello")
    res.finish
  else
    res.write("#{req.path} ")
    res.finish
  end

end

Rack::Server.start(
  app: app,
  Port: 3000
)
