<header class="title-bar">
  <h2 class="item-title">
    <a href="#{{ name }}">
      {{ name }}
    </a>
  </h2>

  {% if item.context.type == "variable" %}
    <span class="type-label">{{ item.type[0] }}</span>
  {% endif %}

  <div class="metadata">
    {% if view.display.alias and item.aliased.length > 0 %}
    <span class="aliased">
      (aliased as {% for alias in item.aliased %} <a href="#{{ alias }}"><code>{{ alias }}</code></a> {% endfor %})
    </span>
    {% endif %}

    {% if item.alias %}
      <span class="alias">(alias for <a href="#{{ item.alias[0] }}"><code>{{ item.alias[0] }}</code></a>)</span>
    {% endif %}

    {% if item.since.length == 1 %}
      <span class="since">Since {{ item.since[0].version }} - {{ item.since[0].description }}</span>
    {% endif %}

    {% if item.deprecated %}
      <p class="deprecated"><strong>Deprecated!</strong>{% if item.deprecated[0] != "" %} {{ item.deprecated[0] }}{% endif %}
    </p>
    {% endif %}
  </div>

  {% if view.basePath %}
  <a class="view-source" href="{{ view.basePath }}/{{ item.file.path }}">View source</a>
  {% endif %}
</header>
