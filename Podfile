# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'PayButton' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PayButton
  pod 'MOLH'
  pod "Alamofire", "~> 5.9.1"
  pod 'PayCardsRecognizer'

  post_install do |installer|
     installer.pods_project.targets.each do |target|
       target.build_configurations.each do |config|
         if target.name == 'PayCardsRecognizer'
           config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64 x86_64'
         end
       end
     end
   end
 end
