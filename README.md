# pmt-staging

This repository uses the `workflow_dispatch` event to trigger a download and build of a Allmaps georeferenced map. The intent is to use this as a staging area for addition of maps to the [MapRVA Yesterdays project](https://github.com/MapRVA/yesterdays).

Arguments are:

 - Allmaps georeference annotation
   - The Allmaps georeference annotation url. This can be found in the Allmaps Editor and takes the form "https://annotations.allmaps.org/images/{alphanumeric hash}" for a single image or "https://annotations.allmaps.org/map/{alphanumeric hash}" for a (possibly) multi-image map.
 - Output name
   - The desired name of the output PMTiles, without extension. If the provided name is "XYX", the file will be called "XYZ.pmtiles.gz". This is still a ".pmtiles" file -- adding ".gz" is [a workaround for a known bug with Firefox and GitHub Pages](https://github.com/protomaps/PMTiles/issues/584#issuecomment-3149278659). Feel free to remove ".gz" after downloading the file.


The resulting PMTiles will be located at http://maprva.github.io/pmt-staging/{output name}.pmtiles.gz
