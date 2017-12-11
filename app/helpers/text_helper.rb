module TextHelper
  
  # Converts HSV to RGB
  # Blatantly stolen (and modified! and converted to Ruby) from https://axonflux.com/handy-rgb-to-hsl-and-rgb-to-hsv-color-model-c
  # Refernce: https://en.wikipedia.org/wiki/HSL_and_HSV
  # Purpose: Useful for generating colors with same-hue value for web designs
  # Input: Hue: Integer 0 - 360
  #     => Saturation: Integer 0 - 100
  #     => Value: Integer 0 - 100
  # Output: String "R,G,B"
  #     => Suitable for the CSS function RGB()
  def get_rgb(hue, saturation, value) #value is lightness
    #normalize values
    if hue < 0
      hue = 0
    elsif hue > 360
      hue = 360
    end
    if saturation < 0
      saturation = 0
    elsif saturation > 100
      saturation = 100
    end
    if value < 0
      value = 0
    elsif value > 100
      value = 100
    end

    i = ((hue/360) * 6).floor
    f = (hue/360) * 6 - i
    p = value * (1- (saturation/100))
    q = value * (1 - f * (saturation/100))
    t = value * ( 1- (1 - f) * (saturation/100))

    if i % 6 == 0
      red = value
      green = t
      blue = p
    elsif i % 6 == 1
      red = q
      green = value
      blue = p 
    elsif i % 6 == 2
      red = p
      green = value
      blue = t
    elsif i % 6 == 3
      red = p
      green = q
      blue = value
    elsif i % 6 == 4
      red = t
      green = p
      blue = value
    elsif i % 6 == 5
      red = value
      green = p 
      blue = q
    end

    rgb_arr = []
    rgb_arr << red
    rgb_arr << green
    rgb_arr << blue
    rgb_arr.each do |value|
      puts value
    end

    rgb_arr.map { |x| '%02x'%x }.join
  end

  def text_to_rgb(text)
    text_arr = text.split('')
    length = text_arr.length
    half_length = length / 2.0
    rainbow_html = ""
    total = length * 1.5

    for i in 0..total.to_i
      offset = (length + Math.sin(i/2.5) * half_length)
      temp = ""
      for a in 0..length.to_i
        a_over_length = (a.to_f/length.to_f).to_f
        i_over_total = (i.to_f/total.to_f).to_f
        offset_over_half_length = (offset.to_f/half_length.to_f).to_f
        puts("a_over_length: #{a_over_length}
          \n i_over_total: #{i_over_total}
          \n offset_over_half_length: #{offset_over_half_length}
          \n 360*a_over_length*i_over_total*offset_over_half_length=#{360*a_over_length.to_f*i_over_total.to_f*offset_over_half_length.to_f}")
        color = get_rgb((360.0 * a_over_length.to_f * i_over_total.to_f * offset_over_half_length.to_f).to_f, 100, 100)
        #puts "#"+color
        temp << "<span style='color:##{color}'>#{text_arr[a]}</span>"
      end
      rainbow_html += temp + "<br>"
    end
    rainbow_html.html_safe
  end
end
