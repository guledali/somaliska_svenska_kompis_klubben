# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create activities
puts "Creating activities..."

# Clear existing activities to avoid duplicates
Activity.destroy_all

activities = [
  {
    title: "Kids' Learning",
    description: "Interactive educational sessions for children aged 5-12",
    icon: "bi bi-people",
    image: "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b",
    schedule: "Tuesdays 4-6 PM",
    slug: "kids-learning"
  },
  {
    title: "Makeup Workshops",
    description: "Professional makeup tutorials and beauty tips",
    icon: "bi bi-cup-hot",
    image: "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9",
    schedule: "Wednesdays 6-8 PM",
    slug: "makeup-workshops"
  },
  {
    title: "Language Exchange",
    description: "Practice Swedish and Somali with native speakers in a friendly environment",
    icon: "bi bi-chat-dots",
    image: "https://images.unsplash.com/photo-1523730205978-59fd1b2965e3",
    schedule: "Thursdays 5-7 PM",
    slug: "language-exchange"
  },
  {
    title: "Cooking Classes",
    description: "Learn to cook traditional Somali and Swedish dishes",
    icon: "bi bi-egg-fried",
    image: "https://images.unsplash.com/photo-1556911220-e15b29be8c8f",
    schedule: "Fridays 5-7 PM",
    slug: "cooking-classes"
  }
]

activities.each do |activity_data|
  activity = Activity.create!(activity_data)
  puts "Created activity: #{activity.title}"
end

puts "Seed completed! Created #{Activity.count} activities."

# Create events
puts "Creating events..."

# Clear existing events to avoid duplicates
Event.destroy_all

# Calculate dates relative to current date for future events
today = Date.today
next_month = today + 1.month
next_two_months = today + 2.months

events = [
  {
    title: "Community Game Night",
    description: "Join us for an evening of board games and fun!",
    date: today + 10.days,
    location: "Community Center, Stockholm",
    capacity: 30
  },
  {
    title: "Kids Art Workshop",
    description: "Unleash your child's creativity with our art experts",
    date: today + 15.days,
    location: "Arts Studio, Malmö",
    capacity: 20
  },
  {
    title: "Swedish-Somali Cultural Festival",
    description: "A celebration of our shared heritage with music, food, and performances",
    date: next_month + 5.days,
    location: "City Park, Gothenburg",
    capacity: 100
  },
  {
    title: "Career Networking Event",
    description: "Connect with professionals and explore job opportunities",
    date: next_month + 15.days,
    location: "Business Hub, Stockholm",
    capacity: 50
  },
  {
    title: "Traditional Dance Workshop",
    description: "Learn traditional Somali and Swedish dances from expert instructors",
    date: next_two_months,
    location: "Dance Studio, Uppsala",
    capacity: 25
  }
]

events.each do |event_data|
  event = Event.create!(event_data)
  puts "Created event: #{event.title} on #{event.date.strftime('%B %d, %Y')}"
end

puts "Seed completed! Created #{Event.count} events."

# Create gallery images
puts "Creating gallery images..."

# Clear existing gallery items to avoid duplicates
Gallery.destroy_all

galleries = [
  {
    title: "Community Gathering",
    description: "Members of our community enjoying time together",
    image_url: "https://images.unsplash.com/photo-1511632765486-a01980e01a18?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"
  },
  {
    title: "Cultural Exchange",
    description: "Sharing stories and experiences",
    image_url: "https://images.unsplash.com/photo-1529156069898-49953e39b3ac?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"
  },
  {
    title: "Learning Session",
    description: "Interactive workshop with our community members",
    image_url: "https://images.unsplash.com/photo-1515187029135-18ee286d815b?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"
  },
  {
    title: "Sunset Gathering",
    description: "Friends coming together to celebrate our community",
    image_url: "https://images.unsplash.com/photo-1517486808906-6ca8b3f04846?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"
  }
]

galleries.each do |gallery_data|
  gallery = Gallery.create!(gallery_data)
  puts "Created gallery item: #{gallery.title}"
end

puts "Seed completed! Created #{Gallery.count} gallery items."
