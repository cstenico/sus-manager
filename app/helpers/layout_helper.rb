module LayoutHelper

    def dialog_sm(options={}, &block)
        options[:section_css] ||= 'col-lg-6 col-md-8'
        render_dialog(options, &block)
    end

    def render_dialog(options, &block)
        with_card = options[:with_card]
        section_css = options[:section_css]
        content_tag 'div', class: 'container' do
          content_tag 'div', class: 'row justify-content-md-center' do
            content_tag 'section', class: section_css do
             if with_card
                card(&block)
              else
               capture(&block)
              end
            end 
          end
        end
      end

    def dialog_body(options={}, &block)
      options[:section_css] ||= 'col-lg-10 col-md-10'
      render_body(options, &block)
    end

    def render_body(options, &block)
      with_card = options[:with_card]
      section_css = options[:section_css]
      content_tag 'div', class: 'container' do
        content_tag 'div', class: 'row justify-content-md-center' do
           if with_card
              card(&block)
            else
             capture(&block)
            end
        end
      end
    end
end