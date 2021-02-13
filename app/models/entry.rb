class Entry < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments

  acts_as_taggable_on :tags

  has_rich_text :content


  def category_name
  	self.category.try(:title)
  end

  def comment_count
    self.comments.count
  end

  def to_hash_for_list
  	result = {}
  	%w(id title).each do |item|
  		result[item] = self.send(item)
  	end
    %w(created_at).each do |item|
      result[item] = self.send(item).to_s(:date)
    end
  	result
  end

  def to_hash
  	result = {}
  	%w(id title desc content category_name comment_count).each do |item|
  		result[item] = self.send(item)
  	end
    %w(created_at updated_at).each do |item|
      result[item] = self.send(item).to_s(:date)
    end
    result[:comments] = self.comments.map(&:to_hash)
    result[:tags] = self.tags.map(&:name)
  	result
  end
end
