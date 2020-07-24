class ApplicationRecord < ActiveRecord::Base
  # protect_from_forgery prepend: true
  self.abstract_class = true
end
