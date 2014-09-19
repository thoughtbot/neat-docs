<li class="title">
  <a href="#{{ type }}">
    <h3 class="type-heading">{{ (type + 's') }}</h3>
  </a>
</li>

{% for item in items %}
  <li><a href="#{{ item.context.name }}">{{ item.context.name }}</a></li>
{% endfor %}
