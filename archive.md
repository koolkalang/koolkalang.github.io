---
layout: page
title: Archive
---

## Blog Posts

{% for post in site.posts %}
{% unless post.tags contains "personal" %}
  * {{ post.date | date_to_string }} &raquo;<b> [{{ post.title }}]({{ post.url }})</b> &raquo;
    {% for tag in post.tags %}<a class="tag" href="/tags/{{ tag }}/index.html">{{ tag }}</a>{% endfor %}
{% endunless %}
{% endfor %}
