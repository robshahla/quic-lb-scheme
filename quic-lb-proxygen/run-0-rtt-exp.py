import os
import subprocess


command_to_run = "./run-0-rtt-exp.sh"

def run_experiment(iterations, configuration, processes):
    """
    Run the `command_to_run` command `iterations` times using `processes` processes.
    The processes are run in parallel.
    Configuration is a string that is passed to the command. It can be either
    "0-rtt" or "1-rtt", depending on the experiment to run.
    """

    # create the command to run
    iterations_per_process = iterations // processes
    qlog_dir_name = f"parallel-P{processes}-C{configuration}"
    os.makedirs(qlog_dir_name, exist_ok=True)
    
    command = f"{command_to_run} {configuration} {iterations_per_process} {qlog_dir_name}"
    for process in range(processes):
        # run the command
        print("Running process " + str(process))
        subprocess.Popen(command, shell=True)



def main():
    # number of processes
    iterations = 1000005
    processes = 5
    run_experiment(iterations, "1_rtt", processes)

if __name__ == '__main__':
    main()