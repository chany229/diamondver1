class About < ApplicationRecord
  has_rich_text :about
  has_rich_text :contact

  def to_hash_for_about
  	result = {}
  	%w(about).each do |item|
  		result[item] = self.send(item)
  	end
  	result
  end

  def to_hash_for_contact
  	result = {}
  	%w(contact).each do |item|
  		result[item] = self.send(item)
  	end
  	result
  end

end
