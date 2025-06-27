class User < ApplicationRecord
  has_many :rentals, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\.com\z/, message: "deve ser um email válido (ex: email@exemplo.com)" }
  validates :phone, presence: true
  before_save :downcase_email

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
