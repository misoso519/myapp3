module ApplicationHelper
  def default_meta_tags
    {
      site: "Teacher's",
      title: "Teacher's",
      reverse: true,
      charset: 'utf-8',
      description: "Teacher'sは、子どもの運動教育に関する質問を投稿し、回答を得ることができるプラットフォームです。",
      keywords: '運動教育, 子ども, 質問, 教育,幼児, 運動, スポーツ',
      canonical: request.original_url,
      separator: '|',
      # icon: [
      #  { href: image_url('favicon.ico') },
      #  { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      #],
      og: {
        site_name: :site,
        title: "Teacher's",
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        title: "Teacher's",
        description: "Teacher'sは、子どもの運動教育に関する質問を投稿し、回答を得ることができるプラットフォームです。",
        image: image_url('ogp.png')
      }
    }
  end
end
