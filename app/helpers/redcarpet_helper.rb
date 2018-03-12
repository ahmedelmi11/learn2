
module RedcarpetHelper
  def render_description(content)
    renderer = RedcarpetObj.new
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
    return markdown.render content
  end

  require 'redcarpet'

  class RedcarpetObj < Redcarpet::Render::HTML
    require 'rouge'
    require 'rouge/plugins/redcarpet'
    include Rouge::Plugins::Redcarpet
  end
end


