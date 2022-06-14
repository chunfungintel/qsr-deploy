#!/bin/bash

helm lint qsr
helm package qsr
git add qsr-0.1.0.tgz

