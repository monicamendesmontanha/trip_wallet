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

  def expenses_by_day
    expenses_by_group = expenses.group_by { |expense| expense.expense_date }

    total_expense_by_date = {}

    last_7_days.each do |day|
      expenses = expenses_by_group[day] || []
      total_expense_by_date[day] = expenses.sum { |e| e.amount }
    end

    total_expense_by_date
  end

  def expenses_by_category
    expenses_by_group = expenses.group_by {|expense| expense.expense_category.name}

    total_expense_by_category = {}
    expenses_by_group.each do |key, value|
      total_expense_by_category[key] = value.sum { |e| e.amount }
    end

    total_expense_by_category
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
 end

  def last_7_days
    Date.today.downto(Date.today - 6).to_a.reverse
  end



end
