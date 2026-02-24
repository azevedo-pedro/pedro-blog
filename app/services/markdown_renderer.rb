# frozen_string_literal: true

class MarkdownRenderer
  COMMONMARKER_OPTIONS = {
    extension: {
      table: true,
      strikethrough: true,
      autolink: true,
      tasklist: true,
      footnotes: true
    },
    render: {
      unsafe: true
    }
  }.freeze

  def self.call(markdown)
    new(markdown).render
  end

  def initialize(markdown)
    @markdown = markdown.to_s
  end

  def render
    doc = Commonmarker.parse(@markdown, options: COMMONMARKER_OPTIONS)
    html = doc.to_html(options: COMMONMARKER_OPTIONS)
    highlight_code_blocks(html)
  end

  private

  def highlight_code_blocks(html)
    html.gsub(/<pre><code class="language-(\w+)">(.*?)<\/code><\/pre>/m) do
      language = $1
      code = CGI.unescapeHTML($2)
      highlighted = highlight(code, language)
      %(<div class="highlight"><pre>#{highlighted}</pre></div>)
    end
  end

  def highlight(code, language)
    lexer = Rouge::Lexer.find(language) || Rouge::Lexers::PlainText.new
    formatter = Rouge::Formatters::HTML.new
    formatter.format(lexer.lex(code))
  end
end
