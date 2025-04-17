# FFmpeg Kit Binary Hosting

This repository contains documentation and tools for hosting your own FFmpeg Kit binaries since the original author has removed them from the official repository.

## Background

FFmpeg Kit has been officially retired, and according to the [official notice](https://github.com/arthenica/ffmpeg-kit), all previously released binaries will be removed according to the following schedule:

| FFmpegKit Version |  Available Until   |
|:-----------------:|:------------------:|
|   Less than 6.0   | February 1st, 2025 |
|        6.0        |  April 1st, 2025   |

To ensure your projects continue to work after these dates, you'll need to host your own copies of the FFmpeg Kit binaries.

## Documentation

This repository includes several guides to help you host FFmpeg Kit binaries:

1. [Quick Start Guide](QUICK_START.md) - Get started quickly with hosting your own binaries
2. [Detailed Hosting Guide](GITHUB_HOSTING_GUIDE.md) - In-depth instructions for hosting on GitHub
3. [Podspec Modification Example](MODIFIED_PODSPEC_EXAMPLE.md) - How to update your podspec files

## URL Structure

The original FFmpeg Kit used the following URL structure for its binaries:

```
https://github.com/arthenica/ffmpeg-kit/releases/download/v{VERSION}/ffmpeg-kit-{VARIANT}-{VERSION}-{PLATFORM}-xcframework.zip
```

For example:
```
https://github.com/arthenica/ffmpeg-kit/releases/download/v6.0/ffmpeg-kit-https-6.0-macos-xcframework.zip
```

To maintain compatibility with existing tools and scripts, you should follow the same URL structure in your own GitHub repository.

## Building and Hosting

There are two main approaches:

1. **Build from Source**: Clone the FFmpeg Kit repository and build the binaries yourself using the provided scripts.
2. **Use Existing Binaries**: If you already have the binaries or can extract them from your project, you can directly host these.

Follow the [Detailed Hosting Guide](GITHUB_HOSTING_GUIDE.md) for step-by-step instructions.

## License Considerations

Please note that FFmpeg Kit and its dependencies are licensed under either LGPL or GPL, depending on the components included. Make sure you understand the licensing implications before distributing the binaries.

## Support

If you encounter issues while following these guides, please open an issue in this repository, and we'll try to help.

## Legal Notice

This repository is not affiliated with the original FFmpeg Kit project or its author. It is intended to help developers maintain their projects after the official binaries are removed.
