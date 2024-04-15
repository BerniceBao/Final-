# Better Talent and Rule Changes Have Resulted in More Goals in the NHL

## Overview

This repository contains data and code used to produce a paper that analyzes goal scoring in the NHL from seasons 2011-12 to 2022-23.

## File Structure

The repo is structured as follows:

-   `input/data` contains the data sources used in analysis including the raw data. The data here is downloaded from https://www.hockey-reference.com/leagues/stats.html and https://www.nhl.com/stats/
-   `outputs/data` contains the cleaned datasets that were constructed.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
-   `outputs/models` contains the multiple linear regression model used in the paper.
-   `scripts` contains the R scripts used to simulate, download, clean, model and test data.