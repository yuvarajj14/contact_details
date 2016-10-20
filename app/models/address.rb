class Address < ApplicationRecord
  belongs_to :contact_detail

  validates :address_line, presence: true
  validate :primary_address_uniqueness
  
  private
  def primary_address_uniqueness
    count = []
     self.contact_detail.addresses.map{|i| 
      if i.primary_address == true
        count << 1
      end }
    if count.length > 1
      errors.add(:primary_addresses, "must not contain duplicates ") 
    end
  end  
end
