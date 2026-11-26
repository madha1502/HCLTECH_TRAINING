package steps;

import context.TestContext;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import org.testng.Assert;
import pages.LoginPage;
import pages.SecureAreaPage;

public class LoginSteps {
    private final TestContext context;
    private LoginPage loginPage;
    private SecureAreaPage secureAreaPage;

    public LoginSteps(TestContext context) {
        this.context = context;
    }

    @Given("the user opens the login page")
    public void openLoginPage() {
        loginPage = new LoginPage(context.getDriver());
        loginPage.open();
    }

    @When("the user enters username {string}")
    public void enterUsername(String username) {
        loginPage.enterUsername(username);
    }

    @When("the user enters password {string}")
    public void enterPassword(String password) {
        loginPage.enterPassword(password);
    }

    @When("the user submits the login form")
    public void submitLoginForm() {
        loginPage.clickLogin();
    }

    @Then("the secure area should be displayed")
    public void verifySecureArea() {
        secureAreaPage = new SecureAreaPage(context.getDriver());
        Assert.assertEquals(secureAreaPage.getHeading(), "Secure Area");
    }

    @Then("the login error should contain {string}")
    public void verifyLoginError(String expectedText) {
        Assert.assertTrue(loginPage.getFlashMessage().contains(expectedText),
                "Expected message to contain: " + expectedText);
    }

    @When("the user logs out")
    public void logout() {
        secureAreaPage = new SecureAreaPage(context.getDriver());
        secureAreaPage.logout();
    }

    @Then("the logout confirmation should contain {string}")
    public void verifyLogout(String expectedText) {
        Assert.assertTrue(loginPage.getFlashMessage().contains(expectedText),
                "Expected logout message to contain: " + expectedText);
    }
}
