import paddlehub as hub
import cv2
from pyefun import *

model = hub.Module(name="animegan_v2_hayao_99")

with 计时器() as t:
    result = model.style_transfer(images=[cv2.imread('test.png')])
    cv2.imwrite('./result.png', result[0])
    print(t.取总耗时())
