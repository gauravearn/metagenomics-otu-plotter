#!/usr/bin/env bash
# -*- coding:  utf-8 -*-
# Author: Gaurav Sablok
# date: 2023-08-09
# MIT License
echo "i am your shell plotter that uses ruby for the plotting for plotting the metagenomics abundances"
echo "gem install youplot"
echo "you have a series of the abundances or just a single file, if a single abundance then only bar and hist plot is possible"
read -p "enter the filename for the metagenomics abundance:" file_csv
read -p "enter the type of the plot:" plot
read -p "enter the number of the bins:" bin
echo "prepairing the file for the plotting"
if [[ "${plot}" == "bar" ]]; then
    sed "/^OTU/d" ${file_csv} | cut -f 2 | uplot bar -d, -t "bar plot analysis of the metagenomics samples OTUs"
    break
fi
if [[ "${plot}" == "hist" ]]; then
    sed "/^OTU/d" ${file_csv} | cut -f 2 | uplot hist --nbins ${bin} -t "histogram analysis of the metagenomics samples OTUs"
    break
fi
