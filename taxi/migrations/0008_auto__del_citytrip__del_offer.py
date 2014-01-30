# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting model 'CityTrip'
        db.delete_table('taxi_citytrip')

        # Deleting model 'Offer'
        db.delete_table('taxi_offer')


    def backwards(self, orm):
        # Adding model 'CityTrip'
        db.create_table('taxi_citytrip', (
            ('city', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['taxi.City'])),
            ('trip_type', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['taxi.TripType'])),
            ('flat_fare', self.gf('django.db.models.fields.FloatField')(default=0.0)),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
        ))
        db.send_create_signal('taxi', ['CityTrip'])

        # Adding model 'Offer'
        db.create_table('taxi_offer', (
            ('date', self.gf('django.db.models.fields.DateField')()),
            ('discount_per', self.gf('django.db.models.fields.FloatField')(default=0.0)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
        ))
        db.send_create_signal('taxi', ['Offer'])


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
        'taxi.farevariation': {
            'Meta': {'object_name': 'FareVariation'},
            'city': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['taxi.City']", 'unique': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'night_charge': ('django.db.models.fields.FloatField', [], {'default': '0.0'}),
            'outside_city': ('django.db.models.fields.FloatField', [], {'default': '0.0'})
        },
        'taxi.triptype': {
            'Meta': {'object_name': 'TripType'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'type': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '255'})
        }
    }

    complete_apps = ['taxi']