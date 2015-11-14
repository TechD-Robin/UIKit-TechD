
Pod::Spec.new do |s|

  s.name         = "UIKit+TechD"
  s.version      = "0.0.2"
  s.summary      = "This library is base functional library of Tech.D, is a Category."

  s.description  = <<-DESC
                   This library is base functional library of Tech.D, is a Category.

                   * There are extended methods for framework of UIKit.
                   DESC

  s.homepage     = "https://github.com/TechD-Robin/UIKit-TechD/"
  s.source       = { :git => "https://github.com/TechD-Robin/UIKit-TechD.git", :tag => "#{s.version}" }

  s.license            = 'MIT'
  s.author             = { "Robin Hsu" => "robinhsu599+dev@gmail.com" }
  s.social_media_url   = "https://plus.google.com/+RobinHsu"


  s.platform     = :ios, "8.0"
  # s.requires_arc = true
  s.frameworks   = 'Foundation', 'CoreGraphics', 'UIKit'

  s.source_files = 'UIKit+TechD/*.{h,m,mm}'

  s.dependency    "TDMath",               "~> 0.0.1"


end
