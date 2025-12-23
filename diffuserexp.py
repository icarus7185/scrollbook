import torch
from diffusers import DiffusionPipeline

from huggingface_hub import login
import os

# Option 1: Directly provide the token (use with caution, especially in public notebooks)
login(token="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")

# switch to "mps" for apple devices
pipe = DiffusionPipeline.from_pretrained("stabilityai/stable-diffusion-3.5-medium", cache_dir="/workspace/my_models/cache", torch_dtype=torch.bfloat16, device_map="cuda")

prompt = "Astronaut in a jungle, cold color palette, muted colors, detailed, 8k"
image = pipe(prompt).images[0]
image.save("output1.png")