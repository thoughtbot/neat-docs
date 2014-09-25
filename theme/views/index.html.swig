{% extends "layouts/base.html.swig" %}

{% block content %}
  <header class="search-bar">
    <section data-role="content-wrapper">
      <div class="meta-data">
        <h1>{{ package.name | capitalize }}{% if package.version %} <span>{{ package.version }}</span>{% endif %}</h1>
      </div>

      <div class="search-form" data-role="search-form">
        <input name="search" type="text" class="search-field" autocomplete="off" autofocus id="search-field" placeholder="Search documentation..." />
        <ul class="suggestion-container"></ul>
      </div>
    </section>
  </header>

  <section class="main-inner">
    {% for group_name, group in data.byGroupAndType %}
      {% for type, items in group %}
        {% if type == "mixin" %}
          {% include "partials/type_group.html.swig" %}
        {% endif %}
      {% endfor %}
      {% for type, items in group %}
        {% if type == "function" %}
          {% include "partials/type_group.html.swig" %}
        {% endif %}
      {% endfor %}
      {% for type, items in group %}
        {% if type == "variable" %}
          {% include "partials/type_group.html.swig" %}
        {% endif %}
      {% endfor %}
    {% endfor %}
    <footer class="footer">
      {% include "partials/footer.html.swig" %}
    </footer>
  </section>
{% endblock %}
