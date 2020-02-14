module ApplicationHelper
  DEFAULT_SITE_NAME = "逆転教材".freeze
  DEFAULT_DESCRIPTION = "人生逆転サロンの教材です".freeze
  DEFAULT_TWITTER_IMAGE = "logo.jpg".freeze
  DEFAULT_TWITTER_SITE = "@yoshito410kam".freeze

  # title などを埋め込む際は，各ビューファイルに次を埋め込む
  # <% content_for(:title) { タイトル名 } %>
  def default_meta_tags(title:, description:, twitter_image:)
    {
      site: DEFAULT_SITE_NAME,
      title: title,
      # reverse: false,
      charset: "utf-8",
      description: description.presence || DEFAULT_DESCRIPTION,
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
        image: twitter_image.present? ? image_url("texts/#{twitter_image}") : image_url("texts/#{DEFAULT_TWITTER_IMAGE}"),
        locale: "ja_JP",
      },
      twitter: {
        card: "summary_large_image",
        site: DEFAULT_TWITTER_SITE,
      },
    }
  end
end
