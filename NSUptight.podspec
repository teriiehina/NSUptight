Pod::Spec.new do |s|
  s.name         = "NSUptight"
  s.version      = "1.0.0"
  s.summary      = "Validation for NSObject"
  s.homepage     = "https://github.com/teriiehina/NSUptight"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "teriiehina" => "peter@teriiehina.net" }
  s.source       = { :git => "https://github.com/teriiehina/NSUptight.git", :commit => "c4c553f87a944afb757db2525e2717a701ca4fe3" }

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'

  s.source_files = 'NSUptight/NSUptight/**/*.{h,m}'
  s.requires_arc = true
end
