{% set name = item.context.name %}

<article id="{{ name }}" data-name="{{ name }}" data-type="{{ item.context.type }}" class="item"
  {% if item.alias %} data-alias="true"{% endif %}
  {% if item.deprecated %} data-deprecated="true"{% endif %}>
  <div data-role="content-wrapper">
    {% include "annotations/title.html.swig" %}
    {% include "annotations/declaration.html.swig" %}

    {% if not item.alias %}
      {% for annotation in view.display.annotations[item.context.type] %}
        {% set path = "annotations/" + annotation + ".html.swig" %}
        {% include path %}
      {% endfor %}
    {% else %}
      <p>Refer to <a href="#{{ item.context.type }}-{{ item.alias[0] }}">{{ item.alias[0] }}</a>.</p>
    {% endif %}
  </div>
</article>
