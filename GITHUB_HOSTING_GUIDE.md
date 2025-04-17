# Hosting FFmpeg Kit Binaries on GitHub

Since the original FFmpeg Kit binaries have been removed from GitHub, this guide will help you host your own copies to maintain the same URL structure that your project depends on.

## Step 1: Fork or Create a Repository

1. Create a new repository on GitHub (e.g., `your-username/ffmpeg-kit`)
2. Clone the repository locally:
   ```bash
   git clone https://github.com/your-username/ffmpeg-kit.git
   cd ffmpeg-kit
   ```

## Step 2: Build FFmpeg Kit Binaries

Follow these steps to build the FFmpeg Kit binaries for macOS:

1. Clone the original FFmpeg Kit repository:
   ```bash
   git clone https://github.com/arthenica/ffmpeg-kit.git ffmpeg-kit-source
   cd ffmpeg-kit-source
   ```

2. Install the required dependencies:
   ```bash
   brew install autoconf automake libtool pkg-config curl git doxygen nasm cmake gcc gperf texinfo yasm bison autogen wget gettext meson ninja ragel groff gtk-doc libtasn1
   ```

3. Build the macOS binaries (for the https package):
   ```bash
   ./macos.sh --enable-gnutls
   ```

4. Wait for the build to complete. The binaries will be located in:
   ```
   prebuilt/bundle-apple-xcframework-macos/
   ```

## Step 3: Create GitHub Releases

1. Create a new release in your GitHub repository with the exact same tag as used in the original repository (e.g., `v6.0`)

2. For each binary variant, zip the xcframework and upload it as a release asset with the exact same filename:
   ```bash
   cd prebuilt/bundle-apple-xcframework-macos/
   zip -r ffmpeg-kit-https-6.0-macos-xcframework.zip ffmpegkit.framework/
   ```

3. Upload the zip file to your GitHub release.

4. Ensure the URL follows the pattern:
   ```
   https://github.com/your-username/ffmpeg-kit/releases/download/v6.0/ffmpeg-kit-https-6.0-macos-xcframework.zip
   ```

## Step 4: Modify Your Project to Use the New URLs

If you're using CocoaPods, you'll need to modify the pod spec to point to your GitHub repository:

```ruby
# In your podspec file
s.source = { 
  :http => "https://github.com/Messagenius/ffmpeg_kit/releases/download/v6.0/ffmpeg-kit-https-6.0-macos-xcframework.zip",
  :sha256 => "your-binary-sha256-checksum" 
}
```

## Directory Structure Guide

The FFmpeg Kit binaries follow a specific naming convention for the URLs:

```
https://github.com/username/ffmpeg-kit/releases/download/v{VERSION}/ffmpeg-kit-{VARIANT}-{VERSION}-{PLATFORM}-xcframework.zip
```

Where:
- `{VERSION}`: The version number (e.g., `6.0`)
- `{VARIANT}`: The FFmpeg variant (e.g., `https`, `min`, `full`, etc.)
- `{PLATFORM}`: The platform (e.g., `macos`, `ios`, `tvos`)

## Alternative: Use Local Binaries

If you can't host the binaries on GitHub, you can also use local binaries:

1. Copy the built binaries to your project
2. Update your podspec to use local files:
   ```ruby
   s.source = { :path => "path/to/local/ffmpeg-kit-binaries" }
   ```

## Maintaining Your Repository

Make sure to keep your repository well-documented and maintain a clear versioning scheme that matches the original repository. This will help ensure your project and other dependencies can continue to work correctly. 