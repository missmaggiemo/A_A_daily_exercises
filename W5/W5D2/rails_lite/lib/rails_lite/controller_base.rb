require 'erb'
require 'active_support/inflector'
require_relative 'params'
require_relative 'session'


class ControllerBase
  attr_reader :params, :req, :res

  # setup the controller
  def initialize(req, res, route_params = {})
    @res = res
    @req = req
    @params = Params.new(req, route_params).params
    @already_built_response = false
  end

  # populate the response with content
  # set the responses content type to the given type
  # later raise an error if the developer tries to double render
  def render_content(content, type)
    raise "Already built response!" if @already_built_response
    @res.body = content
    @res.content_type = type
    @already_built_response = true
    session.store_session(@res)
  end

  # helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # set the response status code and header
  def redirect_to(url)
    raise "Already built response!" if @already_built_response
    @res.status = 302
    @res["Location"] = url.to_s
    @already_built_response = true
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    controller_name = self.class.to_s.underscore
    erb_template = ERB.new(File.read("views/#{controller_name}/#{template_name}.html.erb"))
    b = binding()
    content_to_render = erb_template.result(b)
    render_content(content_to_render, 'text/html')
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@res)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    self.send(name.to_sym)
  end
end
