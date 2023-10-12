import os
import sys
import subprocess


command_to_run = "./run-0-rtt-exp.sh"
version = "v2"

def run_experiment(iterations, configuration, processes, qlog_dir_name):
    """
    Run the `command_to_run` command `iterations` times using `processes` processes.
    The processes are run in parallel.
    Configuration is a string that is passed to the command. It can be either
    "0-rtt" or "1-rtt", depending on the experiment to run.
    """

    # create the command to run
    iterations_per_process = iterations // processes
    # qlog_dir_name = f"{version}-parallel-P{processes}-C{configuration}"
    os.makedirs(qlog_dir_name, exist_ok=True)
    process_ids = []
    
    for process in range(processes):
        # run the command
        command = f"{command_to_run} {configuration} {iterations_per_process} {qlog_dir_name} {process}"
        print("Running process " + str(process))
        process_ids.append(subprocess.Popen(command, shell=True))
    
    return process_ids


def main():
    # number of processes
    iterations = 1205000
    # iterations = 10
    # processes = [20, 30]
    configuration = sys.argv[1]  # must be `0_rtt` or `1_rtt`
    processes = int(sys.argv[2])
    qlog_dir_name = sys.argv[3]

    # for configuration in ["0_rtt", "1_rtt"]:
    process_ids = run_experiment(iterations, configuration, processes, qlog_dir_name)
    [p.wait() for p in process_ids]


if __name__ == '__main__':
    main()