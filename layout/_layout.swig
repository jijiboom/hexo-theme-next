<!DOCTYPE html>

{% set html_class = 'theme-next ' + theme.scheme %}
{% if theme.motion.enable %}
  {% set html_class = html_class + ' use-motion' %}
{% endif %}

<html class="{{ html_class | lower }}" lang="{{ config.language }}">
<head>
  {% include '_partials/head.swig' %}
  <title>{% block title %}{% endblock %}</title>
  {% include '_third-party/analytics/index.swig' %}
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang || page.language || config.language }}">

  {# 浏览器兼容提示 #}
  <!--[if lt IE 10]>
    <div class="browserupgrade">
        <div class="tip">请先升级你的浏览器吧：） </div>
        <a href=" http://browsehappy.osfipin.com/ ">&gt;&gt;&gt; 点击升级 &lt;&lt;&lt;</a>
        <div class="tip-author"> -by {{ config.title }} </div>
    </div>
    <style>.container_next{display:none}</style>
  <![endif]-->

  {# 设置外层容器class类名 #}
  {% set container_class = "container " %}
  {% if theme.sidebar.position %}
    {% set container_class = container_class + 'sidebar-position-' + theme.sidebar.position %}
  {% endif %}

  <div class="{{ container_class }} {% block page_class %}{% endblock %}">
    {#<div class="headband"></div>#}

    {# 引入公共头部模块 header.swig #}
    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header-inner"> {%- include '_partials/header.swig' %} </div>
    </header>

    {# 正文 #}
    <main id="main" class="main">
      {# 正文外层容器 #}
      <div class="main-outer">
        {% block out_content %}{% endblock %}
        <div id="content" class="content">
            {% block content %}{% endblock %}
        </div>
        {% include '_partials/comments.swig' %}
      </div>
      {# 正文内层容器 #}
      <div class="main-inner">
        <div class="content-wrap">
          {#
          <div id="content" class="content">
            {% block content %}{% endblock %}
          </div>
          {% include '_third-party/duoshuo-hot-articles.swig' %}
           #}
        </div>
        {% if theme.sidebar.display !== 'remove' %}
          {% block sidebar %}{% endblock %}
        {% endif %}
      </div>
    </main>

    {# 公共底 #}
    <footer id="footer" class="footer">
        <div class="footer-outer">
            {% include '_partials/footer.swig' %}
        </div>
        <div class="footer-inner">
            {% include '_third-party/analytics/analytics-with-widget.swig' %}
            {% block footer %}{% endblock %}
        </div>
    </footer>

    {% if not theme.sidebar.b2t %}
      <div class="back-to-top">
        <i class="fa fa-arrow-up"></i>
        {% if theme.sidebar.scrollpercent %}
          <span id="scrollpercent"><span>0</span>%</span>
        {% endif %}
      </div>
    {% endif %}

    {% if theme.needmoreshare2.enable and theme.needmoreshare2.float.enable %}
      <div id="needsharebutton-float">
        <span class="btn">
          <i class="fa fa-share-alt" aria-hidden="true"></i>
        </span>
      </div>
    {% endif %}

  </div>

  {% include '_scripts/vendors.swig' %}
  {% include '_scripts/commons.swig' %}

  {% set scheme_script = '_scripts/schemes/' + theme.scheme | lower + '.swig' %}
  {% include scheme_script %}

  {% block script_extra %}{% endblock %}

  {% include '_scripts/boostrap.swig' %}

  {% include '_third-party/comments/index.swig' %}
  {% include '_third-party/search/index.swig' %}
  {% include '_third-party/analytics/lean-analytics.swig' %}
  {% include '_third-party/seo/baidu-push.swig' %}
  {% include '_third-party/needsharebutton.swig' %}
  {% include '_third-party/rating.swig' %}
  {% include '_third-party/mathjax.swig' %}
  {% include '_third-party/scroll-cookie.swig' %}
  {% include '_third-party/exturl.swig' %}
</body>
</html>
