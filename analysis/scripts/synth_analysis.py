import pandas as pd 
import argparse as arg 
import matplotlib.pyplot as plt
import numpy as np

dual_core = {
    "area": 65214.732,
    "power[uW]": 144.482,
    "cycles": 17446
}

core = {
    "area": 63121.093,
    "power[uW]": 113.007,
    "cycles": 18424
}

def plot_bar(core, dual_core):
    # Extracting keys and values
    labels = list(dual_core.keys())
    dual_core_values = list(dual_core.values())
    core_values = list(core.values())

    # Bar width
    bar_width = 0.35

    # Bar positions
    bar_positions = np.arange(len(labels))

    # Creating bar plots
    plt.bar(bar_positions - bar_width / 2, dual_core_values, bar_width, label='Dual Core')
    plt.bar(bar_positions + bar_width / 2, core_values, bar_width, label='Single Core')

    # Adding labels, title, and legend
    plt.xlabel('Metrics')
    plt.ylabel('Values')
    plt.title('Comparison of Dual Core and Single Core')
    plt.xticks(bar_positions, labels)
    plt.legend()

    # Display the plot
    plt.show()


if __name__ == "__main__":
    plot_bar(core, dual_core)

