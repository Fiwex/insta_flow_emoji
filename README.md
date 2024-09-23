# InstaFlow_Emoji

Respecialization of an InstaFlow-like diffusion model on the Russian Emojis dataset.

## Overview

This project focuses on re-specializing an InstaFlow-like diffusion model to generate Russian emojis. We began with the base model from InstaFlow ([XCLiu/InstaFlow](https://huggingface.co/spaces/XCLiu/InstaFlow)) and fine-tuned it using the [Russian Emojis dataset](https://www.kaggle.com/datasets/shonenkov/russian-emoji).

Throughout this project, we encountered significant challenges and made important findings regarding the base model's exploitability and implementation. Our conclusions shed light on the limitations of the existing InstaFlow model and emphasize the importance of proper library usage in deep learning projects.

---

## Table of Contents

- [Environment Setup](#environment-setup)
- [Base Model: Stable Diffusion](#base-model-stable-diffusion)
- [InstaFlow Model Adjustments](#instaflow-model-adjustments)
- [Dataset](#dataset)
- [Findings and Conclusions](#findings-and-conclusions)
- [Documentation and Resources](#documentation-and-resources)
- [Acknowledgments](#acknowledgments)
- [Contact](#contact)

---

## Environment Setup

- **Python Version**: 3.11

- **Installation of Requirements**:

  Install the necessary Python packages using:

  ```bash
  pip install -r requirements.txt
  ```

---

## Base Model: Stable Diffusion

![Stable Diffusion](readme_images/stable_diffusion.png)

We utilized the Stable Diffusion v1.5 model as our base for this project.

- **Model Repository**: [runwayml/stable-diffusion-v1-5](https://huggingface.co/runwayml/stable-diffusion-v1-5)

### Downloading Model Weights

- **Inference Weights**:

  - File: `v1-5-pruned-emaonly.ckpt` (4.27 GB)
  - Download Link: [Inference Weights](https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt?download=true)

- **Fine-tuning Weights**:

  - File: `v1-5-pruned.ckpt` (7.7 GB)
  - Download Link: [Fine-tuning Weights](https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.ckpt?download=true)

### Tokenizer Files

- **Merges File**:

  - File: `merges.txt`
  - Download Link: [merges.txt](https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/tokenizer/merges.txt?download=true)

- **Vocabulary File**:

  - File: `vocab.json`
  - Download Link: [vocab.json](https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/tokenizer/vocab.json?download=true)

**Note**: All downloaded files should be placed in the `stable_diffusion_files` directory.

### Automated Download Script

You can automate the download process by running the `download_stable_diffusion_files.sh` script:

```bash
./download_stable_diffusion_files.sh
```

Use the following flags:

- `-i`: Download inference weights.
- `-f`: Download fine-tuning weights.

For example, to download both inference and fine-tuning weights:

```bash
./download_stable_diffusion_files.sh -i -f
```

---

## InstaFlow Model Adjustments

In our attempt to fine-tune the InstaFlow model on the Russian Emojis dataset, we encountered several critical issues:

- **Cherry-Picked Examples**: The examples provided in the original [XCLiu/instaflow_0_9B_from_sd_1_5](https://huggingface.co/XCLiu/instaflow_0_9B_from_sd_1_5) model appeared to be cherry-picked. We found the base model to be hardly exploitable, producing inconsistent and often low-quality outputs.

- **Fine-Tuning Flaws**: Our fine-tuning efforts revealed inherent flaws in the base model that we couldn't rectify, despite extensive experimentation and adjustments.

- **Implementation Issues with Transformers Library**: The original InstaFlow implementation made inefficient and incorrect use of the Hugging Face Transformers library. This led to compatibility problems and hindered our progress significantly.

### Our Contributions

- **Re-implementation of Critical Components**: Due to the issues mentioned, we re-implemented several parts of the codebase. Our focus was on correctly utilizing the Transformers library to ensure compatibility and improve performance.

- **Code Efficiency Improvements**: By adhering to best practices and proper library usage, we enhanced the code efficiency and maintainability.

- **Detailed Analysis**: We conducted a comprehensive analysis of the model's performance and documented the limitations and challenges encountered.

---

## Dataset

We used the **Russian Emojis** dataset for training and evaluation.

- **Dataset Source**: [Kaggle - Russian Emoji Dataset](https://www.kaggle.com/datasets/shonenkov/russian-emoji)

### Dataset Structure

Ensure that the dataset maintains the following directory structure:

```
dataset/
├── images/
├── rgba_train/
├── rgba_valid/
└── marking.csv
```

### Downloading the Dataset

If you have the Kaggle API installed and configured, you can download the dataset by running:

```bash
./download_emoji_dataset.sh
```

This script automates the process of downloading and setting up the dataset in the required structure.

---

## Findings and Conclusions

Our work led to several important conclusions:

1. **Infeasibility of Base InstaFlow Model**: The base InstaFlow model (`XCLiu/instaflow_0_9B_from_sd_1_5`) is not readily exploitable for practical applications. The performance demonstrated in the provided examples was not reproducible in our experiments.

2. **Limitations in Fine-Tuning**: Fine-tuning the model on the Russian Emojis dataset did not yield satisfactory results. The inherent flaws in the base model significantly limited improvements, and issues persisted even after extensive tuning.

3. **Misuse of Transformers Library**: The original implementation improperly utilized the Hugging Face Transformers library, leading to compatibility issues and suboptimal performance. This necessitated re-implementation of several components.

4. **Importance of Proper Library Usage**: Our experience highlights the critical importance of correctly using established libraries and frameworks. Proper implementation ensures better performance, easier maintenance, and broader compatibility.

---

## Documentation and Resources

### InstaFlow

- **Research Paper**: [InstaFlow: Instance Generation with Normalizing Flow](https://arxiv.org/abs/2309.06380)

- **Original GitHub Repository**: [gnobitab/InstaFlow](https://github.com/gnobitab/InstaFlow)

### RectifiedFlow

- **GitHub Repository**: [gnobitab/RectifiedFlow](https://github.com/gnobitab/RectifiedFlow)

### Stable Diffusion

- **GitHub Repository**: [CompVis/stable-diffusion](https://github.com/CompVis/stable-diffusion)

- **Building Stable Diffusion from Scratch**: [YouTube Tutorial](https://www.youtube.com/watch?v=ZBKpAp_6TGI)

### Similar Models

- **Emoji Diffusion Model**: [valhalla/emoji-diffusion](https://huggingface.co/valhalla/emoji-diffusion)

