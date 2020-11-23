from libvis.modules import BaseModule
import json
from .utils import random_quote

class data_access_wrapper(BaseModule):
    name="data_access_wrapper"
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.quote = random_quote()

    def vis_get(self, key):
        #value = super().vis_get(key) # makes {value:preprocess(value), type:self.name}
        value = self[key]
        print('sending value to front: ', key, value)
        return value

    def vis_set(self, key, value):
        super().vis_set(key, value) # same as self[key] = value
        print('updated value form front: ', key, value)

    @classmethod
    def test_object(cls):
        return cls()
