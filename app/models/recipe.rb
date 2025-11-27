require 'open-uri'

class Recipe < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :recipe_items

  has_one_attached :photo

  DEFAULT_IMAGE_URL = "https://res.cloudinary.com/dvoeovqth/image/upload/recette_default_rwy5jj.jpg".freeze
  pg_search_scope :search_by_name_description_difficulty_indice_gly, {
    against: {name: 'A', description: 'B', difficulty: 'B', indice_gly: 'B'},
    using: {
      tsearch: { prefix: true }
    }
  }
  multisearchable against: [:name, :description, :ratio_glucide, :indice_gly, :difficulty]
  # after_create :set_default_photo
  # Class method to parse markdown response from LLM and create a recipe
  def self.create_from_markdown(markdown_text, user)
    parsed_data = parse_markdown(markdown_text)
    return nil if parsed_data.nil?

    create(parsed_data.merge(user: user))
  end

  def gi_level
    return nil if indice_gly.nil?
    return 'low' if indice_gly < 55
    return 'medium' if indice_gly <= 70
    'high'
  end

  def gi_stars
    return nil if indice_gly.nil?
    return 5 if indice_gly < 40
    return 4 if indice_gly < 55
    return 3 if indice_gly < 70
    return 2 if indice_gly < 85
    1
  end

  def carb_stars
    return nil if indice_gly.nil?
    return 5 if ratio_glucide < 20
    return 4 if ratio_glucide < 35
    return 3 if ratio_glucide < 50
    return 2 if ratio_glucide < 65
    1
  end

  def photo_url
    if photo.attached?
      photo
    else
      DEFAULT_IMAGE_URL
    end
  end

  private

  def set_default_photo
    unless photo.attached?
      begin
        downloaded_image = URI.open(DEFAULT_IMAGE_URL)
        photo.attach(
          io: downloaded_image,
          filename: 'default-recipe.jpg',
          content_type: 'image/jpeg'
        )
      rescue => e
        Rails.logger.error "Failed to attach default photo: #{e.message}"
      end
    end
  end

  # Parse the markdown text from LLM response
  def self.parse_markdown(text)
    recipe_data = {}

    # Extract name (from ### header)
    if text =~ /###\s*(.+)/
      recipe_data[:name] = $1.strip
    end

    # Extract description (italicized text after title)
    # Format: *Description text here*
    if text =~ /###.+?\n\*([^*]+)\*/m
      recipe_data[:description] = $1.strip
    end

    # Extract glycemic index (format: **IG:** 47)
    if text =~ /\*\*IG:\*\*\s*(\d+)/i
      recipe_data[:indice_gly] = $1.to_i
    end

    # Extract carb ratio (format: **Carbs:** 15g/100g)
    if text =~ /\*\*Carbs:\*\*\s*(\d+)g\/100g/i
      recipe_data[:ratio_glucide] = $1.to_i
    end

    # Extract difficulty (format: **Difficulty:** 2)
    if text =~ /\*\*Difficulty:\*\*\s*(\d+)/i
      recipe_data[:difficulty] = $1.to_i
    end

    # Extract instructions/steps (if present)
    # Match everything from **Instructions:** until blank line + question or end of string
    if text =~ /\*\*Instructions:\*\*\s*([\s\S]+?)(?:\n\s*\n+\s*(?:Would you like|Souhaitez-vous)|\z)/m
      steps_text = $1.strip
      # Clean up: keep actual newlines, they're already in the text properly
      recipe_data[:steps] = steps_text
    end

    # Return nil if essential fields are missing
    return nil unless recipe_data[:name].present?

    recipe_data
  end
end
