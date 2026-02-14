#!/bin/bash
# Download images using Allmaps CLI. Might need dezoomify-rs.
#  Consult documentation at https://github.com/allmaps/allmaps/tree/main/apps/cli
curl "$1" | \
  allmaps annotation image-ids | \
  allmaps fetch full-image

# Convert image to GeoTiff using Allmaps CLI
curl "$1" | \
  allmaps script geotiff | \
  bash

url=$1
img_id=${url##*/}
img_name=$(ls | grep .*${url##*/}.*-warped)

out_name="$2.pmtiles"

# Convert GeoTiff to pmtiles using rio-pmtiles
uv run rio pmtiles --rgba ${img_name} ${out_name}

# rename to *.gz to play nicely with GH Pages
mv ${out_name} "${out_name}.gz"