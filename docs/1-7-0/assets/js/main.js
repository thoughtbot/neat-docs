var App;

App = (function() {
  var $items, $searchForm, $searchInput, $suggestionContainer, $suggestions, LINK_CLASS, items, searchEngine, searchOptions, suggestions;

  LINK_CLASS = "result-link";

  $items = $("article.item");

  $searchInput = $(".search-field");

  $searchForm = $("[data-role=search-form]");

  $suggestionContainer = $(".suggestion-container");

  $suggestions = $("." + LINK_CLASS);

  suggestions = [];

  searchOptions = {
    keys: ["name"],
    threshold: 0.3,
    caseSensitive: false
  };

  items = $items.map(function() {
    var $item;
    $item = $(this);
    return {
      name: $item.data("name"),
      type: $item.data("type"),
      node: $item
    };
  });

  searchEngine = new Fuse(items, searchOptions);

  function App() {
    hljs.initHighlightingOnLoad();
    this.initSearch();
  }

  App.prototype.fillSuggestions = function(items) {
    $suggestionContainer.html("");
    suggestions = $.map(items.slice(0, 10), function(item) {
      var $item;
      $item = $("<li />", {
        "data-type": item.type,
        "data-name": item.name,
        "class": "result",
        html: "<a href=\"#" + item.name + "\" class=\"result-link\"><code>" + (item.type.slice(0, 1)) + "</code>" + item.name + "</a>"
      });
      return $suggestionContainer.append($item);
    });
    return this.bindResultClicks();
  };

  App.prototype.search = function(term) {
    return this.fillSuggestions(searchEngine.search(term));
  };

  App.prototype.bindResultClicks = function() {
    var self;
    self = this;
    return $("." + LINK_CLASS).on('click', function(event) {
      var $target;
      $target = $(event.target);
      $searchInput.val($target.parent().data("name"));
      return suggestions = self.fillSuggestions([]);
    });
  };

  App.prototype.initSearch = function() {
    var self;
    self = this;
    return $searchInput.on("keyup", function(event) {
      var currentSelection;
      if (event.keyCode !== 40 && event.keyCode !== 38) {
        currentSelection = -1;
        suggestions = self.search($(this).val());
      } else {
        event.preventDefault();
      }
    }).on("search", function() {
      return suggestions = self.search($(this).val());
    });
  };

  return App;

})();

$(function() {
  return new App;
});
