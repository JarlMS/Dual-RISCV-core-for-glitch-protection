import pandas as pd 
import argparse as arg 
import matplotlib.pyplot as plt
import numpy as np

# dual_core = {
#     "area": 65214.732,
#     "power[uW]": 144.482
#     # "instr_skip": 2790,
#     # "cov_test": 3123
# }

# core = {
#     "area": 63121.093,
#     "power[uW]": 113.007
#     # "insr_skip": 2799,
#     # "cov_test": 3132
# }

dual_core_power = {
    "leakage": 5.90822e-06,
    "internal": 1.96720e-03,
    "switching": 1.29662e-03,
    "total": 3.26973e-03
}

core_power = {
    "leakage": 2.57559e-06,
    "internal": 5.08823e-04,
    "switching": 6.18671e-04,
    "total": 1.13007e-03
}

def plot_power(core, dual_core):
    # Extracting keys and values
    labels = ["Leakage", "Internal", "Switching", "Total"]
    dual_core_values = [dual_core["leakage"], dual_core["internal"], dual_core["switching"], dual_core["total"]]
    core_values = [core["leakage"], core["internal"], core["switching"], core["total"]]

    # Bar width
    bar_width = 0.35

    # Bar positions
    bar_positions = np.arange(len(labels))

    # Creating bar plots
    plt.bar(bar_positions - bar_width / 2, dual_core_values, bar_width, label='CV32E40DC', color='blue')
    plt.bar(bar_positions + bar_width / 2, core_values, bar_width, label='CV32E40S', color='red')

    # Adding labels, title, and legend
    plt.xlabel('Categories')
    plt.ylabel('Power [$W$]')
    plt.title('Power consumption comparison between CV32E40S and CV32E40DC')
    plt.xticks(bar_positions, labels)
    plt.legend()

    plt.yticks(np.arange(0, max(max(core_values), max(dual_core_values)), step=0.0003))

    # Display the plot

    # Display the plot
    plt.show()

def plot_total(core, dual_core):
    # Extracting keys and values
    labels = ["Area", "Power"]
    dual_core_values = [dual_core["area"], dual_core["power[uW]"]]
    core_values = [core["area"], core["power[uW]"]]

    # Bar width
    bar_width = 0.35

    # Bar positions
    bar_positions = np.arange(len(labels))

    # Creating the main axis
    fig, ax1 = plt.subplots()
   
    # Creating bar plots for area on the left y-axis
    ax1.bar(bar_positions, [dual_core["area"], core["area"]], bar_width, label='CV32E40S', color='blue')
    ax1.set_xlabel('Metrics')
    ax1.set_ylabel('Area [pm^2]', color='blue')
    ax1.tick_params(axis='y', labelcolor='blue')

    ax1.set_ylim(60000, ax1.get_ylim()[1])

    ax1.set_yticks(np.arange(ax1.get_yticks()[0], ax1.get_yticks()[-1], step=1000))


    # Creating a twin axis for power on the right y-axis
    ax2 = ax1.twinx()
    ax2.bar(bar_positions + bar_width, [dual_core["power[uW]"], core["power[uW]"]], bar_width, label='CV32E40DC', color='red')
    ax2.set_ylabel('Power [uW]', color='red')
    ax2.tick_params(axis='y', labelcolor='red')

    # Adding labels, title, and legend
    plt.title('Comparison of CV32E40S and CV32E40DC')
    plt.xticks(bar_positions + bar_width/2, labels)

    handles1, labels1 = ax1.get_legend_handles_labels()
    handles2, labels2 = ax2.get_legend_handles_labels()
    handles = handles1 + handles2
    labels = labels1 + labels2
    plt.legend(handles, labels)

    # Display the plot
    plt.show()


if __name__ == "__main__":
    plot_power(core_power, dual_core_power)

