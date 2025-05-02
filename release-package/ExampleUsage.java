import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.arthenica.ffmpegkit.FFmpegKit;
import com.arthenica.ffmpegkit.FFmpegSession;
import com.arthenica.ffmpegkit.FFprobeKit;
import com.arthenica.ffmpegkit.FFprobeSession;
import com.arthenica.ffmpegkit.LogCallback;
import com.arthenica.ffmpegkit.ReturnCode;
import com.arthenica.ffmpegkit.SessionState;
import com.arthenica.ffmpegkit.Statistics;
import com.arthenica.ffmpegkit.StatisticsCallback;

import java.io.File;
import java.util.Locale;

public class ExampleUsage extends AppCompatActivity {

    private static final String TAG = "FFmpegKit";
    private TextView outputText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        outputText = findViewById(R.id.output_text);
        
        // Example buttons
        findViewById(R.id.btn_convert_video).setOnClickListener(v -> convertVideo());
        findViewById(R.id.btn_get_media_info).setOnClickListener(v -> getMediaInfo());
    }
    
    /**
     * Example 1: Basic video conversion
     */
    private void convertVideo() {
        // Input file in app's private storage
        String inputPath = new File(getExternalFilesDir(null), "input.mp4").getAbsolutePath();
        
        // Output file in app's private storage
        String outputPath = new File(getExternalFilesDir(null), "output.mp4").getAbsolutePath();
        
        // Build FFmpeg command
        String command = String.format("-i %s -c:v mpeg4 -b:v 2M -c:a aac -b:a 128k %s", inputPath, outputPath);
        
        Log.d(TAG, "Running FFmpeg command: " + command);
        appendToOutput("Starting conversion...");
        
        // Execute FFmpeg command with callbacks
        FFmpegKit.executeAsync(command, 
            session -> {
                // CALLED WHEN SESSION IS COMPLETED
                SessionState state = session.getState();
                ReturnCode returnCode = session.getReturnCode();
                
                if (ReturnCode.isSuccess(returnCode)) {
                    appendToOutput("Conversion completed successfully");
                    Log.d(TAG, "Conversion completed successfully");
                } else {
                    appendToOutput("Conversion failed with state: " + state + ", return code: " + returnCode);
                    Log.d(TAG, String.format("Conversion failed with state %s and return code %s", state, returnCode));
                    Log.d(TAG, "Failure stack trace: " + session.getFailStackTrace());
                }
            },
            log -> {
                // CALLED WHEN SESSION PRINTS LOGS
                appendToOutput(log.getMessage());
            },
            statistics -> {
                // CALLED WHEN SESSION GENERATES STATISTICS
                updateStats(statistics);
            });
    }
    
    /**
     * Example 2: Get media information using FFprobe
     */
    private void getMediaInfo() {
        String inputPath = new File(getExternalFilesDir(null), "input.mp4").getAbsolutePath();
        
        // Execute FFprobe to get media information
        FFprobeSession session = FFprobeKit.getMediaInformation(inputPath);
        
        if (ReturnCode.isSuccess(session.getReturnCode())) {
            String information = session.getMediaInformation().toString();
            appendToOutput("Media Information:\n" + information);
            Log.d(TAG, "Media info: " + information);
        } else {
            appendToOutput("Failed to get media information");
            Log.d(TAG, "Get media info failed with state: " + session.getState() + ", return code: " + session.getReturnCode());
        }
    }
    
    /**
     * Update UI with progress statistics
     */
    private void updateStats(Statistics statistics) {
        runOnUiThread(() -> {
            float progress = Float.parseFloat(String.format(Locale.US, "%.2f", statistics.getTime() / 1000));
            int speed = (int)statistics.getSpeed();
            int bitrate = (int)statistics.getBitrate();
            
            String statsText = String.format(Locale.US, 
                "Time: %.2fs, Speed: %dx, Bitrate: %dkbps", 
                progress, speed, bitrate);
            
            // Update a progress TextView for example
            outputText.setText(statsText);
        });
    }
    
    /**
     * Append text to the output TextView
     */
    private void appendToOutput(String text) {
        runOnUiThread(() -> {
            outputText.append(text + "\n");
        });
    }
} 