Pod::Spec.new do |s|
  s.name             = 'ffmpegkit-ios'
  s.version          = '6.0'
  s.summary          = 'FFmpeg Kit ios HTTPS Binary'
  s.description      = 'Custom FFmpeg binary with HTTPS support for ios'
  s.homepage         = 'https://github.com/Messagenius/ffmpeg-kit'
  s.license          = { :type => 'LGPL-3.0' }
  s.author           = { 'Messagenius' => 'info@example.com' }
  s.source           = { :path => '.' }
  s.ios.deployment_target = '14.0'
  
  # Enable all valid architectures for iOS and Simulator
  s.pod_target_xcconfig = {
    'VALID_ARCHS' => 'arm64 arm64e x86_64',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => ''
  }
  s.user_target_xcconfig = {
    'VALID_ARCHS' => 'arm64 arm64e x86_64',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => ''
  }
  
  s.vendored_frameworks = 'ffmpegkit.framework', 'libavcodec.framework', 'libavdevice.framework', 'libavfilter.framework', 'libavformat.framework', 'libavutil.framework', 'libswresample.framework', 'libswscale.framework'

  s.pod_target_xcconfig = { 
    'DEFINES_MODULE' => 'YES', 
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = { 
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
end