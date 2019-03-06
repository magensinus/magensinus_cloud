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
    if object.errors.any?
      render "lib/components/errors", object: object
    end
  end

  # Submit button
  def submit_button(f = "", label = "")
    haml_tag :div, class: "separator small"
    tag.div class: "form-row" do
      tag.div class: "field" do
        tag.div class: "submit" do
          f.button label, data: { disable_with: t("forms.disable_with") }, class: "button double-extra-large green wide"
        end
      end
    end
  end
end
