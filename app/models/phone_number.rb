class PhoneNumber < ApplicationRecord
  belongs_to :contact_detail

  validates :mobile_number, presence: true, length: { minimum: 10, maximum: 13 }, numericality: { only_integer: true }
  validate :primary_number_uniqueness
  
  private
  def primary_number_uniqueness
    count = []
     self.contact_detail.phone_numbers.map{|i| 
      if i.primary_number == true
        count << 1
      end }
    if count.length > 1
      errors.add(:primary_number, "must not contain duplicates ") 
    end
  end  
end
