#  read config file


import configparser
import os


CONFIG_FILE_DEFAULT = os.path.join(os.path.abspath(os.path.dirname(__file__)),
                                   'config.cfg')


def read_config(CONFIG_FILE=CONFIG_FILE_DEFAULT):
    """
    Read config file and return dictionary
    """

    CFG = {}

    CP = configparser.ConfigParser()
    CP.optionxform = str
    CP.read(CONFIG_FILE)
    for each_section in CP.sections():
        CFG[each_section] = {}

        for (each_key, each_val) in CP.items(each_section):
            CFG[each_section][each_key] = each_val

    return CFG
