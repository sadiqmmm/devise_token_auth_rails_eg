class BlogListSerializer < ActiveModel::Serializer
  attr_reader :blogs

  def initialize arg
    @blogs = arg[:blogs]
  end

  def generate
    {
      current_page: blogs.current_page,
      count: blogs.size,
      total_pages: blogs.total_pages,
      total_count: blogs.total_count,
      blogs: ActiveModelSerializers::SerializableResource
        .new(blogs, each_serializer: BlogSerializer)
    }
  end
end