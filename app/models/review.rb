require 'validation_error'
class Review < ApplicationRecord
  before_validation :ensure_lender_name

  private

  def ensure_lender_name
    return unless lender_name.nil?

    raise ::ValidationError, message: 'Lender name is required.'
  end
end
