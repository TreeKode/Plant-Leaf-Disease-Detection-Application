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

ref = {0: 'Tomato___Bacterial_spot', 1: 'Tomato___Early_blight', 2: 'Tomato___Late_blight', 3: 'Tomato___Leaf_Mold', 4: 'Tomato___Septoria_leaf_spot', 5: 'Tomato___Spider_mites Two-spotted_spider_mite', 6: 'Tomato___Target_Spot', 7: 'Tomato___Tomato_Yellow_Leaf_Curl_Virus', 8: 'Tomato___Tomato_mosaic_virus', 9: 'Tomato___healthy'}

model = load_model("Y:/Uni/Projects/Plant Leaf Disease Detection/Plant-Leaf-Disease-Detection-Application/Backend/New Model/Tameto_78.h5") 
path = "Y:/Uni/Projects/Plant Leaf Disease Detection/Plant-Leaf-Disease-Detection-Application/Integration/tomato-leaf-mold-400x300.jpg"
def prediction(path):
  img = load_img(path, target_size = (256,256))
  i = img_to_array(img)
  im = preprocess_input(i)
  img = np.expand_dims(im , axis= 0)
  pred = np.argmax(model.predict(img))
  print(f" the image belongs to { ref[pred] } ")
  print(model.predict(img))


prediction(path)