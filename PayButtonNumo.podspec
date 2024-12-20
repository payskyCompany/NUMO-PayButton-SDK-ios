Pod::Spec.new do |s|
  s.name             = 'PayButtonNumo'
  s.version          = '1.1.7'
  s.summary          = 'PayButtonNumo'
  s.description      = "PayButton Moamalat Numo"
  s.homepage         = 'https://github.com/payskyCompany/NUMO-PayButton-SDK-ios'
  s.license = { :type => 'MIT', :file => 'README.md' }
  s.author           = { 'payskyCompany' => 'ahmed.agamy@paysky.io' }
  s.source           = { :git => 'https://github.com/payskyCompany/NUMO-PayButton-SDK-ios.git', :tag => s.version.to_s }
 

       #   s.xcconfig =  {'SWIFT_OBJC_BRIDGING_HEADER' => 'PayButton/PayButton-Bridging-Header.h}

          #s.platform = :osx, '10.7'
        
        s.xcconfig = { "APPLY_RULES_IN_COPY_FILES" => "YES", "STRINGS_FILE_OUTPUT_ENCODING" => "binary" ,"OTHER_LDFLAGS" => "-lz" }
          # 'SWIFT_OBJC_BRIDGING_HEADER' => 'PayButton/PayButton-Bridging-Header.h'}
           s.public_header_files = 'PayButton/PayButton-Bridging-Header.h'

          s.exclude_files = [
   'PayButton/TestApi/Base.lproj/LaunchScreen.storyboard',
     'PayButton/TestApi/Base.lproj/Main.storyboard',
     'PayButton/TestApi/ViewController.swift',
     'PayButton/AppDelegate.swift',
     'PayButton/Info.plist',
     'PayButton/Assets.xcassets/AppIcon.appiconset/**',
                         ]
           s.platform = :osx, '10.7'
           s.platform = :ios, '13.0'

           s.ios.deployment_target = '13.0'
    	s.framework = "UIKit"

  s.swift_version = '5.0'
  s.dependency 'Alamofire', '~> 5.0.5'
  s.dependency 'PayCardsRecognizer', '~> 1.1.7'
  s.dependency 'MOLH', '~> 1.4.1'

  s.static_framework = true
  s.requires_arc = true
      # 8
  s.source_files = "PayButton/**/*.{swift,h,m}"

  # 9
  s.resources = "PayButton/**/*.{png,jpeg,jpg,storyboard,xib,xcassets,lproj,json,plist,strings}"


  s.resource_bundle = { "PayButton" => ["PayButton/Strings/*.lproj/*.strings"] }
end
