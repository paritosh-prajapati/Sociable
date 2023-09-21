module ApplicationHelper
  def user_profile(user, options={})
    # debugger
    if user.profile_image.attached?
      image_tag user.profile_image
    end
  end
end
