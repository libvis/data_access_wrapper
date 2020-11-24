from libvis.modules import BaseModule
from libvis import VisVars
from libvis import interface as ifc
import legimens
import json
from .utils import random_quote

class data_access_wrapper(BaseModule):
    name="data_access_wrapper"
    def __init__(self, body, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.body = body

    def vis_get(self, key):
        value = super().vis_get(key)
        sanitized_value = ifc.serialize_to_vis(value)
        return sanitized_value

    def vis_set(self, key, value):
        self.child.vis_set(key, value) # same as self[key] = value
        print('updated value form front: ', key, value)

    @classmethod
    def test_object(cls):
        class TestObject(VisVars):
            pass
        test_data = [
            [3, 12, 13, 15, 17],
            [23, 24, 34, 30, 37]
        ]
        val = cls(body=test_data)
        return val

