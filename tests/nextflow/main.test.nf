#!/usr/bin/env nextflow

include {minimap_ont} from '../../nextflow/modules.nf'

workflow {
    input_directory = params.input_directory
    output_directory = params.output_directory
    genome_fasta = file(params.genome_fasta)
    threads = params.threads
    memory = params.memory

    samples = Channel
        .from(params.samples)
        .map { sample -> 
            tuple(sample.id, file(sample.reads), genome_fasta)
        }

    minimap_ont(samples)
}
