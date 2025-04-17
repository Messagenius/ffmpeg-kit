Pod::Spec.new do |s|
  s.name             = 'ffmpegkit-ios'
  s.version          = '6.0'
  s.summary          = 'FFmpeg Kit ios HTTPS Binary'
  s.description      = 'Custom FFmpeg binary with HTTPS support for ios'
  s.homepage         = 'https://github.com/Messagenius/ffmpeg-kit'
  s.license          = { :type => 'LGPL-3.0' }
  s.author           = { 'Messagenius' => 'info@example.com' }
  s.source           = { :path => '.' }
  s.platform         = :ios, '14'
  s.vendored_frameworks = 'ffmpegkit.framework', 'libavcodec.framework', 'libavdevice.framework', 'libavfilter.framework', 'libavformat.framework', 'libavutil.framework', 'libswresample.framework', 'libswscale.framework'
end