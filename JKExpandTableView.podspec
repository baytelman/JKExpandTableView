Pod::Spec.new do |s|
  s.name             = "JKExpandTableView"
  s.version          = File.read('VERSION')
  s.summary          = "Expandable Nested Table View for iOS."
  s.description      = <<-DESC
                       Expandable Nested Table View for iOS (iPhone & iPad).
                       
                       JKExpandTableView is a subclass of UITableView.
                       DESC
  s.homepage         = "https://github.com/baytelman/JKExpandTableView"
  s.license          = 'MIT'
  s.source           = { :git => "https://github.com/baytelman/JKExpandTableView.git", :tag => s.version.to_s }
  s.author           = { "Felipe Baytelman" => "felipe.baytelman@gmail.com" }
  s.social_media_url = 'https://twitter.com/baytelman'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.resources = 'Assets/*.png'
  s.source_files = 'JKExpandTableView', 'JKExpandTableView/**/*.{h, m}'
  s.frameworks = 'UIKit'
end
