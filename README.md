# Docker image for using [Improved Trajectory](http://lear.inrialpes.fr/~wang/improved_trajectories) by [densetrack](https://github.com/FXPAL/densetrack)

This docker image is for using [densetrack](https://github.com/FXPAL/densetrack) with Python 3.9 and OpenCV 3.4 .
With this image, **densetrack** is ready to use.

``` python
import numpy as np
import densetrack

# You need to install Pillow if you want to open images by PIL
# >> pip install Pillow
from PIL import Image

TRACKS_RET_FIELDS = ['frame_num', 'mean_x', 'mean_y', 'var_x', 'var_y', 'length',
            'scale', 'x_pos', 'y_pos', 't_pos', 'coords', 'trajectory',
            'hog', 'hof', 'mbh_x', 'mbh_y']
F = 16

frames = np.stack([Image.open(f"{num:03}.jpg").convert("L") for num in range(F)])
tracks = [dict(zip(TRACKS_RET_FIELDS, track)) for track in densetrack.densetrack(frames, adjust_camera=False, track_length=F - 1)]
```

## For more information see the following links if you want to know Improved trajectories or Dense Trajectories
* [Improved Trajectories](http://lear.inrialpes.fr/~wang/improved_trajectories)
* [densetrack](https://github.com/FXPAL/densetrack)