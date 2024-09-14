# Estimating π using Monte Carlo Method

We use the fact that the ratio of the area of a quarter circle to the area of the unit square in which it is inscribed can be used to estimate π. To setup the solution, we consider a unit square with corners at (0,0), (1,0), (1,1), and (0,1). The quarter circle of unit radius is centered at (0,0).

## Project Structure

1. `pi_estimate_while_loop.m`: Estimates π using a while loop until the desired precision is achieved.
2. `pi_estimate_for_loop.m`: Estimates π using a for loop with a specified number of points and visualizes the convergence.
3. `monte_carlo_pi_graphical.m`: Estimates π with graphical output, showing points and their classification (inside or outside the unit circle). Generates a GIF of the process.

## Installation

To use these functions, you need to have MATLAB installed on your machine. There are no additional dependencies beyond MATLAB itself.

## Usage

### `pi_estimate_while_loop(precision)`

Estimates π using a while loop until the precision specified is achieved.

**Input:**
- `precision`: A scalar value representing the desired precision (e.g., 1e-6).

**Output:**
- `pi_estimate`: The estimated value of π.
- `iterations`: The number of iterations required to achieve the specified precision.

**Example:**
```matlab
[pi_estimate, iterations] = pi_estimate_while_loop(1e-6);