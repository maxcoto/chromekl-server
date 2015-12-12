class ReceiveController < ApplicationController

	skip_before_filter  :verify_authenticity_token

	def index
    head :forbidden and return unless params[:token] && params[:page] && params[:track]
    user = User.find_or_create_by(token: params[:token])
    head :forbidden and return unless user.enabled?

    page = get_host(params[:page])
    post = Post.find_or_create_by(user: user, page: page)
    post.track << params[:track].to_i.chr.downcase
    post.save!

    head :ok
	end

	private

	def get_host(url)
    url = "http://#{url}" if URI.parse(url).scheme.nil?
    host = URI.parse(url).host.downcase
    host = host.start_with?('www.') ? host[4..-1] : host
    host.split('.').try(:first) || host
  end

end
