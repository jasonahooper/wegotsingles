ThinkingSphinx::Index.define :profile, :with => :active_record do
  indexes user.type, :as => :sex
  indexes about_you
  indexes likes_and_dislikes
  indexes looking_for
end