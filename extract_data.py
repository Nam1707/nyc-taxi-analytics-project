import io
import pandas as pd
import requests
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(*args, **kwargs):
    """
    Template for loading data from API
    """
    url = 'https://storage.googleapis.com/taxi-data-engineering-project-nam/taxi_tripdata_2023-03.csv'
    response = requests.get(url)

    return pd.read_csv(io.StringIO(response.text), dtype={'store_and_fwd_flag' : object}, sep=',')

@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'