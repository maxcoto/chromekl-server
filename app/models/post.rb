class Post < ActiveRecord::Base

  belongs_to :user

  def self.record(user, website, keyid)
    Post.find_or_create_by(user: user, page: website) do |post|
      post.track << key.to_i.chr.downcase
    end
  end

end
