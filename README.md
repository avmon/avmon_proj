The project folder is split into small parts so that it can be easily transferred and uploaded into the GitHub (i.e., less than 25MB files). 

To get the project file you need to download the files then extracted s shown below:

![Semantic description of image](/images/1.bmp "")


Then you should have the complete project files as shown below:

![Semantic description of image](/images/2.bmp "")

### <i class="fab fa-gitlab fa-fw" style="color:rgb(252,109,38); font-size:.150em" aria-hidden="true"></i>***AVMon in Carla Simulator***

Installation:
1-	First, download the simple version of CARLA (Carla.zip) from (https://drive.google.com/file/d/1wFMEsE_L1jIvxyGUc071EQIOHIK1rrjt/view?usp=sharing).

2-	Then you can unzip it.  Note: You can use any version of CARLA if you are familiar with it. 

3-	Replace the files form (CarlaSimulator\PythonClient\Course1FinalProject) with the files in (CarlaSimulator\AVmon) in the GitHub project folder.

### <i class="fab fa-gitlab fa-fw" style="color:rgb(252,109,38); font-size:.85em" aria-hidden="true"></i>**Carla parameters**:

The desired speed is computed to be the waypoint speed at the closest waypoint to the vehicle.

![Semantic description of image](/images/3.bmp "")

Using this information for your controller, you will output vehicle throttle, steer, and brake. Details about these outputs in "controller2d.py" are as follows.
Description	Variable Name	Limits

![Semantic description of image](/images/4.bmp "")

You may also treat all measurements from CARLA to be with respect to the center position of the vehicle. If required, the distance between the center position to the front axle of the vehicle is 1.5 meters.


### <i class="fab fa-gitlab fa-fw" style="color:rgb(252,109,38); font-size:.85em" aria-hidden="true"></i>**Execution**:

In one terminal in the CarlaSimulator folder, start the CARLA simulator at a 10hz fixed time-step:

### <i class="fab fa-gitlab fa-fw" style="color:rgb(252,109,38); font-size:.60em" aria-hidden="true"></i>**Windows**:

![Semantic description of image](/images/5.bmp "")

CarlaUE4.exe /Game/Maps/RaceTrack -windowed -carla-server -benchmark -fps=10

In another terminal, change the directory to go into the "Course1FinalProject" folder, under the "PythonClient" folder.
Run your controller, execute the following command while CARLA is open:


### <i class="fab fa-gitlab fa-fw" style="color:rgb(252,109,38); font-size:.60em" aria-hidden="true"></i>**Windows**: (use alternative python commands if the command below does not work, as described in the CARLA install guide):

![Semantic description of image](/images/6.bmp "")

python module.py

***Note1***: our python environment was 3.6.

***Note2***: AVMon.model is our residual module.

The simulator will begin to run if the module client connects to the server properly. It will open two new feedback windows (unless live_plotting is disabled - see the editing of options.cfg below for more details), one of which shows the trajectory and the other which shows the controls feedback. 
The trajectory feedback will contain the car, start and end positions, entire path/path traveled and a small shaded region which denotes the subset of interpolated points to be sent into the controller for control updates. Linear interpolation is used between waypoints to provide a finer resolution path/speed requests for the controller. The X and Y axes are in meters.

The controls feedback shows the throttle, steering and brake outputs, as well as the speed response for the simulation (desired speed and current speed in the single plot). This is a general feedback for viewing what the client is sending to the CARLA server in terms of control commands. The desired speed is set to the closest interpolated speed point to the current position of the car. The speeds are in meters per second and the throttle (0 to 1), brake (0 to 1) and steering (-1 to 1, or left to right turn) are unitless. Note that the steering command output inside controller2d.py is automatically converted from radians (-1.22 to 1.22 rad) to a percentage (-1 to 1) before the command is sent to the CARLA server. The X axis for all four plots in the controls feedback is the in-game time, in seconds.

### <i class="fab fa-gitlab fa-fw" style="color:rgb(252,109,38); font-size:.150em" aria-hidden="true"></i>***Quadcopter***

1- To train the quadcopter, you can use the (Trainning) folder. 
Please note that you may need to use an optimization method to train the quadcopter multiple times as mentioned in the paper (AVMon).

2- To test the quadcopter, you can run the UKF.py file.


### <i class="fab fa-gitlab fa-fw" style="color:rgb(252,109,38); font-size:.150em" aria-hidden="true"></i>***RC CAR***

To be done.
