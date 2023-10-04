# Bad Graph Redesign Project using R

![R Logo](https://www.r-project.org/logo/Rlogo.png)

Have you ever come across a graph that misrepresents data and fails to convey a clear message, potentially leading to incorrect conclusions? Welcome to the Bad Graph Redesign Project repository, where we tackle this issue using the R programming language.

## Introduction

In the world of data visualization, a graph that misrepresents data is like a compass that points in the wrong direction. Misleading visualizations can have serious consequences, and it's essential to recognize and rectify them. This repository is dedicated to the redesign of a graph that initially failed to convey a clear message, potentially leading to incorrect conclusions.

The dataset at the heart of this project consists of four columns:

- **State**: The names of various U.S. states.
- **2019**: Credit card balances in the year 2019 for each state.
- **2020**: Credit card balances in the year 2020 for each state.
- **Change**: The change in credit card balances from 2019 to 2020 for each state.

## The Design Process

To transform a misleading graph into an informative one, we followed a systematic design process:

1. **Data Assessment**: We began by understanding the dataset, identifying the key variables, and recognizing the shortcomings of the original graph.

2. **MicromapST() Package**: Leveraging the power of the `micromapST()` package in R Studio, we embarked on the redesign journey. This package allows for the creation of micro maps—a versatile method for displaying data.

3. **Sorting and Cumulative Map**: We sorted the micro map by the percentage change in ascending order, ensuring that the most significant changes were prominently displayed.

4. **Dot Plot Representation**: For clear visualization, we represented the percentage change in credit card debt using a dot plot.

5. **Arrow Plot**: The change in debt amount was showcased using an arrow plot, enhancing the understanding of how each state's debt evolved.

6. **Clear Labels**: We added specific, clear labels to each column to ensure that the graph conveyed a precise message.

## Repository Structure

The repository is organized into two main folders:

- **code**: This folder contains the R code that was used for the graph redesign project. You can explore the code to understand the data manipulation and visualization process.

- **data**: Here, you'll find essential project assets:
  - `dataset.csv`: The dataset used for the project.
  - `Project Report.mp4`: An interactive bar plot video showcasing the redesigned graph.
  - `GRP-Presentation.pptx`: A PowerPoint presentation summarizing the project.
  - `Project Report.pdf`: A detailed report highlighting the redesign process and outcomes.

## Getting Started

Feel free to clone this repository to your local machine:

```bash
git clone https://github.com/NikhilJamma/Graph-Redesign-R.git
```

Explore the code to learn about the redesign process and delve into the project assets for a deeper understanding. We hope this project serves as a valuable resource for improving data visualization and understanding the importance of clear and accurate graphs.

## Dependencies

To run the R code in the `code` folder, ensure you have R and R Studio installed. Additionally, make sure you have the necessary packages installed, including `micromapST()`.

---

*Disclaimer: This project aims to demonstrate the importance of effective data visualization and does not intend to misrepresent or manipulate data.*
