class Comment < ApplicationRecord
	belongs_to :entry
	# belongs_to :user

	def to_hash
		{
			username: self.username,
			comment: self.comment,
			created_at: self.created_at.to_s(:base)
		}
	end
end
