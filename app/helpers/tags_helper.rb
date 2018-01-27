module TagsHelper

  def tag_size(tag_post_count)
    ind = (tag_post_count.to_f * 5 )/ Post.all.count.to_f
    return ind.round
  end

end
