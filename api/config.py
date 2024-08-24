import json
import os
from typing import List

from dotenv import load_dotenv
from pydantic import BaseSettings

load_dotenv(verbose=True)

class Setting(BaseSettings):
    ROOT_DIR = os.path.abspath(os.path.join(
        os.path.dirname(__file__)
    ))

    ENV: str = os.getenv('ENV', '')
