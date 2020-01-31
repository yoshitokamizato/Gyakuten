module MarkdownHelper
  require "redcarpet"
  require "coderay"
  require "uri"

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      path, lang = set_path_and_lang(language)
      "#{file_name(path)}#{CodeRay.scan(code, lang).div}"
    end

    private

    def set_path_and_lang(language)
      path = nil

      if language.present?
        array = language.split(':')
        if array[0].include?('.')
          path = array[0]
          language = array[0].split('.')[1]
        elsif array.length > 1
          path = array[1]
          language = array[0]
        else
          language = array[0]
        end
      end

      lang = case language.to_s
             when 'rb'
               'ruby'
             when 'yml'
               'yaml'
             when ''
               'md'
             else
               language
             end

      [path, lang]
    end

    def file_name(path)
      return if path.nil?
      "<div class=\"text-danger\">#{path}</div>"
    end
  end

  def markdown(text)
    html_render = HTMLwithCoderay.new(
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: "_blank" }
    )

    options = {
      autolink: true,
      space_after_headers: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      tables: true,
      hard_wrap: true,
      xhtml: true,
      lax_html_blocks: true,
      strikethrough: true
    }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text)
  end
end