from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

from tastypie.admin import ApiKeyInline
from models import *

class CityAdmin(admin.ModelAdmin):
    list_display = ('name', 'base_fare', 'base_km', 'extra_km_fare')
    list_editable = ('base_fare', 'base_km', 'extra_km_fare')

class FareVariationAdmin(admin.ModelAdmin):
    list_display = ('city', 'outside_city', 'night_charge')

class OfferAdmin(admin.ModelAdmin):
    list_display = ('name', 'date', 'discount_percent')

class CarAdmin(admin.ModelAdmin):
    list_display = ('model', 'fare_percent')
    list_editable = ('fare_percent',)

class CityTripAdmin(admin.ModelAdmin):
    list_display = ('city', 'trip_type', 'flat_fare')
    list_editable = ('trip_type', 'flat_fare')

admin.site.register(City, CityAdmin)
admin.site.register(FareVariation, FareVariationAdmin)
admin.site.register(Offer, OfferAdmin)
admin.site.register(TripType)
admin.site.register(Car, CarAdmin)
admin.site.register(CityTrip, CityTripAdmin)
