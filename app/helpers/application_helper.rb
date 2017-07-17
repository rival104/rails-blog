module ApplicationHelper
  def gravatar_for(user, options = { size: 80})
    gravatar_id  = Digest::MD5.hexdigest(user.email.downcase)
    size = options[:size]
    default = url_encode('https://s26.postimg.org/i82k9hz11/tumblr_m53wnl5_Bb_T1rpq4ul.jpg');
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=#{default}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end
end
