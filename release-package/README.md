# Custom FFmpeg Kit Build for Android

This is a custom build of FFmpeg Kit for Android, built with specific configurations to meet our project requirements.

## Included Architectures

- arm-v7a
- arm-v7a-neon
- arm64-v8a
- x86
- x86-64

## Installation

### Option 1: Use the AAR file directly

1. Copy the `libs/ffmpeg-kit.aar` file to your project's `app/libs` directory
2. Add the following to your app's `build.gradle` file:

```gradle
repositories {
    flatDir {
        dirs 'libs'
    }
}

dependencies {
    implementation(name: 'ffmpeg-kit', ext: 'aar')
}
```

### Option 2: Use as Maven dependency (if published)

```gradle
dependencies {
    implementation 'com.yourdomain:ffmpeg-kit:1.0.0'
}
```

## Basic Usage

```java
import com.arthenica.ffmpegkit.FFmpegKit;
import com.arthenica.ffmpegkit.FFmpegSession;
import com.arthenica.ffmpegkit.ReturnCode;

// Simple execution
FFmpegSession session = FFmpegKit.execute("-i input.mp4 -c:v mpeg4 output.mp4");

// Check the result
if (ReturnCode.isSuccess(session.getReturnCode())) {
    // SUCCESS
} else if (ReturnCode.isCancel(session.getReturnCode())) {
    // CANCEL
} else {
    // FAILURE
    Log.d("FFmpeg", String.format("Command failed with state %s and rc %s.%s", 
            session.getState(), session.getReturnCode(), session.getFailStackTrace()));
}
```

### Execute with Callback

```java
FFmpegKit.executeAsync("-i input.mp4 -c:v mpeg4 output.mp4", session -> {
    if (ReturnCode.isSuccess(session.getReturnCode())) {
        // SUCCESS
    } else {
        // FAILURE
    }
});
```

## License

This FFmpeg build includes components licensed under LGPL, and potentially other licenses. See LICENSE file for details.

---

For more information, refer to the official FFmpeg Kit documentation at https://github.com/arthenica/ffmpeg-kit 