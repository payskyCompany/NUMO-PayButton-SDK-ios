# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

target 'PayButton' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PayButton
  pod 'Alamofire', '~> 5.0.0-rc.3'
  pod "EVReflection"
  pod 'PopupDialog'
  pod 'PayCardsRecognizer'
  pod 'MOLH'
  
  # pod 'PayButton'

  post_install do |installer|
      installer.generated_projects.each do |project|
            project.targets.each do |target|
                target.build_configurations.each do |config|
                    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
                 end
            end
     end
  end
  
end
