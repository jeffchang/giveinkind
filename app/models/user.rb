class User < ActiveRecord::Base

  has_many :needs
  has_many :needed_items, through: :needs
  has_one :collection_spot
  has_many :donor_items
  has_and_belongs_to_many :locations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter, :linkedin]

  def self.find_or_create_from_oauth(auth)
    if auth.provider == 'twitter'
      find_for_twitter_oauth(auth)
    elsif auth.provider == 'facebook'
      find_for_facebook_oauth(auth)
    elsif auth.provider == 'linkedin'
      find_for_linkedin_oauth(auth)
    end
  end

  private

  def self.find_for_facebook_oauth(auth)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20],
                           image_url: auth.info.image.gsub("square", "large"),
                           facilitator: true
                           )
    end
    user
  end

  def self.find_for_twitter_oauth(auth)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create!(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email || "#{auth.provider}-#{auth.uid}@storyward.com",
                           password:Devise.friendly_token[0,20],
                           image_url: auth.info.image.gsub('_normal','')
                           )
    end
    user
  end

  def self.find_for_linkedin_oauth(auth)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create!(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email || "#{auth.provider}-#{auth.uid}@storyward.com",
                           password:Devise.friendly_token[0,20],
                           image_url: auth.info.image.gsub('_normal','')
                           )
    end
    user
  end

end