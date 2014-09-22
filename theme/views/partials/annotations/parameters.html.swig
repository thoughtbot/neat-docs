{% if item.parameters.length > 0 %}
  <h3 class="sub-heading">Parameters</h3>
  <dl class="parameters">
  {% for parameter in item.parameters %}
    <dt class="parameter">
      <code class="name">${{ parameter.name }}</code>
      <ul class="meta">
        <span class="type-label">{{ parameter.type | split("|") | trim | join(", ") }}</span>
        {% if not parameter.default %}
          <span class="required-label">Required</span>
        {% else %}
          <span class="default-label">
            Default:<code>{{ parameter.default }}</code>
          </span>
        {% endif %}
      </ul>
    </dt>
    <dd class="parameter-definition">
      <div class="description">
        {{ parameter.htmlDescription | default("<p>No description available.</p>") | safe }}
      </div>
    </dd>
  {% endfor %}
  </dl>
  {% else %}
    <p>This {{ item.context.type }} takes no parameters.</p>
{% endif %}
