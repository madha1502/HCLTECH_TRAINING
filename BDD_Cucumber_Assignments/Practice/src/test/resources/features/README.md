# Feature files

- `login.feature`: runnable positive, negative, smoke and logout examples.
- `login_data_driven.feature`: Scenario Outline examples, tagged `@wip`.

To include the data-driven examples, remove `@wip` or run:
`mvn clean test -Dcucumber.filter.tags="not @wip"`
