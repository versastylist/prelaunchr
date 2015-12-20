class Prize < ActiveRecord::Base
	
	has_attached_file :image, :default_url => "versastylist.com", :storage => :s3,
								:s3_protocol => 'https',
								:bucket => ENV['S3_BUCKET'],
                :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates :name, presence: true
	validates :number_of_referrals, numericality: { :greater_than => 0}, presence: true

	def winners
		user_ids = []
		User.all.each do |user|
			if user.prize == self
				user_ids << user.id
			end
		end
		return User.where(id: user_ids)
	end

	def number_of_winners
		winners.count
	end

end
