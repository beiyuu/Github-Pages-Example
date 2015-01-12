---
layout: home
---

<div class="index-content blog">
    <div class="section">
        <ul class="artical-list">
        {% for post in site.categories %}
            <li>
                <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
                <div class="title-desc">{{ post.description }}</div>
            </li>
        {% endfor %}
        </ul>
    </div>
    <div class="aside">
    </div>
</div>
