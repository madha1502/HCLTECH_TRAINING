package hooks;

import context.TestContext;
import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Hooks {
    private final TestContext context;

    public Hooks(TestContext context) {
        this.context = context;
    }

    @Before
    public void launchBrowser() {
        String browser = System.getProperty("browser", "chrome");
        context.startBrowser(browser);
    }

    @After
    public void captureFailureAndClose(Scenario scenario) {
        WebDriver driver = context.getDriver();

        try {
            if (scenario.isFailed() && driver instanceof TakesScreenshot) {
                byte[] image = ((TakesScreenshot) driver)
                        .getScreenshotAs(OutputType.BYTES);

                scenario.attach(image, "image/png", "Failure screenshot");

                Path directory = Paths.get("target", "screenshots");
                Files.createDirectories(directory);

                String safeName = scenario.getName()
                        .replaceAll("[^a-zA-Z0-9-_]", "_");
                String timestamp = LocalDateTime.now()
                        .format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss_SSS"));
                Path output = directory.resolve(safeName + "_" + timestamp + ".png");

                Files.write(output, image);
                System.out.println("Failure screenshot saved: " + output);
            }
        } catch (Exception e) {
            System.err.println("Could not capture failure screenshot: " + e.getMessage());
        } finally {
            context.stopBrowser();
        }
    }
}
