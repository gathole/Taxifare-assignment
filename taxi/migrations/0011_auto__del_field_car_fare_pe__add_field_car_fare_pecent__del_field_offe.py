# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting field 'Car.fare_pe'
        db.delete_column('taxi_car', 'fare_pe')

        # Adding field 'Car.fare_pecent'
        db.add_column('taxi_car', 'fare_pecent',
                      self.gf('django.db.models.fields.FloatField')(default=0.0),
                      keep_default=False)

        # Deleting field 'Offer.discount_per'
        db.delete_column('taxi_offer', 'discount_per')

        # Adding field 'Offer.discount_percent'
        db.add_column('taxi_offer', 'discount_percent',
                      self.gf('django.db.models.fields.FloatField')(default=0.0),
                      keep_default=False)


    def backwards(self, orm):
        # Adding field 'Car.fare_pe'
        db.add_column('taxi_car', 'fare_pe',
                      self.gf('django.db.models.fields.FloatField')(default=0.0),
                      keep_default=False)

        # Deleting field 'Car.fare_pecent'
        db.delete_column('taxi_car', 'fare_pecent')

        # Adding field 'Offer.discount_per'
        db.add_column('taxi_offer', 'discount_per',
                      self.gf('django.db.models.fields.FloatField')(default=0.0),
                      keep_default=False)

        # Deleting field 'Offer.discount_percent'
        db.delete_column('taxi_offer', 'discount_percent')


    models = {
        'taxi.car': {
            'Meta': {'object_name': 'Car'},
            'fare_pecent': ('django.db.models.fields.FloatField', [], {'default': '0.0'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '255'})
        },
        'taxi.city': {
            'Meta': {'object_name': 'City'},
            'base_fare': ('django.db.models.fields.FloatField', [], {'default': '0.0'}),
            'base_km': ('django.db.models.fields.FloatField', [], {'default': '0.0'}),
            'extra_km_fare': ('django.db.models.fields.FloatField', [], {'default': '0.0'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '255'})
        },
        'taxi.citytrip': {
            'Meta': {'unique_together': "(('city', 'trip_type'),)", 'object_name': 'CityTrip'},
            'city': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['taxi.City']"}),
            'flat_fare': ('django.db.models.fields.FloatField', [], {'default': '0.0'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'trip_type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['taxi.TripType']"})
        },
        'taxi.farevariation': {
            'Meta': {'object_name': 'FareVariation'},
            'city': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['taxi.City']", 'unique': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'night_charge': ('django.db.models.fields.FloatField', [], {'default': '0.0'}),
            'outside_city': ('django.db.models.fields.FloatField', [], {'default': '0.0'})
        },
        'taxi.offer': {
            'Meta': {'object_name': 'Offer'},
            'date': ('django.db.models.fields.DateField', [], {'unique': 'True'}),
            'discount_percent': ('django.db.models.fields.FloatField', [], {'default': '0.0'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        'taxi.triptype': {
            'Meta': {'object_name': 'TripType'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'type': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '255'})
        }
    }

    complete_apps = ['taxi']