{% set title_displayed = false %}
{% for require in item.requires %}

  {% if (view.display.access.indexOf(require.access[0]) != -1) and not (not view.display.alias and require.alias[0]) or require.external %}
    {% if not title_displayed %}
      {% set title_displayed = true %}
      <h3 class="sub-heading">Requires</h3>
      <ul class="list-unstyled">
    {% endif %}

    {% if require.external %}
      <li>
        {% if require.url %}
          <a href="{{ require.url}}"><code>{{ require.name }}</code></a>  {{ require.description }}</li>
        {% else %}
          <code>{{ require.name }}</code>
        {% endif %}
        {% if require.description %}
          <div class="requires-description">{{ require.description }}</div>
        {% endif %}
      </li>
    {% else %}
      <li>
        <a href="#{{ require.item.context.type }}-{{ require.item.context.name }}"><code>{{ require.item.context.name }}</code></a>
        {% if require.description %}
          <div class="requires-description">{{ require.description }}</div>
        {% endif %}
      </li>
    {% endif %}
  {% endif %}

{% endfor %}

{% if title_displayed %}
</ul>
{% endif %}
