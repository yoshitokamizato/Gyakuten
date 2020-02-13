module ApplicationHelper
  DEFAULT_SITE_NAME = '逆転教材'
  DEFAULT_DESCRIPTION = '人生逆転サロンの教材です'
  DEFAULT_TWITTER_IMAGE = image_url('logo.jpg')
  DEFAULT_TWITTER_SITE = '@yoshito410kam'

  # title などを埋め込む際は，各ビューファイルに次を埋め込む
  # <% content_for(:title) { タイトル名 } %>
  def default_meta_tags(title:, description:, twitter_image:)
    {
      site: DEFAULT_SITE_NAME,
      title: title,
      # reverse: false,
      charset: 'utf-8',
      description: description || DEFAULT_DESCRIPTION,
      # keywords: '人生逆転サロン',
      # canonical: 'https://arcane-gorge-21903.herokuapp.com/',
      # separator: '|',
      # icon: [
      #   { href: image_url('favicon.ico') }
      # ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        # url: :canonical,
        image: image.present? ? image_url(twitter_image) : DEFAULT_TWITTER_IMAGE,
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: DEFAULT_TWITTER_SITE,
      }
    }
  end
end
