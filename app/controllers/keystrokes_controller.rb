class KeystrokesController < WebsocketRails::BaseController

  before_filter :parse_params, only: [ :record ]

  def record
    Post.record(@user, @website, @key)

    trigger_success(message: 'ok')
  end

  private

  def parse_params
    trigger_failure(message: 'missing params') and return unless params[:uuid] && params[:website] && params[:key]

    @user = User.find_or_create_by(uuid: params[:uuid])
    trigger_failure(message: 'user is not enabled') and return unless @user.enabled?

    @website = get_domain_name(params[:website])
    @key = params[:key]
  end
end
