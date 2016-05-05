# thumbnailStream.cmd
# This script creates, configures, and loads db records for one
# monochrome thumbnail viewer w/ 4x4 binning and 1hz rate

# Configure the plugins
NDStdArraysConfigure(    "THUMBNAIL",     $(QSIZE), 0, "$(CAM_PORT)", 0, -1 )
NDColorConvertConfigure( "THUMBNAIL:CC",  $(QSIZE), 0, "$(CAM_PORT)", 0 )
NDROIConfigure(          "THUMBNAIL:ROI", $(QSIZE), 0, "$(CAM_PORT)", 0 )
NDOverlayConfigure(      "THUMBNAIL:Over", 16,      0, "$(CAM_PORT)", 0, 8 )

# Load the image stream records
dbLoadRecords( "db/thumbnailStream.db",  "CAM=$(CAM_PV),CAM_PORT=$(CAM_PORT),PLUGIN_SRC=$(PLUGIN_SRC),IMAGE_NAME=THUMBNAIL,IMAGE_NELM=$(IMAGE_NELM)" )
