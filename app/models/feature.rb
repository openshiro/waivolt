class Feature
  def self.enabled?(feature_name)
    case feature_name.to_sym
    when :badge_filter
      !Rails.env.production?
    when :cancel_subscription
      true
    when :redesign
      ENV.fetch("REDESIGN", false)
    when :business_welcome_email
      false
    when :developer_specialties
      true
    when :role_levels
      Rails.env.test?
    else
      raise "Unknown feature name: #{feature_name}"
    end
  end
end
