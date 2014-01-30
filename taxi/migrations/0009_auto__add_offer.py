# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Offer'
        db.create_table('taxi_offer', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('discount_per', self.gf('django.db.models.fields.FloatField')(default=0.0)),
            ('date', self.gf('django.db.models.fields.DateField')(unique=True)),
        ))
        db.send_create_signal('taxi', ['Offer'])


    def backwards(self, orm):
        # Deleting model 'Offer'
        db.delete_table('taxi_offer')


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
        'taxi.offer': {
            'Meta': {'object_name': 'Offer'},
            'date': ('django.db.models.fields.DateField', [], {'unique': 'True'}),
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