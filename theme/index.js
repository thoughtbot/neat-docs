var swig = new (require("swig").Swig)();
var themeleon = require("themeleon")().use("swig");
var filter = require("sassdoc-filter");
var indexer = require("sassdoc-indexer");
var extend = require("extend");
var extras = require("swig-extras");

extras.useFilter(swig, "split");
extras.useFilter(swig, "trim");
extras.useFilter(swig, "groupby");

themeleon.use("swig", swig);

var theme = themeleon(__dirname, function (t) {
  t.copy("assets");
  t.swig("views/index.html.swig", "index.html");
});

module.exports = function (dest, ctx) {
  if (!("view" in ctx)) {
    ctx.view = {};
  }

  ctx.view = extend(require("./view.json"), ctx.view);

  if (!ctx.view.display) {
    ctx.view.display = {};
  }

  ctx.view.display.annotations = {
    "function": ["description", "parameters", "returns", "example", "throws", "requires", "usedby", "since", "see", "todo", "link", "author"],
    "mixin": ["description", "parameters", "output", "example", "throws", "requires", "usedby", "since", "see", "todo", "link", "author"],
    "placeholder": ["description", "example", "throws", "requires", "usedby", "since", "see", "todo", "link", "author"],
    "variable": ["description", "prop", "requires", "example", "usedby", "since", "see", "todo", "link", "author"]
  };

  filter.markdown(ctx);
  ctx.data.byGroupAndType = indexer.byGroupAndType(ctx.data);
  return theme.apply(this, arguments);
};
