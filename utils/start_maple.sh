#!/bin/bash
cd $HOME/.maple/
rm -rf data idmlight.db.mv.db  instances journal lock snapshots
./bin/karaf clean

