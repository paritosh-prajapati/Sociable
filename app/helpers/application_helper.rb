module ApplicationHelper
  def profile_image(user, options={})
    if user.profile_image.attached?
      image_tag user.profile_image
    end
  end
end
