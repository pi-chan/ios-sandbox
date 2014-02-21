Pod::Spec.new do |s|
  s.name = "AdfurikunSDK"
  s.version = "2.2.0"

  s.source = {:git => "https://gprandrpg@bitbucket.org/gprandrpg/adfurikunsdk.git", :tag => "#{s.version}"}

  s.preserve_paths = "AdfurikunSDK/adfurikunsdk.framework"
  s.public_header_files = "AdfurikunSDK/adfurikunsdk.framework/Headers/*.h"
  s.vendored_frameworks = 'AdfurikunSDK/adfurikunsdk.framework'
  s.xcconfig     = { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/AdfurikunSDK"' }
  s.requires_arc = true

  s.frameworks = "SystemConfiguration"
  s.weak_frameworks = "AdSupport"

end

