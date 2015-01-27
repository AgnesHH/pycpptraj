from __future__ import absolute_import
from .. import io as mdio

def load_sample_data():
    """
    Return FrameArray instance for Ala3 data
    """
    return mdio.load("./Ala3/Ala3.crd", "./Ala3/Ala3.top")
