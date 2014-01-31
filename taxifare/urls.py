from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.views.generic.simple import redirect_to, direct_to_template
from django.conf import settings

from api.registration import v1_api

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'taxifare.views.home', name='home'),
    # url(r'^taxifare/', include('taxifare.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # (r'^/?$', redirect_to, {'url': '/admin/'}),
    (r'^/?$', direct_to_template, {'template': 'home.html'}),
    (r'^doc/$', direct_to_template, {'template': 'doc.html'}),
    url(r'^api/', include(v1_api.urls)),
    url(r'^admin/', include(admin.site.urls)),
    (r'^media/(?P<path>.*)$', 'django.views.static.serve', {
        'document_root': settings.MEDIA_ROOT}),
)



# if settings.DEBUG:
#     # static files (images, css, javascript, etc.)
#     urlpatterns += patterns('',
#         )