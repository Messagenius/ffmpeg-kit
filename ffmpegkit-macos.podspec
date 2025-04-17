Pod::Spec.new do |s|
  s.name             = 'ffmpegkit-macos'
  s.version          = '6.0'
  s.summary          = 'FFmpeg Kit macOS HTTPS Binary'
  s.description      = 'Custom FFmpeg binary with HTTPS support for macOS'
  s.homepage         = 'https://github.com/Messagenius/ffmpeg-kit'
  s.license          = { :type => 'LGPL-3.0' }
  s.author           = { 'Messagenius' => 'info@example.com' }
  s.source           = { :path => '.' }
  s.osx.deployment_target = '10.15'
  s.osx.vendored_frameworks = 'ffmpegkit.framework', 'libavcodec.framework', 'libavdevice.framework', 'libavfilter.framework', 'libavformat.framework', 'libavutil.framework', 'libswresample.framework', 'libswscale.framework'
end