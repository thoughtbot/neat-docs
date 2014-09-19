<h1 id="{{ type }}" class="type-title">
  <span data-role="content-wrapper">
    {{ (type + 's') }}
  </span>
</h1>

<section class="{{ (type + 's') }}">
  {% for item in items %}
    {% include "item.html.swig" with item %}
  {% endfor %}
</section>
