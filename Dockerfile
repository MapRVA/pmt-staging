# Start from GDAL image for GDAL and python
FROM ghcr.io/osgeo/gdal:ubuntu-small-latest

# Add npm to install Allmaps CLI
RUN apt update && apt install -y nodejs npm curl \
  && npm install -g @allmaps/cli

# Add uv and rio-pmtiles
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv
ENV PATH=/root/.local/bin:$PATH

WORKDIR /allmaps
RUN uv init .

COPY allmaps2pmtiles.sh .
RUN chmod +x allmaps2pmtiles.sh

ENTRYPOINT [ "./allmaps2pmtiles.sh" ]