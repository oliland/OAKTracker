Pod::Spec.new do |s|
  s.name         = "OAKTracker"
  s.version      = "1.1.0"
  s.summary      = "A media tracker / scrubber for UIKit - just a UISlider with some UILabels."
  s.homepage     = "https://github.com/oliland/OAKTracker"

  s.license      = 'MIT'

  s.author       = { "Oli Kingshott" => "oliver@kingshott.com" }
  s.source       = { :git => "https://github.com/oliland/OAKTracker.git", :tag => "1.1.0" }

  s.platform     = :ios, '4.2'

  s.source_files = 'Classes', 'Classes/**/*.{h,m}'

  s.framework  = 'UIKit'

  s.requires_arc = true
end
