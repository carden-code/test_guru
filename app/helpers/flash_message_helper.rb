module FlashMessageHelper
  def flash_alert(alert)
    content_tag :p, flash[alert], class: 'flash alert' if flash[alert]
  end
end
