class Setting < ActiveRecord::Base
	
	has_attached_file :cover_image,
								:storage => :s3,
								:s3_protocol => 'https',
								:bucket => ENV['S3_BUCKET'],
                :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
	validates_attachment :cover_image, :content_type => {:content_type => /\Aimage\/.*\Z/}

	has_attached_file :additional_image,
								:storage => :s3,
								:s3_protocol => 'https',
								:bucket => ENV['S3_BUCKET'],
                :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
	validates_attachment :additional_image, :content_type => {:content_type => /\Aimage\/.*\Z/}


	has_attached_file :facebook_image,
								:storage => :s3,
								:default_url => "https://s3.amazonaws.com/vs-prelauncher/settings/facebook_images/000/000/001/original/social_cover.jpghttps://s3.amazonaws.com/vs-prelauncher/settings/facebook_images/000/000/001/original/social_cover.jpghttps://s3.amazonaws.com/vs-prelauncher/settings/facebook_images/000/000/001/original/social_cover.jpghttps://s3.amazonaws.com/vs-prelauncher/settings/facebook_images/000/000/001/original/social_cover.jpghttps://s3.amazonaws.com/vs-prelauncher/settings/facebook_images/000/000/001/original/social_cover.jpghttps://s3.amazonaws.com/vs-prelauncher/settings/facebook_images/000/000/001/original/social_cover.jpghttps://s3.amazonaws.com/vs-prelauncher/settings/facebook_images/000/000/001/original/social_cover.jpghttps://s3.amazonaws.com/vs-prelauncher/settings/facebook_images/000/000/001/original/social_cover.jpg",
								:s3_protocol => 'https',
								:bucket => ENV['S3_BUCKET'],
                :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
	validates_attachment :facebook_image, :content_type => {:content_type => /\Aimage\/.*\Z/}

	has_attached_file :twitter_image, :storage => :s3,
								:s3_protocol => 'https',
								:bucket => ENV['S3_BUCKET'],
                :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
	validates_attachment :twitter_image, :content_type => {:content_type => /\Aimage\/.*\Z/}

	has_attached_file :pinterest_image, :storage => :s3,
								:s3_protocol => 'https',
								:bucket => ENV['S3_BUCKET'],
                :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
	validates_attachment :pinterest_image, :content_type => {:content_type => /\Aimage\/.*\Z/}	

	has_attached_file :google_plus_image, :storage => :s3,
								:s3_protocol => 'https',
								:bucket => ENV['S3_BUCKET'],
                :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
	validates_attachment :google_plus_image, :content_type => {:content_type => /\Aimage\/.*\Z/}

	after_save :clear_cache

	#MAILCHIMP_API_KEY = nil
	#MAILCHIMP_LIST_ID = nil

	def self.cover_image
		(Setting.first || Setting.new).cover_image
	end

	def self.additional_image
		(Setting.first || Setting.new).additional_image
	end

	def self.google_plus_image
		(Setting.first || Setting.new).google_plus_image
	end

	def self.facebook_image
		(Setting.first || Setting.new).facebook_image
	end

	def self.twitter_image
		(Setting.first || Setting.new).twitter_image
	end

	def self.pinterest_image
		(Setting.first || Setting.new).pinterest_image
	end

	def self.sharing
		setting = Setting.first || Setting.new
		return {
			twitter_message: setting.twitter_message || "",
			facebook_message: setting.facebook_message || "",
			email_message: setting.email_message || "", 
			email_subject: setting.email_subject || "",
			facebook_title: setting.facebook_title || "",
			pinterest_description: setting.pinterest_description || "",
			linkedin_title: setting.linkedin_title || "",
			linkedin_message: setting.linkedin_message || "",
		}
	end

	private

	def clear_cache
		Rails.cache.clear
	end

end
