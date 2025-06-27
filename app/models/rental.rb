class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :rent_date, presence: true
  validate :book_is_available, on: :create

  private

  def book_is_available
    existing_active_rental = Rental.where(book_id: book_id)
                                   .where("return_date IS NULL OR return_date > ?", Date.current)
                                   .where.not(id: id)
                                   .exists?

    if existing_active_rental
      errors.add(:book_id, "já está alugado e não pode ser alugado novamente até ser devolvido.")
    end
  end
end
