import pandas as pd 
import argparse as arg 
import matplotlib.pyplot as plt

class Instr:
    def __init__(self, ins, rd, ra, rb):
        self.ins = ins
        self.rd = rd
        self.ra = ra
        self.rb = rb

def organize_log(log_file):
    # Read log file into pandas dataframe
    df = pd.read_csv(log_file, sep='|', skiprows=[0,2])

    # Organize log file into dictionary
    organized_data = {}

    for col in df.columns:
        organized_data[col.strip()] = df[col].to_list()

    return organized_data

def pc_always_different(organized_list):
    pc_calls = organized_list['PC']
    pc_prev = pc_calls[0]
    for pc in pc_calls[1:]:
        if pc_prev == pc:
            return False
        else: 
            pc_prev = pc
    return True

def num_instruction(organized_list, instr):
    instructions = organized_list['INSTRUCTION']
    num = 0

    for ins in instructions:
        i = ins.split('-')[1]
        if instr in i:
            num += 1
    
    return num
        
def get_instructions(organized_list):
    all_ = organized_list['INSTRUCTION']
    instructions = []
    for ins in all_:
        tmp = ins.split(' - ')[1].split(' ')
        regs = tmp[1].split(',')
        if len(regs) == 3:
            instructions.append(Instr(tmp[0], regs[0], regs[1], regs[2]))
        elif len(regs) == 2:
            instructions.append(Instr(tmp[0], regs[0], regs[1], "--"))
        else:
            instructions.append(Instr(tmp[0], regs[0], "--", "--"))
    return instructions

def plot_instructions(instructions):
    ins_values = [instr.ins for instr in instructions]
    ins_count = pd.Series(ins_values).value_counts()

    df = pd.DataFrame({"Instruction": ins_count.index, "Count": ins_count.values})

    colors = ['salmon' if (ins[0] == 'jalr' or ins[0] == 'jal' or ins[0] == 'beq' or ins[0] == 'bne' or ins[0] == 'blt' or ins[0] == 'bge') else 'skyblue' for ins in df.values]

    # Plot the data using pandas
    ax = df.plot(kind="bar", x="Instruction", y="Count", color=colors, legend=None)
    plt.xlabel("Instruction")
    plt.ylabel("Count")
    plt.title("Instruction Occurrences")
    plt.legend()
    
    legend_labels = {'Jump/Branch instructions': 'salmon', 'Other instructions': 'skyblue'}
    legend_handles = [plt.Rectangle((0,0),1,1, color=col) for col in legend_labels.values()]
    ax.legend(legend_handles, legend_labels.keys(), loc='lower right')
    
    ax.set_yticks(range(0, max(df['Count'])+1, 100))  # Set ticks at even intervals
    ax.yaxis.grid(True, linestyle='--', linewidth=0.5, color='gray')  # Add dashed grid lines

    plt.show()

if __name__ == "__main__":
    parser = arg.ArgumentParser(description="Organize log file columns into a dictionary.")
    parser.add_argument("log_file", help="Path to the log file")

    args = parser.parse_args()

    org_log = organize_log(args.log_file)
    
    plot_instructions(get_instructions(org_log))
