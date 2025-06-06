Pod::Spec.new do |s|
  s.name             = 'ffmpeg_kit_flutter'
  s.version          = '6.0.3'
  s.summary          = 'FFmpeg Kit for Flutter'
  s.description      = 'A Flutter plugin for running FFmpeg and FFprobe commands.'
  s.homepage         = 'https://github.com/Messagenius/ffmpeg-kit'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'ARTHENICA' => 'open-source@arthenica.com' }
  s.platform            = :osx
  s.requires_arc        = true
  s.static_framework    = true
  s.source = { :path => '.' }
  s.source_files        = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency          'FlutterMacOS'
  s.dependency          'ffmpegkit-macos', "6.0"
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
end
