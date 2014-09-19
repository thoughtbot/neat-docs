{% if item.example %}
  <section class="example">
    <h3 class="sub-heading">Example</h3>

    {% for example in item.example %}
      <pre class="code language-{{ example.type }}">{% if example.description %}<h4 class="description">{{ example.description }}</h4>{% endif %}<code>{{ example.code | escape | safe }}</code></pre>
      {% endfor %}
    </section>
{% endif %}
