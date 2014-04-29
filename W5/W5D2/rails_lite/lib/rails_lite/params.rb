require 'uri'

class Params
  # use your initialize to merge params from
  # 1. query string
  # 2. post body
  # 3. route params
  def initialize(req, route_params = {})
    @req = req
    query_params = req.query_string ? parse_www_encoded_form(req.query_string) : route_params
    body_params = req.body ? parse_www_encoded_form(req.body) : {}
    @params = deep_merge(query_params, body_params)
    @strong_params = Hash.new([])
    p @params
  end

  def [](key)
    @params[key]
  end

  def permit(*keys)
    @strong_params[:permitted] += keys
  end

  def require(key)
    raise AttributeNotFoundError unless @params.keys.include?(key)
    @strong_params[:required] << key
  end

  def permitted?(key)
    unless @strong_params.empty?
      @strong_params[:permitted].include?(key) || @strong_params[:required].include?(key)
    end
  end

  def to_s
    @params.to_json
  end

  class AttributeNotFoundError < ArgumentError; end;

  private
  # this should return deeply nested hash
  # argument format
  # user[address][street]=main&user[address][zip]=89436
  # should return
  # { "user" => { "address" => { "street" => "main", "zip" => "89436" } } }
  def parse_www_encoded_form(www_encoded_form)
    query_params = URI.decode_www_form(www_encoded_form)
    query_params.each_with_object([]) do |q_param, params_arr|
      key_str, val = q_param
      keys = parse_key(key_str)
      params_arr << keys.reverse.inject(val) { |accum, key| { key => accum } }
    end.inject { |accum, hash| deep_merge(accum, hash) }
  end

  # this should return an array
  # user[address][street] should return ['user', 'address', 'street']
  def parse_key(key)
    key.split(/[\[\]]/).select { |str| !str.empty? }
  end
  
  def deep_merge(hash1, hash2)
    hash2.keys.each do |h2_key|
      hash1.keys.include?(h2_key) ? deep_merge(hash1[h2_key], hash2[h2_key]) : hash1[h2_key] = hash2[h2_key]
    end
    hash1
  end
  
end
