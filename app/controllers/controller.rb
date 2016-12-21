class Controller

attr_accessor :status, :header, :body, :env

  def not_found
    self.status = 404
    self.body = 'Not found!'
    self
  end

  def redirect_to(url)
    Rack::Response.new { |response| response.redirect(url) }
  end

  def get_binding
      binding
    end
end
