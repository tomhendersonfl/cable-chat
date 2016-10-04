module ApplicationHelper
  def gravatar_for(user, opts = {})
    opts[:alt] = user.name
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}", opts
  end

  def page_title(title)
    title += " | " if title.present?
    title += "CHAT CENTRAL"
  end
end
