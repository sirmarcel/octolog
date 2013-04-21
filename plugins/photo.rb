# Title: Simple Photo Tag for Octopress / Jekyll
# Author: Marcel Langer (http://lumenlog.com)
# Description: Generate the appropiate tags for big photos (with alternate hi-res urls)
#
# Syntax: {% photo id [; description] %}


module Jekyll
  class PhotoTag < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super
      @markup = markup
    end

    def render(context)
      output = super
      @arguments = @markup.split(";")
      generate_html
    end

    def generate_html
      photo_root = Jekyll.configuration({})['photo_root']
      if @arguments[1]
        name = @arguments[0].strip
        description = @arguments[1]
        html = "<a class='img-link' href='#{photo_root}/#{name}.jpg'>"
        html += "<img class='hisrc photo-full' src='#{photo_root}/#{name}-mobile.jpg' data-1x='#{photo_root}/#{name}-1x.jpg' data-2x='#{photo_root}/#{name}-2x.jpg'></img>"
        html += "<div class='photo-description'>#{ description }</div>"
        html += "</a>"
      elsif @arguments[0]
        name = @arguments[0].strip
        html = "<a class='img-link' href='#{photo_root}/#{name}.jpg'>"
        html += "<img class='hisrc photo-full' src='#{photo_root}/#{name}-mobile.jpg' data-1x='#{photo_root}/#{name}-1x.jpg' data-2x='#{photo_root}/#{name}-2x.jpg'></img>"
        html += "</a>"
      else
        "Error parsing arguments. Sorry. Syntax: {% photo name[; description] %}"
      end
    end
  end
end

Liquid::Template.register_tag('photo', Jekyll::PhotoTag)