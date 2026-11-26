# BDD Cucumber Practice Project (Java + Selenium + Maven + TestNG)

A ready-to-practice starter framework covering the BDD topics studied so far:
Gherkin, feature files, step definitions, hooks, tags, Scenario Outline,
POM, Selenium integration, HTML/JSON/JUnit reporting, screenshots on failure,
and browser selection.

## Requirements

- JDK 17 or later
- Maven 3.8+
- Chrome, Firefox, or Microsoft Edge installed
- Internet connection for Maven dependencies and the demo test website

Selenium 4.27 includes Selenium Manager, which can usually resolve the browser
driver automatically. If your machine blocks driver downloads, configure the
matching browser driver manually.

## Open the project

1. Extract the ZIP file.
2. Open the `BDD_Cucumber_Practice` folder in IntelliJ IDEA or Eclipse as a Maven project.
3. Wait for Maven dependencies to download.
4. Confirm Java 17 is configured.
5. Run `mvn clean test`.

## Demo application

The examples use the public practice website:
https://the-internet.herokuapp.com/login

Valid credentials:
- Username: `tomsmith`
- Password: `SuperSecretPassword!`

Invalid credentials are used in the negative scenario. This is a public demo
site, so it may occasionally be unavailable or change.

## Run commands

```bash
# Run all scenarios in Chrome (default)
mvn clean test

# Run in Firefox
mvn clean test -Dbrowser=firefox

# Run in Edge
mvn clean test -Dbrowser=edge

# Run only smoke scenarios
mvn clean test -Dcucumber.filter.tags="@smoke"

# Run regression scenarios
mvn clean test -Dcucumber.filter.tags="@regression"

# Run scenarios tagged smoke OR regression
mvn clean test -Dcucumber.filter.tags="@smoke or @regression"

# Exclude scenarios tagged wip
mvn clean test -Dcucumber.filter.tags="not @wip"
```

If your shell treats quotes differently, keep the tag expression inside quotes.

## Reports and screenshots

After execution, check:
- `target/cucumber-reports.html` — Cucumber HTML report
- `target/cucumber.json` — JSON report
- `target/cucumber.xml` — JUnit XML report
- `target/failed-scenarios.txt` — failed scenario locations for reruns
- `target/screenshots/` — screenshots saved when scenarios fail

The HTML report also receives screenshot attachments from the Cucumber hooks.

## Project structure

```text
src/test/java
  context/       Scenario-scoped shared test context (PicoContainer)
  driver/        Browser creation and shutdown
  hooks/         Before/After hooks and failure screenshots
  pages/         Page Object classes and locators
  runners/       TestNG Cucumber runner
  steps/         Gherkin step definitions

src/test/resources
  features/      Gherkin feature files
```

## How the framework works

Feature file -> TestNG Cucumber runner -> Hooks -> Step definitions ->
Page Objects -> Selenium WebDriver -> Browser.

PicoContainer creates scenario-scoped objects and shares `TestContext` between
hooks and step definitions. This avoids using one static WebDriver across all
scenarios and is a safer foundation for future parallel execution.

## Practice tasks

1. Add a new `logout.feature` and automate logout.
2. Add a `Scenario Outline` for multiple invalid login combinations.
3. Add `@sanity` and `@negative` tags and run each tag separately.
4. Add a `SecureAreaPage` class and move secure-area locators/actions into it.
5. Add a new assertion for the flash message text.
6. Add a second browser and verify the same scenarios run there.
7. Intentionally break a locator and inspect the screenshot and HTML report.
8. Add a conditional hook using `@Before("@smoke")`.
9. Add a DataTable-based scenario for a group of login inputs.
10. Create your own feature for another page on the demo website.

## Important notes

- The project uses example dependency versions. You can upgrade compatible
  versions later.
- Keep assertions in step definitions; keep page interactions and locators in
  Page Objects.
- Do not commit real passwords, tokens, or private test data.
- The screenshots and reports are generated under `target/`, which Maven
  recreates after `mvn clean test`.
