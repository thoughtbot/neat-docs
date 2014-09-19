{% if item.type %}
  <section class="item-type">
    <h3 class="sub-heading">Type</h3>

    <p>
      {% if item.type[0] == "*" %}
        Any
      {% else %}
        <code>{{ item.type[0] | split('|') | trim | capitalize | join('</code>, <code>') | safe }}</code>
      {% endif %}
    </p>
  </section>
{% endif %}
