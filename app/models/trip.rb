class Trip < ApplicationRecord
  belongs_to :destination
  has_many :expenses

  validates :name, presence: true, uniqueness: true
  validates :budget, numericality: true

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  def total_amount
    expenses.sum { |expense| expense.amount }
  end

  def budget_based_on_destination
    budget * destination.exchange_rate
  end

  def remaining
    budget_based_on_destination - total_amount
  end

  def percentual_remaining
    (remaining * 100) /budget_based_on_destination
  end

  def number_of_days
    (start_date..end_date).count
  end

  def daily_budget
    budget_based_on_destination / number_of_days
  end


  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
 end
end
