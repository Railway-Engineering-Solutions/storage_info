#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
#
Pod::Spec.new do |s|
  s.name             = 'storage_info'
  s.version          = '1.0.0'
  s.summary          = 'Get device storage capacity and available space on iOS.'
  s.description      = <<-DESC
A Flutter plugin to get storage information for iOS.
                       DESC
  s.homepage         = 'https://github.com/Railway-Engineering-Solutions/storage_info'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Railway Engineering Solutions' => 'support@res.app' }
  s.source           = { :path => '.' }
  s.source_files = 'storage_info/Sources/storage_info/**/*.swift'
  s.dependency 'Flutter'
  s.platform = :ios, '15.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
  s.resource_bundles = {'storage_info_privacy' => ['storage_info/Sources/storage_info/PrivacyInfo.xcprivacy']}
end
