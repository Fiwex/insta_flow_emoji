#!/bin/bash

# Define directory
DIR_NAME="stable_diffusion_files"

# URLs for the files
INFERENCE_WEIGHTS_URL="https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt?download=true"
FINETUNING_WEIGHTS_URL="https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.ckpt?download=true"
MERGES_URL="https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/tokenizer/merges.txt?download=true"
VOCAB_URL="https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/tokenizer/vocab.json?download=true"

# Check if the directory exists, if not create it
if [ ! -d "$DIR_NAME" ]; then
    echo "Directory $DIR_NAME does not exist. Creating it now..."
    mkdir -p "$DIR_NAME"
fi

# Function to download tokenizer files
download_tokenizer() {
    echo "Downloading tokenizer files..."
    curl -L -o "$DIR_NAME/merges.txt" "$MERGES_URL"
    curl -L -o "$DIR_NAME/vocab.json" "$VOCAB_URL"
}

# Flags to control download
download_inference=false
download_finetuning=false

# Process arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -inference|-i)
            download_inference=true
            shift # move to next argument
            ;;
        -finetuning|-f)
            download_finetuning=true
            shift # move to next argument
            ;;
        *)
            echo "Invalid argument: $1"
            echo "Use -inference/-i for inference weights, -finetuning/-f for finetuning weights."
            exit 1
            ;;
    esac
done

# Download based on flags
if $download_inference; then
    echo "Downloading inference weights..."
    curl -L -o "$DIR_NAME/v1-5-pruned-emaonly.ckpt" "$INFERENCE_WEIGHTS_URL"
fi

if $download_finetuning; then
    echo "Downloading finetuning weights..."
    curl -L -o "$DIR_NAME/v1-5-pruned.ckpt" "$FINETUNING_WEIGHTS_URL"
fi

# Always download tokenizer files if any weights are to be downloaded
if $download_inference || $download_finetuning; then
    download_tokenizer
fi

echo "Download complete."
