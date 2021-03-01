class ValidationError < StandardError
  def initialize(message: 'Validation Error')
    super(message)
  end
end

