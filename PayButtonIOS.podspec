Pod::Spec.new do |spec|
spec.name         = "PayButtonIOS"
spec.version      = "1.0.1"
spec.summary      = "GIM PayButton SDK"
spec.description  = "PayButton SDK helps make the integration of card acceptance into your app easy."
spec.homepage     = "https://github.com/GIMPAY/paybutton-sdk-ios"
spec.license      = "MIT"

spec.author             = { "Paysky Company" => "amir.morsy@paysky.io" }
spec.social_media_url   = "https://paysky.io/"

spec.platform           = :ios, "13.0"
spec.source             = { :git => "https://github.com/GIMPAY/paybutton-sdk-ios.git", :tag => spec.version.to_s }
spec.swift_version      = "5.0"

spec.public_header_files = "PayButton/PayButton-Bridging-Header.h"

spec.framework          = "UIKit"

spec.requires_arc       = true
spec.static_framework   = true

spec.xcconfig = {
"APPLY_RULES_IN_COPY_FILES" => "YES",
"STRINGS_FILE_OUTPUT_ENCODING" => "binary",
"OTHER_LDFLAGS" => "-lz"
}

spec.pod_target_xcconfig = { "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64" }
spec.user_target_xcconfig = { "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64" }

spec.source_files = "PayButton/**/*.{swift,h,m}"
spec.resources = "PayButton/**/*.{png,jpeg,jpg,storyboard,xib,xcassets,lproj,json,plist,strings}"
spec.resource_bundle = { "PayButton" => ["PayButton/Resources/*.lproj/*.strings"] }
spec.exclude_files = [
'PayButton/TestApi/Base.lproj/LaunchScreen.storyboard',
'PayButton/TestApi/Base.lproj/Main.storyboard',
'PayButton/TestApi/ViewController.swift',
'PayButton/AppDelegate.swift',
'PayButton/Info.plist',
'PayButton/PayButtonAssets.xcassets/AppIcon.appiconset/**',
]

spec.dependency "MOLH"
spec.dependency "Alamofire"
spec.dependency "PayCardsRecognizer"

end
