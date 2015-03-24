
Pod::Spec.new do |s|

  s.name         = "UIKit+TechD"
  s.version      = "0.0.1"
  s.summary      = "A UIKit's category of Tech.D."

  s.homepage     = "https://git.techd.idv.tw:5001"
  s.source       = { :git => "git://git.techd.idv.tw/Categories/UIKit+TechD.git", :tag => "#{s.version}" }

  s.license      = { :type=> "No License", :file => "LICENSE" }
  s.author       = { "Robin Hsu" => "robinhsu599+dev@gmail.com" }


  s.platform     = :ios, "8.0"
  # s.requires_arc = true
  s.frameworks   = 'Foundation', 'CoreGraphics', 'UIKit'

  s.source_files = 'UIKit+TechD/*.{h,m,mm}'

  s.dependency    "TDMath",               "~> 0.0.1"


end
