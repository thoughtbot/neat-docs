## Neat Documentation

All the following commands should be run on `master`

#### Initial Setup

```
bundle install
npm install
```

You might need to `npm install -g gulp`

#### Update the Theme

For local theme development, run:

```
gulp develop
```

Then visit `http://localhost:3000/latest`

#### Update the Docs

To update the docs, run the following command:

```
gulp
```

This will update the Neat local folder, generate the docs, and deploy them to
gh-pages.

