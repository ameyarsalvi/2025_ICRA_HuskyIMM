<a href="https://arxiv.org/abs/2409.20554">
  <img src="https://img.shields.io/badge/arXiv-2409.20554-b31b1b.svg" alt="arXiv" />
</a>
<a href="https://www.youtube.com/results?search_query=online+identification+of+skidding+modes">
  <img src="https://img.shields.io/badge/YouTube-Video-red.svg?logo=youtube" alt="YouTube" />
</a>


# Online identification of skidding modes with interactive multiple model estimation

Skid-steered wheel mobile robots (SSWMRs) operate in a variety of outdoor environments exhibiting motion behaviors dominated by the effects of complex wheel-ground interactions. Characterizing these interactions is crucial both from the immediate robot autonomy perspective (for motion prediction and control) as well as a long-term predictive maintenance and diagnostics perspective. An ideal solution entails capturing precise state measurements for decisions and controls, which is considerably difficult, especially in increasingly unstructured outdoor regimes of operations for these robots. In this milieu, a framework to identify pre-determined discrete modes of operation can considerably simplify the motion model identification process. To this end, we propose an interactive multiple model (IMM) based filtering framework to probabilistically identify predefined robot operation modes that could arise due to traversal in different terrains or loss of wheel traction.

![ImmDemoImg](https://github.com/user-attachments/assets/bb4f8898-ef64-46d5-9915-7ceeb6d76664)

## Code Overview

### Model Fitting
GPSFit script provides an oveview for fitting the motion models in the model structure used in the IMM. The code provides an overview of utilizing different GPS paths (positions) and converting them to velocities (trajectories) to adopt the model structure.

The kinematic model of the robot is given by:

$$
\begin{aligned}
\dot{X} &= k_i \cdot \cos(\theta) \cdot u_1, \\
\dot{Y} &= k_i \cdot \sin(\theta) \cdot u_1, \\
\dot{\theta} &= m_i \cdot u_2
\end{aligned}
$$

Where the control inputs are:

$$
\begin{aligned}
u_1 &= \frac{r(\dot{\phi}_L + \dot{\phi}_R)}{2}, \\
u_2 &= \frac{r(-\dot{\phi}_L + \dot{\phi}_R)}{b}
\end{aligned}
$$

GPS trajectories utilized (clothoid curves)

<p float="left">
  <img src="https://github.com/ameyarsalvi/2025_ICRA_HuskyIMM/blob/main/GPSPose.jpg" width="45%" />
  <img src="https://github.com/ameyarsalvi/2025_ICRA_HuskyIMM/blob/main/GPSVel.jpg" width="45%" />
</p>

### IMM

The interactive multiple model estimation based mode identification utilzes the model structure provided above with the key concepts of IMM (Details in the paper).
The EKF_Switch.mlx is the key script that employs the IMM with the models. The methods ekf_predict and ekf_update are supporting methods requried to run the main script. All the necessary test data for recreating and visualizing the results is provided in the repo.
Following are the switich results

<p float="left">
  <img src="https://github.com/ameyarsalvi/2025_ICRA_HuskyIMM/blob/main/States.jpg" width="45%" />
  <img src="https://github.com/ameyarsalvi/2025_ICRA_HuskyIMM/blob/main/Weights.jpg" width="45%" />
</p>

### YouTube video illustration : [YouTube Link](https://www.youtube.com/results?search_query=online+identification+of+skidding+modes)

### Pre-print : [ArXiv Link](https://arxiv.org/abs/2409.20554) 

### Graphical Overview
![GraphicalOverview](https://github.com/user-attachments/assets/fb2dfa35-9513-4d1e-8c25-2a090a0772ba)

### ARMLab Projects : [Clemson ARMLab](https://sites.google.com/view/armlab-cuicar/home)
