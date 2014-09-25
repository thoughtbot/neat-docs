## Neat Documentation

All the following commands should be run on `master`

#### Initial Setup

```
bundle install
npm install
npm install -g gulp
```

#### Update the Theme

For local preview/theme development, run:

```
gulp
```

Then visit `http://localhost:3000/latest`

#### Update the Docs

To update the docs, first update the version in the `package.json` to match the
one [here](https://github.com/thoughtbot/neat/blob/master/lib/neat/version.rb),
then run the following command to update the local Neat folder:

```
gulp update
```

To generate the updated the docs, run:

```
gulp build
```

To publish to `gh-pages`, run:

```
gulp deploy
```

Deploying does not commit your changes, so make sure you do so and push to
`master`.

#### Credits

![thoughtbot](http://thoughtbot.com/images/tm/logo.png)

Neat is maintained and funded by [thoughtbot, inc](http://thoughtbot.com). Tweet your questions or suggestions to [@bourbonsass](https://twitter.com/bourbonsass) and while you’re at it follow us too.

#### License

Copyright © 2012–2014 [thoughtbot, inc](http://thoughtbot.com). Neat is free software, and may be redistributed under the terms specified in the [license](LICENSE.md).
