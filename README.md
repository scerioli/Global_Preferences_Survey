# Global_Preferences_Survey

## Description

In this repository, we are reproducing the analysis of the article [Relationship of gender differences in preferences to economic development and gender equality](https://science.sciencemag.org/content/362/6412/eaas9899.full) (doi: 10.1126/science.aas9899). It is suggested to have a look at the page [ReproduceArticle.md](https://github.com/scerioli/Global_Preferences_Survey/blob/master/ReproduceArticle.md), which describes step by step what 
has been done, from the data collection (sources of the datasets and the way we cleaned them) to the logic behind the analysis.


## Content

The repository consists of several different sub-directories:

- [**ReproduceArticle.md**](https://github.com/scerioli/Global_Preferences_Survey/blob/master/ReproduceArticle.md), as already mentioned, it helps to get through the main code and get the concept of the analysis. For a more in-depth look at the analysis and the methods, the authors refer to the main paper (mentioned above) and to this file.
- [files](https://github.com/scerioli/Global_Preferences_Survey/tree/master/files)
  - [income](https://github.com/scerioli/Global_Preferences_Survey/tree/master/files/income): files used for the analysis, modified to be easy to read. These files are the ones that should allow the reader to reproduce in the most complete way the analysis. The core GPS dataset on economic preferences is not included due to copyright restrictions, but can be easily downloaded using the links on the official webpage we provided.
  - [outcome](https://github.com/scerioli/Global_Preferences_Survey/tree/master/files/outcome): the csv files that contains the results of our replication of the analysis that we subsequently use for plots. The same files can be obtained by running the analysis pipeline
- [functions](https://github.com/scerioli/Global_Preferences_Survey/tree/master/functions)
  - The replication of pipeline is devided in functions.
  - [helper_functions](https://github.com/scerioli/Global_Preferences_Survey/tree/master/functions/helper_functions): The most repetetive parts of the code were agregated into functions, that we called "helper_functions". They are sourced in the main code with *SourceFunctions.r*.
- [plots](https://github.com/scerioli/Global_Preferences_Survey/tree/master/plots): The relevant plots are saved here. The files that starts with "main" are figures from the main part of the article, while the "supplementary" are from the supplementary online material. Two extra plots for the comparison between our analysis and the article's results are in this folder as well.
- [GenderPreferencesAnalysis.r](https://github.com/scerioli/Global_Preferences_Survey/blob/master/GenderPreferencesAnalysis.r) is the main code of this analysis. It produces the *outcome* files (see above).
- [CreatePlotsArticle.r](https://github.com/scerioli/Global_Preferences_Survey/blob/master/CreatePlotsArticle.r) uses the outcome files to create figures from the main text and supplementary).

## Additional Information

In addition to the article [Global Evidence on Economic Preferences](https://doi.org/10.1093/qje/qjy013), the following two papers contains a lot of relevant information for the full understanding of the analysis steps.
They have to be cited in all publications that make use of or refer in any kind to the GPS dataset:

- Falk, A., Becker, A., Dohmen, T., Enke, B., Huffman, D., & Sunde, U. (2018). [Global evidence on economic preferences.](https://doi.org/10.1093/qje/qjy013) *Quarterly Journal of Economics*, 133 (4), 1645–1692.

- Falk, A., Becker, A., Dohmen, T. J., Huffman, D., & Sunde, U. (2016). The preference survey module: A validated instrument for measuring risk, time, and social preferences. IZA Discussion Paper No. 9674.
