platform :ios, '12.2'
use_frameworks!
inhibit_all_warnings!

def app_pods
  # UI
  pod 'SVProgressHUD'
  pod 'SnapKit'

  # Network
  pod 'Alamofire'
  pod 'Kingfisher'

  # Analytics
  pod 'Fabric'
  pod 'Crashlytics'

  # Utils
  pod 'RxSwift'
  pod 'RxSwiftExt'
  pod 'RxDataSources'
  pod 'RxAlamofire'
  pod 'R.swift'
  pod 'ObjectMapper'
  pod 'SwifterSwift'
  pod 'XCGLogger'

  # Development
  pod 'SwiftLint'
end

def test_pods
  pod 'Quick'
  pod 'Nimble'
end

target 'MyApp' do
  use_frameworks!
  app_pods

  target 'MyAppTests' do
    inherit! :search_paths
    test_pods
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if ['SwifterSwift'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = 4.2
      end
    end
    if ['R.swift.Library'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = 4.2
      end
    end
    target.build_configurations.each do |config|
      if config.name == 'Debug'
        config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      end
    end
  end
  installer.pods_project.build_configurations.each do |config|
    if config.name.start_with? 'Release'
      config.build_settings['SWIFT_COMPILATION_MODE'] = 'wholemodule'
    end
  end
end
