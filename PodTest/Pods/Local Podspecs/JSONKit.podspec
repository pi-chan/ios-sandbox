Pod::Spec.new do |s|
  s.name     = 'JSONKit'
  s.version  = '1.0'
  s.source   = { :git => 'https://gprandrpg@bitbucket.org/gprandrpg/jsonkit.git', :tag => "#{s.version}" }
  s.source_files   = 'JSONKit.*'
  s.requires_arc = false
end
