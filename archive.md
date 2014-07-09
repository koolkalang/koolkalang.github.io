---
layout: page
title: Archive
---

## Blog Posts

{% for post in site.posts %}
{% unless post.tags contains "personal" %}
  * {{ post.date | date_to_string }} &raquo; [ {{ post.title}} ]({{ post.url }})
{% endunless %}
{% endfor %}
