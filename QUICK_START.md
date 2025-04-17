# Quick Start Guide for Hosting FFmpeg Kit Binaries

If you need to quickly host FFmpeg Kit binaries to replace the removed ones from the original repository, follow these steps:

## 1. Create a GitHub Repository

Create a new repository on GitHub that will host your FFmpeg Kit binaries.

## 2. Build the Binaries

The fastest way to build the binaries is to use the original FFmpeg Kit repository:

```bash
# Clone the original repository
git clone https://github.com/arthenica/ffmpeg-kit.git
cd ffmpeg-kit

# Install dependencies (macOS example)
brew install autoconf automake libtool pkg-config curl git doxygen nasm cmake gcc gperf texinfo yasm bison autogen wget gettext meson ninja ragel groff gtk-doc-tools libtasn1

# Build for macOS with HTTPS support
./macos.sh --enable-gnutls
```

## 3. Create a GitHub Release

1. Create a release on your GitHub repository with the tag `v6.0` (or whatever version you need)
2. Package the binaries:
   ```bash
   cd prebuilt/bundle-apple-xcframework-macos/
   zip -r ffmpeg-kit-https-6.0-macos-xcframework.zip ffmpeg-kit.xcframework/
   ```
3. Upload the zip file to your release as an asset

## 4. Test the Download URL

Ensure the URL structure matches what your application expects:
```
https://github.com/your-username/ffmpeg-kit/releases/download/v6.0/ffmpeg-kit-https-6.0-macos-xcframework.zip
```

## 5. Update Your Project

Update your podspec or project configuration to use the new URL:

```ruby
s.source = { 
  :http => "https://github.com/your-username/ffmpeg-kit/releases/download/v6.0/ffmpeg-kit-https-6.0-macos-xcframework.zip" 
}
```

## Important Notes

1. Make sure the filename matches exactly what the original repository used
2. If you're using CocoaPods, you may need to update the checksum in your podspec
3. This approach keeps your application working without code changes 