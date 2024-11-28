#!/usr/bin/python

import argparse

def process_file(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        # skip the first line
        next(infile)
        
        for line in infile:
            # chomp
            name, numbers = line.strip().split('\t')
            
            # split num.
            num_list = list(map(int, numbers.split(',')))
            
            # min, max and delta size
            min_val = min(num_list)
            max_val = max(num_list)
            diff = abs(max_val - min_val)
            
            # output
            outfile.write(f"{name}\t{numbers}\t{min_val}\t{max_val}\t{diff}\n")

def main():
    parser = argparse.ArgumentParser(description="Process a file with names and numbers.")
    parser.add_argument('-i', '--input', required=True, help='Input file name')
    parser.add_argument('-o', '--output', required=True, help='Output file name')
    
    args = parser.parse_args()
    
    process_file(args.input, args.output)

if __name__ == '__main__':
    main()
