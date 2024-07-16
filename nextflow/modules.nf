process minimap_ont {

    publishDir "${params.output_directory}/$sample_id", mode : "copy"


    container 'ghcr.io/bwbioinfo/minimap2-docker-cwl:latest'

    input:
    tuple val(sample_id), file(reads), file(reference)

    output:
    path '*.sam', emit: output_file
    
    script:
    """
    minimap2 -ax map-ont $reference $reads > ${sample_id}-${reference}.sam
    """
}
