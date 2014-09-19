
<nav class="side-nav">
  <ul class="social">
    <li><a class="github" href="https://github.com/thoughtbot/neat">GitHub / Install</a></li>
    <li><a class="twitter" href="https://twitter.com/bourbonsass">Twitter</a></li>
    <li><a class="gitter" href="https://gitter.im/thoughtbot/neat">Gitter</a></li>
  </ul>

  <a class="logo-container" href="/">
    <img alt="Bourbon Neat Logo" class="logo" src="assets/images/neat-logo.svg">
  </a>

  <ul class="list">
    {% for group_name, group in data.byGroupAndType %}
      {% for type, items in group %}
        {% if type == "mixin" %}
          {% include "type_list.html.swig" %}
        {% endif %}
      {% endfor %}
      {% for type, items in group %}
        {% if type == "function" %}
          {% include "type_list.html.swig" %}
        {% endif %}
      {% endfor %}
      {% for type, items in group %}
        {% if type == "variable" %}
          {% include "type_list.html.swig" %}
        {% endif %}
      {% endfor %}
    {% endfor %}
  </ul>
</nav>
