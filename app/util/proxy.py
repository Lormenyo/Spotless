

from urllib.parse import urlencode
from decouple import config


def get_scrapeops_url(url):
    payload = {'api_key': config('proxyAPIKey'), 'url': url}
    proxy_url = 'https://proxy.scrapeops.io/v1/?' + urlencode(payload)
    return proxy_url