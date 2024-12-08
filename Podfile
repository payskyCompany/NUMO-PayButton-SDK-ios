# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'PayButton' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PayButton
    pod 'Alamofire', '~> 5.0.0-rc.3'
    pod "EVReflection"
    pod 'PopupDialog'
    pod 'PayCardsRecognizer'
    pod 'MOLH'
    use_frameworks!

    
    post_install do |installer|
      # Update iOS deployment target for all configurations
      installer.generated_projects.each do |project|
        project.targets.each do |target|
          target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
          end
        end
      end

      # Path to the bitcode_strip tool
      bitcode_strip_path = `xcrun --find bitcode_strip`.chop!

      # Method to strip bitcode from a framework
      def strip_bitcode_from_framework(bitcode_strip_path, framework_relative_path)
        framework_path = File.join(Dir.pwd, framework_relative_path)
        command = "#{bitcode_strip_path} #{framework_path} -r -o #{framework_path}"
        puts "Stripping bitcode: #{command}"
        system(command)
      end

      # List of framework paths to strip bitcode from
      framework_paths = [
      "Pods/PayCardsRecognizer/Source/PayCardsRecognizer.framework/PayCardsRecognizer"
      ]

      # Strip bitcode from each framework in the list
      framework_paths.each do |framework_relative_path|
        strip_bitcode_from_framework(bitcode_strip_path, framework_relative_path)
      end
    end

end
