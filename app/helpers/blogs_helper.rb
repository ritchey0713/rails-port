module BlogsHelper

    def gravitar_helper(user)
        image_tag("https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 40)
    end 

    class CodeRayify < Redcarpet::Render::HTML 
        def block_code(code, language)
            CodeRay.scan(code, language).div
        end 
    end 

    def markdown(text, truncated=nil)
        coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

        options = {
            fenced_code_blocks: true,
            no_intra_emphasis: true,
            autolink: true,
            lax_html_blocks: true
        }

        markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
        if truncated
            markdown_to_html.render(text).truncate_words(10).html_safe
        else 
            markdown_to_html.render(text).html_safe
        end 

    end 

    def blog_status_color(blog)
        if blog.draft? 
            "color: red;"
        end 
    end 
end
