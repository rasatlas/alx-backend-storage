#!/usr/bin/env python3
"""A Python module that lists all documents in a collection."""


def list_all(mongo_collection):
    """A function that lists all documents in a collection."""
    document_list = mongo_collection.find()
    return list(document_list)
