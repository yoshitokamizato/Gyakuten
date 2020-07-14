module MarkdownHelper
  require "redcarpet"
  require "coderay"
  require "uri"

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, options)
      # ```options
      # code
      # ```
      # というマークダウンの書き方への対応
      path, lang = set_path_and_lang(options)
      # code に適用するシンタックスハイライトを lang で決定
      # options にファイル名が存在する場合は，フィル名をコード枠の左上に表示させる
      "#{path_decoration(path)}#{CodeRay.scan(code, lang).div}"
    end

    private

      def set_path_and_lang(options)
        # options は４通りの形式に対応できるようにする
        # 1. 無し
        # 2. html
        # 3. app/views/layouts/application.html.erb
        # 4. html:app/views/layouts/application.html.erb
        if options.blank?
          # 1. options が無いケース
          path = nil
          lang = "md"
        else
          # 2 〜 4 のケース
          array = options.split(":")
          if array[0].include?(".")
            # 3. app/views/layouts/application.html.erb のケース
            path = array[0]
            lang = array[0].split(".").last
          elsif array.length > 1
            # 4. html:app/views/layouts/application.html.erb のケース
            path = array.last
            lang = array[0]
          else
            # 2. html のケース
            path = nil
            lang = array[0]
          end
        end

        lang = case lang
               when "rb"
                 "ruby"
               when "yml"
                 "yaml"
               else
                 lang
               end

        [path, lang]
      end

      def path_decoration(path)
        return if path.nil?

        "<div class=\"text-danger\">#{path}</div>"
      end
  end

  def markdown(text)
    html_render = HTMLwithCoderay.new(
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: "nofollow", target: "_blank" },
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
      strikethrough: true,
    }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text)
  end
end
