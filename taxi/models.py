from django.db import models
from django.contrib.auth.models import User
from django.core.cache import cache

from tastypie.models import create_api_key
from taxi.cache_key import *

class City(models.Model):
	name 			= models.CharField("Name", max_length=255, unique=True)
	base_fare 		= models.FloatField("Base Fare", default=0.0)
	base_km 		= models.FloatField("Base KM", default=0.0)
	extra_km_fare 	= models.FloatField("Extra KM Fare", default=0.0)

	def __unicode__(self):
		return self.name

class FareVariation(models.Model):
	city 			= models.OneToOneField(City)
	outside_city	= models.FloatField("Outside City Percent", default=0.0)
	night_charge 	= models.FloatField("Night Charge Percent", default=0.0)

	def __unicode__(self):
		return u"{}".format(self.city.name)

class Offer(models.Model):
	name 			= models.CharField("Name", max_length=255)
	discount_percent= models.FloatField("Discount Percent", default=0.0)
	date	 		= models.DateField("Offer On", unique=True)

	def __unicode__(self):
		return self.name

class TripType(models.Model):
	type 			= models.CharField("Type", max_length=255, unique=True)

	def __unicode__(self):
		return self.type

class CityTrip(models.Model):
	city 			= models.ForeignKey(City)
	trip_type 		= models.ForeignKey(TripType)
	flat_fare	 	= models.FloatField("Flat Fare", default=0.0)

	class Meta:
		unique_together = ("city", "trip_type")

	def __unicode__(self):
		return u"{}--{}".format(self.city.name, self.trip_type.type)

class Car(models.Model):
	model 			= models.CharField("Model", max_length=255, unique=True)
	fare_percent		= models.FloatField("Fare Percent", default=0.0)

	def __unicode__(self):
		return self.model


####################### Clear Cache on Objects Update ###########################

def car_cache_clear(sender, instance, *args, **kwargs):
	cache.delete(CAR_KEY.format(instance.model))
	cache.delete(ALL_CAR)


def city_cache_clear(sender, instance, *args, **kwargs):
	cache.delete(CITY_KEY.format(instance.name))


def trip_type_cache_clear(sender, instance, *args, **kwargs):
	cache.delete(TRIP_KEY.format(instance.type))


def city_trip_cache_clear(sender, instance, *args, **kwargs):
	cache.delete(CITY_TRIP_KEY.format(instance.city, instance.trip_type))

models.signals.pre_save.connect(car_cache_clear, sender=Car)  
models.signals.pre_save.connect(city_cache_clear, sender=City)  
models.signals.pre_save.connect(trip_type_cache_clear, sender=TripType)  
models.signals.pre_save.connect(city_trip_cache_clear, sender=CityTrip) 