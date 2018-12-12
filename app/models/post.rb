class Post < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by!(name: name).posts
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |item|
      Tag.where(name: item.strip).first_or_create!
    end
  end

end
