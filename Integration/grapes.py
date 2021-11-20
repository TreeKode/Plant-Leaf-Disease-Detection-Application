import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import os
import keras
from keras.preprocessing.image import ImageDataGenerator, img_to_array, load_img 
from keras.applications.vgg19 import VGG19, preprocess_input, decode_predictions
from keras.layers import Dense, Flatten
from keras.models import Model
from keras.applications.vgg19 import VGG19
from keras.models import Model, load_model

ref = {0: 'Black Rot', 1: 'Grape Esca (Black Measles)', 2: 'Grape Leaf blight (Isariopsis Leaf Spot)', 3: 'Healthy Grape'}
model = load_model("./Backend/New Model/grapes_97.h5") 
path = ""
def predict(path):
  img = load_img(path, target_size = (256,256))
  i = img_to_array(img)
  im = preprocess_input(i)
  img = np.expand_dims(im , axis= 0)
  pred = np.argmax(model.predict(img))
  return(f"{ ref[pred] } ")