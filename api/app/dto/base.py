from typing import Optional, List, Union, Dict

from pydantic import BaseModel

from api.app.helper.utility import convert_str_to_camel, convert_str_to_pascal, convert_str_to_snake


class CamelBaseModel(BaseModel):
    class Config:
        alias_generator = convert_str_to_camel
        populate_by_name = True
        
        
class PascalBaseModel(BaseModel):
    class Config:
        alias_generator = convert_str_to_pascal
        populate_by_name = True


class OpenApiResponseModel:
    http_code: str
    description: str
    code: str
    message: str
    data: Optional[dict]

    def __init__(self, http_code: str, description: str, code: str, message: str,
                 data: Optional[Union[dict, List]] = None):
        self.http_code = http_code
        self.description = description
        self.code = code
        self.message = message
        self.data = data


class UpdateModel(CamelBaseModel):
    _included_fields: Optional[Dict] = dict()

    def __init__(self, **kwargs):
        included_fields = dict()
        for key in kwargs:
            included_fields.__setitem__(convert_str_to_snake(key), ...)

        super().__init__(**kwargs)
        object.__setattr__(self, '_included_fields', included_fields)

    @property
    def included_fields(self):
        return self._included_fields

    def dict(self, exclude_unset: Optional[bool] = True, **kwargs):
        if exclude_unset:
            temp_dict = self._included_fields.copy()
            if 'include' in kwargs:
                for k in self._included_fields.keys():
                    if k not in kwargs.get('include').keys():
                        temp_dict.pop(k)

                kwargs.pop('include')

            return super().dict(include=temp_dict, **kwargs)

        return super().dict(**kwargs)
