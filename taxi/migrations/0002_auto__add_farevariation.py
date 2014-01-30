# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'FareVariation'
        db.create_table('taxi_farevariation', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('city', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['taxi.City'], unique=True)),
            ('outside_city', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('night_charge', self.gf('django.db.models.fields.FloatField')(default=0.0)),
        ))
        db.send_create_signal('taxi', ['FareVariation'])


    def backwards(self, orm):
        # Deleting model 'FareVariation'
        db.delete_table('taxi_farevariation')


    models = {
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
            'outside_city': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        }
    }

    complete_apps = ['taxi']