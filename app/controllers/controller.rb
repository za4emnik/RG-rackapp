class Controller

attr_accessor :status, :header, :body, :env

  def not_found
    self.status = 404
    self.body = 'Not found!'
    self
  end
end
