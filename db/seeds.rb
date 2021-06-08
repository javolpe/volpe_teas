# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

green = Tea.create!(description: "Rich in antioxidants and reduces inflammation", temperature: "80", brew_time: "2", caffeine_mgs: "24")
black = Tea.create!(description: "Boosts heart health and lowers cholesterol", temperature: "85", brew_time: "3", caffeine_mgs: "47")
chamomile = Tea.create!(description: "Lowers blood sugar and prevents osteoporosis", temperature: "93", brew_time: "3", caffeine_mgs: "0")
matcha = Tea.create!(description: "Japanese green tea", temperature: "87", brew_time: "3", caffeine_mgs: "21")
jasmine = Tea.create!(description: "Relieves stress and helps in weight loss", temperature: "80", brew_time: "2", caffeine_mgs: "33")
mate = Tea.create!(description: "Boosts energy and mental focus", temperature: "80", brew_time: "3", caffeine_mgs: "85")

high_caffeine = Subscription.create!(price: "20", title: "High Caffeine Teas", status: 0, frequency: "Monthly")
relaxing_teas = Subscription.create!(price: "25", title: "Relaxing Vibes Teas", status: 0, frequency: "Monthly")

package1 = Package.create!(subscription_id: high_caffeine.id, tea_id: black.id, bags: 10)
package2 = Package.create!(subscription_id: high_caffeine.id, tea_id: mate.id, bags: 10)
package3 = Package.create!(subscription_id: relaxing_teas.id, tea_id: green.id, bags: 7)
package4 = Package.create!(subscription_id: relaxing_teas.id, tea_id: chamomile.id, bags: 7)
package5 = Package.create!(subscription_id: relaxing_teas.id, tea_id: matcha.id, bags: 7)
package6 = Package.create!(subscription_id: relaxing_teas.id, tea_id: jasmine.id, bags: 7)

andrew = Customer.create!(email: "andrew@gmail.com", first_name: "Andrew", last_name: "Killian", street: "123 Main St", city: "Denver", state: "CO", zip: "80218")
joey = Customer.create!(email: "joey@gmail.com", first_name: "Joey", last_name: "Palmetto", street: "456 Second St", city: "Denver", state: "CO", zip: "80210")

custsub1 = CustomerSubscription.create!(customer_id: andrew.id, subscription_id: high_caffeine.id)
custsub2 = CustomerSubscription.create!(customer_id: joey.id, subscription_id: relaxing_teas.id)