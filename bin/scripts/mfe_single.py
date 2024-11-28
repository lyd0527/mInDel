import os
import threading
import argparse

output_lock = threading.Lock()

def process_fasta_batch(batch, index, db, mfeprimer_threads, output_file):
    input_filename = f'tmp{index}.fa'
    output_filename = f'tmp{index}'
    output_filename2 = f'tmp{index}.spec.tsv'
    
    with open(input_filename, 'w') as tmp_file:
        tmp_file.writelines(batch)
    
    # command
    command = f'mfeprimer-3.3.1-linux-amd64 spec -i {input_filename} -d {db} -c {mfeprimer_threads} -o {output_filename} --tsv'
    os.system(command)
    
    # merge output
    with output_lock:
        with open(output_file, 'a') as out_file:
            with open(output_filename2, 'r') as tmp_out_file:
                out_file.write(tmp_out_file.read())
    
    os.remove(input_filename)
    os.remove(output_filename2)

def process_fasta_file(input_file, output_file, db, mfeprimer_threads, num_threads):
    # output()
    open(output_file, 'w').close()

    with open(input_file, 'r') as file:
        lines = []
        threads_list = []
        batch_count = 0

        for line in file:
            lines.append(line)
            if len(lines) == 4:
                batch_count += 1
                index = (batch_count - 1) % num_threads
                thread = threading.Thread(target=process_fasta_batch, args=(lines[:], index, db, mfeprimer_threads, output_file))
                threads_list.append(thread)
                thread.start()
                lines = []

                # waiting for finishing all threads
                if batch_count % num_threads == 0:
                    for thread in threads_list:
                        thread.join()
                    threads_list = []

        # Next
        if lines:
            batch_count += 1
            index = (batch_count - 1) % num_threads
            thread = threading.Thread(target=process_fasta_batch, args=(lines[:], index, db, mfeprimer_threads, output_file))
            threads_list.append(thread)
            thread.start()

        # waiting for finishing all threads
        for thread in threads_list:
            thread.join()

def main():
    parser = argparse.ArgumentParser(description='Process a FASTA file in batches.')
    parser.add_argument('-i', '--input', required=True, help='Input FASTA file path')
    parser.add_argument('-o', '--output', required=True, help='Output file path')
    parser.add_argument('-d', '--db', required=True, help='Database path for mfeprimer')
    parser.add_argument('-c', '--mfeprimer_threads', type=int, required=True, help='Number of threads for mfeprimer')
    parser.add_argument('-t', '--threads', type=int, default=10, help='Number of threads for processing batches')

    args = parser.parse_args()

    process_fasta_file(args.input, args.output, args.db, args.mfeprimer_threads, args.threads)

if __name__ == '__main__':
    main()
