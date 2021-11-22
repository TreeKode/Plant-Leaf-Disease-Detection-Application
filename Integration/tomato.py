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
  
  if(pred=="Bacterial Spot"): link="https://www.growingproduce.com/vegetables/tactics-to-tackle-bacterial-spot-of-tomato/"
  elif(pred=="Early Blight"): link="https://gardenerspath.com/how-to/disease-and-pests/early-blight-tomato/"
  elif(pred=="Late Blight"): link="https://www.gardentech.com/blog/pest-id-and-prevention/fight-blight-on-your-tomatoes"
  elif(pred=="Tomato Leaf Mold"): link="https://www.gardeningknowhow.com/edible/vegetables/tomato/managing-tomato-leaf-mold.htm"
  elif(pred=="Septoria Leaf Spot"): link="https://www.thespruce.com/identifying-and-controlling-septoria-leaf-spot-of-tomato-1402974"
  elif(pred=="Spider Mites/Two-Spotted Spider Mite"): link="https://audreyslittlefarm.com/spider-mites-on-tomato-plants/"
  elif(pred=="Tomato Yellow Leaf Curl Virus"): link="https://ipm.ifas.ufl.edu/agricultural_ipm/tylcv_home_mgmt.shtml"
  elif(pred=="Tomato Mosaic Virus"): link="https://www.almanac.com/pest/mosaic-viruses"
  else: link=""
  


