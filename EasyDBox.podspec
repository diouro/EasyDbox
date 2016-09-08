#
# Be sure to run `pod lib lint EasyDBox.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'EasyDBox'
s.version          = '0.1.1'
s.summary          = 'EasyDBox is a restful api to connect to dropbox using your unique token'

# This description is used to generate tags and improve search results.

s.description      = <<-DESC
Integrate dropbox with your iOS project using only the token provided by dropbox
In order to create the token, visit: https://www.dropbox.com/developers/apps
You would need to create a app first
Enjoy.
DESC

s.homepage         = 'https://github.com/diouro/EasyDBox'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Paulo Goncalves' => 'phsgjc@gmail.com' }
s.source           = { :git => 'https://github.com/diouro/EasyDBox.git', :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/diouro'

s.ios.deployment_target = '8.0'

s.source_files = 'EasyDBox/Classes/**/*'

# s.resource_bundles = {
#   'EasyDBox' => ['EasyDBox/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit', 'MapKit'
# s.dependency 'AFNetworking', '~> 2.3'
end
