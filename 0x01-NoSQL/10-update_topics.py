#!/usr/bin/env python3
""" A Module defining a function that update topics."""


def update_topics(mongo_collection, name, topics):
    """
    Python function that changes all topics of a school document
    based on the name.
    """
    mongo_collection.update_one({"name": name}, {"$set": {"topics": topics}})
