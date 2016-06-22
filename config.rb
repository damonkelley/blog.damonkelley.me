page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

set :slim, layout_engine: :slim
set :frontmatter_extensions, %w(.html .slim)

activate :blog do |blog|
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  blog.paginate = true
  blog.per_page = 10
end

activate :syntax
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

activate :directory_indexes

page "/feed.xml", layout: false

configure :build do
  activate :minify_css
end
