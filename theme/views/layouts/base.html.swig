<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description" content="{{ package.description }}">
    <link href="http://fonts.googleapis.com/css?family=Nunito:300,700" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Titillium+Web:400,400italic,600italic,600,700,700italic,900,300italic,300,200italic,200" rel="stylesheet" type="text/css">
    <title>{{ package.title }}</title>
    <link rel="stylesheet" href="assets/css/main.css" />
  </head>

  <body>
    {% include "../partials/navigation.html.swig" %}

    <div class="main-content">
      {% block content %}{% endblock %}
    </div>

    {% include "../partials/javascript.html.swig" %}
  </body>
</html>
