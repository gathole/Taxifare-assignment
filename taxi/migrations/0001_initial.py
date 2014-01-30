# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'City'
        db.create_table('taxi_city', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=255)),
            ('base_fare', self.gf('django.db.models.fields.FloatField')(default=0.0)),
            ('base_km', self.gf('django.db.models.fields.FloatField')(default=0.0)),
            ('extra_km_fare', self.gf('django.db.models.fields.FloatField')(default=0.0)),
        ))
        db.send_create_signal('taxi', ['City'])


    def backwards(self, orm):
        # Deleting model 'City'
        db.delete_table('taxi_city')


    models = {
        'taxi.city': {
            'Meta': {'object_name': 'City'},
            'base_fare': ('django.db.models.fields.FloatField', [], {'default': '0.0'}),
            'base_km': ('django.db.models.fields.FloatField', [], {'default': '0.0'}),
            'extra_km_fare': ('django.db.models.fields.FloatField', [], {'default': '0.0'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '255'})
        }
    }

    complete_apps = ['taxi']