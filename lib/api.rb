require 'httparty'

class Api
  include HTTParty
  base_uri API_BASE_URL
  default_params :api_key => API_KEY
  headers 'Content-Type' => 'application/json'

  # since we're mostly using this against the api, we need to add behavior
  # to handle api errors, since they also return Hashes and can look like valid responses.
  def self.get(path, options={})
    out = super
    return [] if out.nil?
    self.handle_errors(out)
  end

  def self.post(path, options={})
    out = super
    return [] if out.nil?
    self.handle_errors(out)
  end
  
  def self.put(path, options={})
    out = super
    return [] if out.nil?
    self.handle_errors(out)
  end

  def self.delete(path, options={})
    out = super
    return [] if out.nil? || out == 'null'
    self.handle_errors(out)
  end

  def self.handle_errors(out)
    if out.code > 499
      raise ApiServerError, out['message']
    elsif out.code > 399
      raise ApiNotFoundError, out['message']
    else
      out
    end
  end
  
end