# frozen_string_literal: true

class Resources < ActiveModelSerializers::Model
  attributes :updated_at, :text

  def self.current
    custom = Setting.find_by(var: 'site_resources')

    if custom&.value.present?
      new(text: custom.value, updated_at: custom.updated_at)
    else
      new
    end
  end
end
