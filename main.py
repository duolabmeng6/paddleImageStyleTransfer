import paddlehub as hub
import cv2
from pyefun import *

model = hub.Module(name="pyramidbox_lite_mobile")

with 计时器() as t:
    result = model.style_transfer(images=[cv2.imread('5.jpg')])
    cv2.imwrite('./55.jpeg', result[0])
    print(t.取总耗时())
