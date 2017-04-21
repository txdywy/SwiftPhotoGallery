
Pod::Spec.new do |s|
  s.name             = "FP2017"
  s.version          = "1.0.0"
  s.summary          = "Photo gallery whith millions of hot pics"
  s.description      = <<-DESC
                        "Photo gallery whith millions of hot pics"
                       DESC

  s.homepage         = "https://mei12356.com"
  s.license          = 'GNU'
  s.author           = { "xron" => "andylaw2017@gmail.com" }
  s.source           = { :git => "https://github.com/Inspirato/SwiftPhotoGallery.git", :tag => "#{s.version}" }

  s.ios.deployment_target = "8.0"
  s.tvos.deployment_target = "10.0"

  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.frameworks = 'UIKit', 'Foundation'
end
