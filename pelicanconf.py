#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals
import os

AUTHOR = 'Aimz VDR'
SITENAME = 'Adventures in sportsball data'
SITEURL = ''

LOAD_CONTENT_CACHE = False

PATH = 'content'

TIMEZONE = 'Australia/Sydney'

DEFAULT_LANG = 'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# Blogroll
LINKS = (('Pelican', 'http://getpelican.com/'),
         ('Python.org', 'http://python.org/'),
         ('Jinja2', 'http://jinja.pocoo.org/'),
         ('You can modify those links in your config file', '#'),)

# Social widget
SOCIAL = (('You can add links in your config file', '#'),
          ('Another social link', '#'),)

DEFAULT_PAGINATION = False

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True

MARKUP = ('md', 'ipynb')

PLUGIN_PATH = ['./plugins', 'pelican-plugins']
PLUGINS = ['ipynb.markup', 'liquid_tags.img', 'liquid_tags.video',
           'liquid_tags.youtube', 'liquid_tags.include_code',
           'liquid_tags.notebook']

EXTRA_HEADER = open('_nb_header.html').read()

