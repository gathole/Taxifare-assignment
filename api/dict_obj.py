class DictObject(object):
    def __init__(self, initial=None):
        self.__dict__['_data'] = {}

        if hasattr(initial, 'items'):
            self.__dict__['_data'] = initial

    def __getattr__(self, name):
        if '_data' in self.__dict__ and name in self._data:
            return self._data.get(name, None)
        else:
            raise AttributeError

    def __setattr__(self, name, value):
        self.__dict__['_data'][name] = value

    def to_dict(self):
        return self._data

    def __getstate__(self):
        return self.__dict__['_data']


    def __setstate__(self, state):
        self.__dict__['_data'] = state
