package context;

import driver.DriverFactory;
import org.openqa.selenium.WebDriver;
public class TestContext {
    private WebDriver driver;

    public WebDriver getDriver() {
        return driver;
    }

    public void startBrowser(String browser) {
        driver = DriverFactory.createDriver(browser);
    }

    public void stopBrowser() {
        DriverFactory.quitDriver(driver);
        driver = null;
    }
}
