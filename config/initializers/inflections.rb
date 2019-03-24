# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.uncountable %w[
    magestil_settings
    magestil_home
    magestil_about
    magestil_about_assets
    magestil_quality
    magestil_courses
    magestil_articles
    magestil_contact
    magestil_newsletter
    magestil_campus
    magestil_campus_assets
    magestil_equipment
    magestil_equipment_assets
    magestil_partnerships
    magestil_networks
    magestil_students
    magestil_parents
    magestil_tutors
    magestil_terms_and_conditions
    magensinus_settings
    magensinus_home
    magensinus_about
    magensinus_quality
    magensinus_courses
    magensinus_articles
    magensinus_contact
    magensinus_newsletter
    magensinus_schools
    magensinus_networks
    magensinus_terms_and_conditions
  ]
end
