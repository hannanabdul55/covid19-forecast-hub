import os
import glob
import pandas as pd
from pathlib import Path
import yaml

def get_root():
    root_path = Path(os.path.dirname(__file__)) / '..' / '..'
    return root_path.resolve()

def get_data():
    root = get_root()
    return root/ 'data-processed'

def get_forecasts():
    root = get_root()
    forecasts = root.glob('data-processed/**/*.csv')
    return forecasts

def get_models():
    root = get_root()
    models = [f.name for f in (root / 'data-processed').iterdir()]
    return models

def get_metadata(model=None):
    data = get_data()
    if model is not None:
        pass