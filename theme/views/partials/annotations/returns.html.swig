{% if item.returns %}
  <h3 class="sub-heading">Returns</h3>
  <p class="item-description">{% if item.returns[0].htmlDescription %}{{ item.returns[0].htmlDescription | safe }}{% endif %}
  {% if item.returns[0].type == '*' %}
    Any
  {% else %}
    {{ item.returns[0].type | split('|') | trim | capitalize | join(', ') }}
  {% endif %}
  </p>
{% endif %}
