# Conclusion

The Authors Tested Most Distinctive Features That Appears In The Datasets
Using, 
High-degree Of Correlation Among Series, Such As Those In Temperature Data.
Mixed Correlation, Such As Those In Greenhouse Gas Data.
Irregularities, Such As Those In Household Power Consumption Or Water Discharge Data.
Blackouts.
Size Of The Dataset, Either In Length Or Number Of Series.

They Suggested A Number Of Research Efforts Such As Time-series Characteristics Discovery, Missing-block Initialization, Automatic Parameterization And Hardware Acceleration, That Could Increase The Number Of Dimensions With Precise Algorithms And/or Allow Selection Of An Algorithm Without First Knowing The Properties Of The Data Series.

During Their Research They Also Achieved Some High-impact Optimization Techniques, That Are Improved Memory Management, Support For Sparse Matrices, Efficient Computation Of Algebraic Operations.


Their Results Show That, In All Cases, No Single Algorithm Delivers High Precision. They Substantiated This Outcome And Other Findings And Provided A Systematic Method For Navigating Algorithm Choices. They Also Discussed Research Issues That Remain Unresolved, Especially In Relation To Achieving More Adaptable And Scalable Algorithms.











# ImputeBench:  Benchmark of Imputation Techniques in Time Series  

ImputeBench implements 13 recovery techniques for blocks of missing values in time series and evaluates their precision and runtime on various real-world time series datasets using different recovery scenarios. Technical details can be found in our 
PVLDB 2020 paper:  <a href = "http://www.vldb.org/pvldb/vol13/p768-khayati.pdf">Mind the Gap: An Experimental Evaluation of Imputation of Missing Values Techniques in Time Series </a>. The benchmark allows to easily integrate new algorithms and datasets. 

- The benchmark implements the following algorithms: [CDRec](https://ieeexplore.ieee.org/document/6816643), [DynaMMo](https://dl.acm.org/doi/10.1145/1557019.1557078), [GROUSE](http://proceedings.mlr.press/v51/zhang16b.html),  [ROSL](https://ieeexplore.ieee.org/abstract/document/6909890), [SoftImpute](https://www.jmlr.org/papers/v11/mazumder10a.html), [SPIRIT](https://dl.acm.org/doi/10.5555/1083592.1083674), [SSA](https://dl.acm.org/doi/10.1145/3287319), [STMVL](https://www.ijcai.org/Proceedings/16/Papers/384.pdf), [SVDImpute](https://academic.oup.com/bioinformatics/article/17/6/520/272365), [SVT](https://epubs.siam.org/doi/10.1137/080738970?mobileUi=0), [TeNMF](http://proceedings.mlr.press/v70/mei17a.html), [TRMF](https://papers.nips.cc/paper/6160-temporal-regularized-matrix-factorization-for-high-dimensional-time-series-prediction.pdf), and [TKCM](https://openproceedings.org/2017/conf/edbt/paper-112.pdf).

- All the datasets used in this benchmark can be found in the folder `Datasets`.
- The full list of recovery scenarios can be found [here](https://raw.githubusercontent.com/eXascaleInfolab/bench-vldb20/master/TestingFramework/bin/Debug/.tech/batch_mid.txt).

[**Prerequisites**](#prerequisites) | [**Build**](#build) | [**Execution**](#execution) | [**Algorithm and Dataset Insertion**](#algorithm-and-dataset-insertion) | [**Citation**](#citation) | [**Award**](#award)

<!---

#### Repository structure
- Algorithms - missing blocks recovery algorithms: CDRec, STMVL, TRMF, TKCM, SPIRIT, TeNMF, GROUSE, SVDImpute, SoftImpute, SVT, ROSL, DynaMMo.
- Datasets - different datasets and time series from different sources.
- Testing Framework - a program to run automated suite of tests on the datasets with the algorithms mentioned above.
 --->
___




## Prerequisites

- Ubuntu 16 or Ubuntu 18 (including Ubuntu derivatives, e.g., Xubuntu) or the same distribution under WSL.
- Clone this repository.
- Mono: Install mono from https://www.mono-project.com/download/stable/ (takes few minutes).

___



## Build

- Build all the Testing Framework using the installation script located in the root folder (takes ~1min):
```bash
    $ sh install_linux.sh
```

___

## Execution


```bash
    $ cd TestingFramework/bin/Debug/
    $ mono TestingFramework.exe [arguments]
```

### Arguments

 | -alg  | -d  |  -scen 
 | -------- | -------- | -------- |
 | cdrec    | airq        | miss_perc |
 | dynammo  | bafu        | ts_length |
 | grouse   | chlorine    | ts_nbr    |
 | rosl     | climate     | miss_disj |
 | softimp  | drift10     | miss_over |
 | svdimp   | electricity | mcar      |
 | svt      | meteo       | blackout  |
 | stmvl    | temp        | *all*     |
 | spirit   | bafu_red    |           |
 | tenmf    | drift10_red |           |
 | tkcm     | *all*       |           |
 | trmf     |             |           |
 | *all*    |             |           |



### Results
All results will be added to `Results` folder. The accuracy results and plots of all algorithms will be sequentially added for each scenario and dataset to: `Results/.../.../error/`. The runtime results and plots of all algorithms will be added to: `Results/.../.../runtime/`. 


### Execution examples

1. Run the whole benchmark (all algorithms, all datasets, all scenarios, precision and runtime)
```bash
    $ mono TestingFramework.exe -alg all -d all -scen all
```
**Warning**: Running the whole benchmark will take a sizeable amount of time (up to 4 days depending on the hardware) and will produce up to 15GB of output files with all recovered data and plots unless stopped early.

2. Run a single algorithm (cdrec) on a single dataset (drift10) using one scenario (missing percentage)
```bash
    $ mono TestingFramework.exe -alg cdrec -d drift10 -scen miss_perc
```

3. Run two algorithms (spirit, cdrec) on a single dataset (drift10) using one scenario (missing percentage)
```bash
    $ mono TestingFramework.exe -alg spirit,cdrec -d drift10 -scen miss_perc
```

4. Run point 3 without runtime results
```bash
    $ mono TestingFramework.exe -alg spirit,cdrec -d drift10 -scen miss_perc -nort
```

5. Additional command-line parameters
```bash
    $ mono TestingFramework.exe --help
```

**Remark**: Algorithms `tkcm`,  `spirit` and `ssa` cannot handle multiple incomplete time series. These two allgorithms will not produce results for scenarios: `miss_disj`, `miss_over`, `mcar` and `blackout`.

### Parametrized execution

- You can parametrize each algorithm using the command `-algx`. For example, you can run
the svdimp algorithm with a reduction value of 4 on the drift dataset and by varying the sequence length as follows:

```bash
    $ mono TestingFramework.exe -algx svdimp 4 -d drift10 -scen ts_nbr
```

- If you want to run some algorithms with default parameters, and some with customized ones, you can use `-alg` and `-algx` together. For example, you can run stmvl algorithm with default parameter and cdrec algorithm with a reduction value of 4 on the airq dataset and by varying the sequence length as follows:

```bash
    $ mono TestingFramework.exe -alg stmvl -algx cdrec 4 -d airq -scen ts_nbr
```

**Remark**: The command `-algx` cannot be executed in group and thus must preceed the name of each algorithm.

___

## Algorithm and Dataset Insertion

- To add your own algorithm to the benchmark, please refer to this [tutorial](https://github.com/eXascaleInfolab/bench-vldb20/tree/master/Algorithms).
- To add your own dataset:
  - import the file to `TestingFramework/bin/Debug/data/{name}/{name}_normal.txt` (`name` is the name of your data).
  - Requirements: rows>= 1'000, columns>= 10, column separator: empty space, row separator: newline
 
___


## Citation
```bibtex
@inproceedings{imputebench2020vldb,
 author    = {Mourad Khayati and Alberto Lerner and Zakhar Tymchenko and Philippe Cudr{\'{e}}{-}Mauroux},
 title     = {Mind the Gap: An Experimental Evaluation of Imputation of Missing Values Techniques in Time Series},
 booktitle = {Proceedings of the VLDB Endowment},
 volume    = {13},
 number    = {5},
 year      = {2020}
}
```

## Award
Imputebench has received the VLDB 2020 Most Reproducible Paper [Award](https://vldb2020.org/vldb-2020-awards.html).

<!---
### Optional commands

 | Argument | Description | Options | Remarks |
 | -------- | -------- | -------- | -------- | 
 | -nort | Doesn't test runtime of the algorithms | n/a | - |
 | -noprec | Doesn't test precision of the algorithms | n/a | - |
 | -novis | Doesn't render plots which show the recovered block | n/a | - |
 | -out [folder] | Redirects results from default folder to a custom one | [folder] : a folder to store the results | Folder will be created is it doesn't exist. Existing files might be overwritten. |
 --->
# bench-vldb20
