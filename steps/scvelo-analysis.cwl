cwlVersion: v1.0
class: CommandLineTool
label: RNA velocity analysis via scVelo
hints:
  DockerRequirement:
    dockerPull: "hubmap/scrna-analysis:latest"
  InitialWorkDirRequirement:
    listing: [$(inputs.spliced_h5ad_file)]
  EnvVarRequirement:
    envDef:
      TMPDIR: "/tmp"
baseCommand: /opt/scvelo_analysis.py

inputs:
  spliced_h5ad_file:
    type: File
    inputBinding: { position: 2, valueFrom: $(self.basename) }
outputs:
  annotated_h5ad_file:
    type: File
    outputBinding:
      glob: scvelo_annotated.h5ad
  annotated_zarr_dir:
    type: Directory
    outputBinding:
      glob: scvelo_annotated.zarr
  embedding_grid_plot:
    type: File
    outputBinding:
      glob: scvelo_embedding_grid.pdf
  embedding_stream_plot:
    type: File?
    outputBinding:
      glob: scvelo_embedding_stream.pdf
