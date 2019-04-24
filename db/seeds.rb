# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ExpenseCategory.destroy_all
admin = User.find_by_email('admin@example.com')
if admin != nil
  admin.destroy!
end

ExpenseCategory.create!([
  { name: 'Accomodation' },
  { name: 'Entertainment' },
  { name: 'Food' },
  { name: 'Miscellaneous' },
  { name: 'Shopping' },
  { name: 'Transport' },
  { name: 'Uncategorized' }
])

User.create!(email: 'admin@example.com', name: 'Admin', password: ENV['ADMIN_PASSWORD'], admin: true)