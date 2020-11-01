module ApplicationHelper
  # title などを埋め込む際は，各ビューファイルに次を埋め込む
  # <% content_for(:title) { タイトル名 } %>
  def default_meta_tags(title:, description:, twitter_image:)
    {
      site: Settings.ogp.site_name,
      title: title,
      # reverse: false,
      charset: "utf-8",
      description: description.presence || Settings.ogp.default_description,
      # keywords: '人生逆転サロン',
      # canonical: 'https://arcane-gorge-21903.herokuapp.com/',
      # separator: '|',
      # icon: [
      #   { href: image_url('favicon.ico') }
      # ],
      og: {
        # 例えば，:site とすれば，上記の site: の情報をコピーできる
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: request.url,
        image: twitter_image.presence || image_url("/texts/no_image.jpg"),
        locale: "ja_JP",
      },
      twitter: {
        card: "summary_large_image",
        site: Settings.ogp.twitter_site,
      },
    }
  end
end
