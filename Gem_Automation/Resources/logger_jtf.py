import logging
from logging.handlers import RotatingFileHandler
from datetime import datetime
import os
import logging.config

# Get current timestamp to include in the log file name
timestamp = datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
log_dir = "logs"
if not os.path.exists(log_dir):
    os.makedirs(log_dir)

# Log file path with timestamp
log_file = os.path.join(log_dir, f'logfile_{timestamp}.log')
# Define the logger configuration
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'default': {
            'format': '%(asctime)s - %(name)s - %(levelname)s - %(message)s',
            'datefmt': '%Y-%m-%d %H:%M:%S',
        },
    },
    'handlers': {
        'rotatingFileHandler': {
            'level': 'DEBUG',
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': log_file,
            'maxBytes': 1024 * 1024,  # 1MB
            'backupCount': 5,
            'formatter': 'default',
        },
    },
    'loggers': {
        'JTFAuto6': {
            'level': 'DEBUG',
            'handlers': ['rotatingFileHandler'],
            'propagate': False,
        },
        'ExecuteCommand': {
            'level': 'DEBUG',
            'handlers': ['rotatingFileHandler'],
            'propagate': False,
        },
        'copyFile': {
            'level': 'DEBUG',
            'handlers': ['rotatingFileHandler'],
            'propagate': False,
        },
        'Json_utils_with_logging': {
            'level': 'DEBUG',
            'handlers': ['rotatingFileHandler'],
            'propagate': False,
        },
        'ModifyFolders': {
            'level': 'DEBUG',
            'handlers': ['rotatingFileHandler'],
            'propagate': False,
        },

    },
}

# Apply logging configuration
logging.config.dictConfig(LOGGING)

