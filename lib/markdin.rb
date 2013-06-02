module Markdin
  # Public: Render Markdown to HTML.
  #
  # markdown - Markdown text.
  #
  # Returns a String.
  def self.render(markdown)
    renderer.render(markdown)
  end

  # Internal: Markdown renderer.
  #
  # Returns a Redcarpet::Markdown.
  def self.renderer
    @renderer ||= Redcarpet::Markdown.new \
                    Redcarpet::Render::HTML, :autolink => true
  end
end
