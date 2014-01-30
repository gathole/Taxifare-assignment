from tastypie.api import Api
from api.taxiresource import CityResource, FareResource

v1_api = Api(api_name='v1')
v1_api.register(CityResource())
v1_api.register(FareResource())
