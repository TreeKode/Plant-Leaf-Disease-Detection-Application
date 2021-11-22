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

ref = {0: 'Bacterial Spot', 1: 'Early Blight', 2: 'Late Blight', 3: 'Tomato Leaf Mold', 4: 'Septoria Leaf Spot', 5: 'Spider Mites/Two-Spotted Spider Mite', 6: 'Target Spot', 7: 'Tomato Yellow Leaf Curl Virus', 8: 'Tomato Mosaic Virus', 9: 'Healthy Tomato'}

model = load_model("./Backend/New Model/Tameto_78.h5") 
path = ""
link=""
def predict(path):
  img = load_img(path, target_size = (256,256))
  i = img_to_array(img)
  im = preprocess_input(i)
  img = np.expand_dims(im , axis= 0)
  pred = np.argmax(model.predict(img))
  return(f"{ ref[pred] } ")

def links(predic):
  remediiiii=" hemlo"
  print(predic)
  if(predic=='Bacterial Spot'): remediiiii="https://www.growingproduce.com/vegetables/tactics-to-tackle-bacterial-spot-of-tomato/"
  if(predic=='Early Blight'):
    remediiiii="https://gardenerspath.com/how-to/disease-and-pests/early-blight-tomato/"
  elif(predic=="Late Blight"): remediiiii="https://www.gardentech.com/blog/pest-id-and-prevention/fight-blight-on-your-tomatoes"
  elif(predic=="Tomato Leaf Mold"): remediiiii="https://www.gardeningknowhow.com/edible/vegetables/tomato/managing-tomato-leaf-mold.htm"
  elif(predic=="Septoria Leaf Spot"): remediiiii="https://www.thespruce.com/identifying-and-controlling-septoria-leaf-spot-of-tomato-1402974"
  elif(predic=="Spider Mites/Two-Spotted Spider Mite"): remediiiii="https://audreyslittlefarm.com/spider-mites-on-tomato-plants/"
  elif(predic=="Tomato Yellow Leaf Curl Virus"): remediiiii="https://ipm.ifas.ufl.edu/agricultural_ipm/tylcv_home_mgmt.shtml"
  elif(predic=="Tomato Mosaic Virus"): remediiiii="https://www.almanac.com/pest/mosaic-viruses"
  return (remediiiii)
  


