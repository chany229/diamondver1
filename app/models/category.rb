class Category < ApplicationRecord
  has_many :entries

  def to_hash
  	result = {}
  	%w(title desc).each do |item|
  		result[item] = self.send(item)
  	end
  	result[:entries] = self.entries.map(&:to_hash_for_list)
  	result
  end
end
