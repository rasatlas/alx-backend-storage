#!/usr/bin/env python3
""" Python module containing a function that inserts a new document """


def insert_school(mongo_collection, **kwargs):
    """
    Function that inserts a new document in a collection based on kwargs.
    """
    # Insert the new document into the collection with provided kwargs
    new_document = mongo_collection.insert_one(kwargs)
    # Return the new _id
    return new_document.inserted_id
