class Submission < ApplicationRecord
  has_one :result, dependent: :destroy
end
