Description
This project simulates the motion of a pendulum with drag using Heun's method. The provided MATLAB/Octave script calculates the angle and angular velocity of the pendulum over time and plots the results.
Usage
1. **Ensure you have MATLAB or Octave installed on your system.**
2. **Clone this repository to your local machine:**
```bash
git clone https://github.com/yourusername/efolioB-physics.git
```
3. **Navigate to the repository directory:**
```bash
cd efolioB-physics
```
4. **Run the script:**
- Open MATLAB/Octave.
- Navigate to the directory where the script is located.
- Run the script by typing:
```matlab
run('pendulum_simulation.m')
```
Script Details
The script performs the following tasks:
- Initializes variables including air density, aerodynamic coefficient, frontal area, string length, mass, and drag coefficient.
- Sets up the initial conditions for the angle and velocity of the pendulum.
- Uses Heun's method to iteratively calculate the angle and velocity of the pendulum over a period of 100 seconds.
- Prints the results in a table format.
- Plots the angle and velocity of the pendulum over time.
Plot
The script generates a plot with the following features:
- X-axis: Time (seconds)
- Y-axis: Angle (radians) and Angular Velocity (radians/second)
- Two lines: One for the angle and one for the angular velocity
- Grid and legend for better readability
Example Output
The script will display a table of values and a plot similar to the one shown below:
```
 t  angle   velocity    k1x       k1v       k2x       k2v
 0    0.05    0          0       -0.49    -0.049   -0.049
 ...
```

License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


