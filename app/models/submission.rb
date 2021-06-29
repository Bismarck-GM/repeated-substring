class Submission < ApplicationRecord

  before_save :manipulate_string_and_build_result
  has_one :result, dependent: :destroy
  validates :text, presence: true

  private

  def manipulate_string_and_build_result
    result = SubString.resolve(self.text)
    build_result(attributes: result)
  end
end
