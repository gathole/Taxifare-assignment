# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'CityTrip'
        db.create_table('taxi_citytrip', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('city', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['taxi.City'])),
            ('trip_type', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['taxi.TripType'])),
            ('flat_fare', self.gf('django.db.models.fields.FloatField')(default=0.0)),
        ))
        db.send_create_signal('taxi', ['CityTrip'])

        # Deleting field 'TripType.flat_fare'
        db.delete_column('taxi_triptype', 'flat_fare')


    def backwards(self, orm):
        # Deleting model 'CityTrip'
        db.delete_table('taxi_citytrip')

        # Adding field 'TripType.flat_fare'
        db.add_column('taxi_triptype', 'flat_fare',
                      self.gf('django.db.models.fields.FloatField')(default=0.0),
                      keep_default=False)


    models = {
        'taxi.car': {
            'Meta': {'object_name': 'Car'},
            'fare_pe': ('django.db.models.fields.FloatField', [], {'default': '0.0'}),
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
            'Meta': {'object_name': 'CityTrip'},
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
            'date': ('django.db.models.fields.DateField', [], {}),
            'discount_per': ('django.db.models.fields.FloatField', [], {'default': '0.0'}),
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