# backend/main.py

from fastapi import FastAPI, UploadFile, File
from transformers import pipeline

app = FastAPI()
pipe = pipeline("image-to-text", model="Salesforce/blip-image-captioning-base")

@app.get("/")
def home():
    return {"message": "AI Edge Gallery Backend Simulated"}

@app.post("/ask-image/")
async def ask_image(file: UploadFile = File(...)):
    contents = await file.read()
    result = pipe(contents)
    return {"caption": result[0]['generated_text']}
