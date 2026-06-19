Objective: Learn Python basics and perform basic data exploration and cleaning using Pandas.

Steps:
1.Load a CSV dataset into a Pandas DataFrame.
2.Explore data (head/tail, shape, columns, data types).
3.Handle missing values (identify, fill/drop).
4.Perform basic operations (filter rows, select columns).
5.Remove duplicates.
6.Create a derived column (total_amount = price * quantity).
7.Save the cleaned dataset as a new CSV file.

Output: Jupyter Notebook (.ipynb) + cleaned CSV + brief summary.

Resources :
https://www.kaggle.com/datasets/anvitkumar/shopping-dataset


# Shopping Dataset Assignment Guide

## 1. Objective

Perform exploratory data analysis (EDA), data cleaning, and derive meaningful insights from the combined dataset.

---

## 2. Dataset to Use

Use the **`combined_dataset.csv`** file, as it contains all relevant product-level information required for the assignment.

---

## 3. Steps to Follow

### Step 1: Load Data

* Import required libraries: pandas, numpy, matplotlib, seaborn
* Load the dataset
* Check dataset shape and column names

---

### Step 2: Understand Data

* Check data types of all columns
* Identify missing/null values
* Use `.info()` and `.describe()` for summary statistics

---

### Step 3: Data Cleaning

* Convert price-related columns to numeric format
* Handle missing values appropriately (drop/fill)
* Remove duplicate records

---

### Step 4: Feature Engineering

* Create a **price difference column** (initial price vs final price)
* Create a **popularity metric** (using rating and ratings count)
* Extract useful information from complex fields if required

---

### Step 5: Analysis

* Perform **Univariate Analysis** (single variable)
* Perform **Bivariate Analysis** (relationship between variables)
* Conduct **Category-level Analysis** for insights

---

### Step 6: Visualization

* Use appropriate plots:

  * Histograms
  * Bar charts
  * Boxplots
* Ensure visualizations clearly represent trends and patterns

---

### Step 7: Insights

* Write key findings from the analysis
* Explain business implications of the results

---

## 4. GitHub Submission (IMPORTANT)

* Create a new GitHub repository
* Create a folder named: **`shopping-analysis`**
* Add your notebook file (`.ipynb`)
* Add dataset (optional)
* Create a `README.md` explaining your project
* Commit and push the code

---

## Suggested Folder Structure

```
shopping-analysis/
│── data/
│   └── combined_dataset.csv
│── notebook/
│   └── analysis.ipynb
│── README.md
```
