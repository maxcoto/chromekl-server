module KeystrokesHelper

  def get_domain_name(url)
    url = "http://#{url}" if URI.parse(url).scheme.nil?
    host = URI.parse(url).host.downcase
    host = host.start_with?('www.') ? host[4..-1] : host
    host.split('.').try(:first) || host
  end

end
