# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# seeds.rb

# Create authors
authors = []
10.times do |i|
  authors << Author.create!(
    name: "Author #{i + 1}",
    email: "author#{i + 1}@example.com"
  )
end

# Create categories
categories = []
10.times do |i|
  categories << Category.create!(
    name: "Category #{i + 1}"
  )
end

# Create books with authors and categories
10.times do |i|
  author = authors.sample
  categories_for_book = categories.sample(2)  # Assuming each book has two categories

  book = Book.create!(
    title: "Book #{i + 1}",
    isbn: "123-#{i + 1000000000}",
    author: author
  )

  # Associate categories with the book through Categorization
  categories_for_book.each do |category|
    Categorization.create!(
      book: book,
      category: category
    )
  end

  # Create cover image for each book with a placeholder image URL
  book.create_cover_image(
    url: "https://picsum.photos/200/300?random=#{i + 1}"  # Placeholder image URL from Lorem Picsum
  )
end
