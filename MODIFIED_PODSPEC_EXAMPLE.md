# Modifying Your Podspec for Custom FFmpeg Kit Binaries

Below is an example of how to modify the `ffmpeg_kit_flutter.podspec` file to use your own hosted binaries instead of the original ones that have been removed.

## Original Podspec (excerpt)

```ruby
s.subspec 'https' do |ss|
  ss.source_files         = 'Classes/**/*'
  ss.public_header_files  = 'Classes/**/*.h'
  ss.dependency 'ffmpeg-kit-macos-https', "6.0"
  ss.osx.deployment_target = '10.15'
end
```

## Modified Podspec for Custom Binaries

```ruby
# Option 1: Direct modification of the original podspec
s.subspec 'https' do |ss|
  ss.source_files         = 'Classes/**/*'
  ss.public_header_files  = 'Classes/**/*.h'
  # Modified to use a custom source instead of the CocoaPods version
  ss.dependency 'ffmpeg-kit-macos-https-custom', "6.0"
  ss.osx.deployment_target = '10.15'
end

# Option 2: Creating a separate podspec for ffmpeg-kit-macos-https-custom
# In a new file named ffmpeg-kit-macos-https-custom.podspec:

Pod::Spec.new do |s|
  s.name             = 'ffmpeg-kit-macos-https-custom'
  s.version          = '6.0'
  s.summary          = 'FFmpeg Kit macOS HTTPS Custom Binary'
  s.description      = 'Custom hosted FFmpeg binary with HTTPS support for macOS'
  s.homepage         = 'https://github.com/your-username/ffmpeg-kit'
  s.license          = { :type => 'LGPL-3.0' }
  s.author           = { 'Your Name' => 'your.email@example.com' }
  
  s.osx.deployment_target = '10.15'
  s.osx.vendored_frameworks = 'ffmpeg-kit.xcframework'
  
  s.source = { 
    :http => 'https://github.com/your-username/ffmpeg-kit/releases/download/v6.0/ffmpeg-kit-https-6.0-macos-xcframework.zip',
    :sha256 => 'your-binary-sha256-checksum'
  }
end
```

## Using a Local Binary

If you prefer to bundle the binary with your source code:

```ruby
Pod::Spec.new do |s|
  s.name             = 'ffmpeg-kit-macos-https-custom'
  s.version          = '6.0'
  s.summary          = 'FFmpeg Kit macOS HTTPS Custom Binary'
  s.description      = 'Custom FFmpeg binary with HTTPS support for macOS'
  s.homepage         = 'https://github.com/your-username/ffmpeg-kit'
  s.license          = { :type => 'LGPL-3.0' }
  s.author           = { 'Your Name' => 'your.email@example.com' }
  
  s.osx.deployment_target = '10.15'
  s.osx.vendored_frameworks = 'ffmpeg-kit.xcframework'
  
  # Using a local path for development
  s.source = { :path => './Frameworks' }
end
```

## Calculating SHA256 Checksum

To get the SHA256 checksum of your zip file:

```bash
shasum -a 256 ffmpeg-kit-https-6.0-macos-xcframework.zip
```

Use the output value for the `:sha256` parameter in your podspec. 