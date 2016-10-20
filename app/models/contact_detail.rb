class ContactDetail < ApplicationRecord
  has_many :addresses, inverse_of: :contact_detail, dependent: :destroy
  has_many :phone_numbers, inverse_of: :contact_detail, dependent: :destroy

  accepts_nested_attributes_for :addresses, :reject_if => lambda { |a| a[:address_line].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :phone_numbers, :reject_if => lambda { |a| a[:mobile_number].blank? }, :allow_destroy => true

  validates :name, :email, presence: true
  validate :email_with_format_if_present
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def email_with_format_if_present
    if email.present? and email_changed?
      return errors.add(:email, 'Not a valid email') unless email =~ VALID_EMAIL_REGEX
    end
  end
end
