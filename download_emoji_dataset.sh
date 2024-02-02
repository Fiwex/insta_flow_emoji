#!/bin/bash

# Define the dataset path
DATASET_DIR="dataset"

# Check if the dataset directory exists
if [ ! -d "$DATASET_DIR" ]; then
    echo "Dataset directory does not exist, creating now..."
    mkdir -p "$DATASET_DIR"
    echo "Directory structure created."
else
    echo "Dataset directory already exists."
fi

# Navigate to the dataset directory
cd "$DATASET_DIR" || exit

# Download dataset using Kaggle API
# Ensure you have accepted competition rules on Kaggle website for this dataset
echo "Downloading dataset..."
kaggle datasets download shonenkov/russian-emoji --unzip

echo "Dataset download complete."

# Return to the original directory
cd ..
