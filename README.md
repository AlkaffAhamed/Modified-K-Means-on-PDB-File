# Modified K-Means on PDB File 
Proteins are commonly analyzed by Biologists for many of their different properties. Structural Analysis is one such type of analysis. In this, Biologists determine the structure of the proteins experimentally. A common file type to store the protein data would be the PDB File. 

**Additional Required Libraries:** 

1. Rpdb

## Objective 

In this project, the sample PDB File will be fed as input to the R Script. Using K-Means Algorithm, the atoms will be grouped into distinct groups known as *clusters*. 

### PDB File Format 

A PDB File carries an extension of ".pdb". 

First several lines will contain the header in which the experiment details will be stored. 

There would be a section where the x, y and z coordinates of each atom would be stored with various other parameters. This is the main data used for this cluster analysis

## Implementation 

The following steps are taken to determine the clusters of atoms: 

1. Read the PDB File and extract the data 
2. Run K-Means for an arbitrary number of clusters (the script uses 5 clusters) and plot it 
3. Plot the modified WSS to determine optimum number of clusters. The optimum number of clusters is determined by the Elbow Curve<br/>or<br/>Plot the BSS/WSS to determine optimum number of clusters. The optimum number of clusters is determined by a sudden Peak 
4. Run K-Means for the selected optimum number of clusters and plot it

### Modification on the WSS function 

The original WSS function has the following formula: 
$$
WSS[i] = \sum{x}
$$
The WSS function is modified because biological data has very close number of optimum clusters. This modified equation at least helps in identifying the "Elbow Curve" more easily. 
$$
WSS[i] = \sqrt[4]{\sum{x^2}}
$$

