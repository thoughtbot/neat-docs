<div class="declaration">
  {% if item.context.type == "placeholder" %}
    <pre class="code language-scss"><code>%{{ item.context.name }} { ... }</code></pre>
  {% elseif item.context.type == "variable" %}
    <pre class="code language-scss"><code>${{ item.context.name }}: {{ item.context.value | safe }}{% if item.context.scope !== "private" %} !{{ item.context.scope }}{% endif %};</code></pre>

  {% else %}
    {% set parameters_string = "" %}
    {% for parameter in item.parameters %}
      {% set value = "$" + parameter.name %}

      {% if parameter.default %}
        {% set value = value + ": " + parameter.default %}
      {% endif %}

      {% if parameter.type | lower === "arglist" %}
        {% set value = value + "..." %}
      {% endif %}

      {% if loop.first %}
        {% set parameters_string = value %}
      {% else %}
        {% set parameters_string = parameters_string + ", " + value %}
      {% endif %}
    {% endfor %}
    <pre class="code language-scss"><code>@{{ item.context.type }} {{ item.context.name }}({{ parameters_string }}) { ... }</code></pre>
  {% endif %}
</div>
