class Language < ActiveRecord::Base
  has_many :profile_languages
  has_many :profiles, :through => :profile_languages
end
