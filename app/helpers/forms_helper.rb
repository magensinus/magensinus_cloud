# frozen_string_literal: true

module FormsHelper
  # Legend
  def legend(label = "")
    tag.div class: "form-row" do
      tag.legend do
        label
      end
    end
  end

  # Errors
  def errors(object = "")
    render "lib/components/errors", object: object if object.errors.any?
  end

  # Assets form renderer
  def assets_form_renderer(object = "", size = "", url = "")
    path = "lib/components/assets/form"
    if params_image
      render "#{path}/image", object: object, size: size, url: url
    elsif params_thumb
      render "#{path}/thumb", object: object, size: size, url: url
    elsif params_video
      render "#{path}/video", object: object, url: url
    elsif params_text
      render "#{path}/text", object: object, url: url
    else
      "jhhfdh"
    end
  end

  # Submit button
  def submit_button(f = "", label = "")
    haml_tag :div, class: "separator small"
    tag.div class: "form-row" do
      tag.div class: "field col-medium-2-1" do
        tag.div class: "submit" do
          f.button label, data: { disable_with: t("forms.disable_with") }, class: "button double-extra-large green wide"
        end
      end
    end
  end

  # Submit button
  def submit_button_misc(f = "", label = "")
    tag.div class: "field col-medium-2-1" do
      tag.div class: "submit" do
        f.button label, data: { disable_with: t("forms.disable_with") }, class: "button double-extra-large green wide"
      end
    end
  end

  # Reference
  def reference_size(label = "")
    tag.p class: "reference" do
      ("<strong>Size:</strong> #{label}").html_safe
    end
  end
end
