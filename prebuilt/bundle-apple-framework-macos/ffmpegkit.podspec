Pod::Spec.new do |s|
  s.name             = 'ffmpegkit'
  s.version          = '6.0'
  s.summary          = 'FFmpeg Kit macOS HTTPS Binary'
  s.description      = 'Custom FFmpeg binary with HTTPS support for macOS'
  s.homepage         = 'https://github.com/Messagenius/ffmpeg_kit'
  s.license          = { :type => 'LGPL-3.0' }
  s.author           = { 'Messagenius' => 'info@example.com' }
  
  s.osx.deployment_target = '10.15'
  s.osx.vendored_frameworks = 'ffmpegkit.framework', 'libavcodec.framework', 'libavdevice.framework', 'libavfilter.framework', 'libavformat.framework', 'libavutil.framework', 'libswresample.framework', 'libswscale.framework'
  
  s.source = { 
    :http => 'https://github.com/Messagenius/ffmpeg_kit/releases/download/v6.0/ffmpeg-kit-https-6.0-macos-xcframework.zip',
    :sha256 => '942e4c657dd37c792dc6ab1647be056f4d971a933a2c414036bac0d06bf58d7f'
  }

end