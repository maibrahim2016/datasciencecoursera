Data Science Capstone (Final Project Submission)
========================================================

<font face="Verdana" color="ROYALBLUE" size="6  " align:"center">
    Muhammed Afifi Ibrahim<br>
    February 15, 2017
</font><br><br>

<font face="Verdana" color="TOMATO" size="6">
    Coursera Data Science Capstone Project
</font><br>
<font face="Verdana" color="white" size="4">
    Source code :[My Github](https://github.com/maibrahim2016/datasciencecoursera/Final_Project_Submission)<br>
    Shiny Apps  :[Prediction Words](https://maibrahim2016.shinyapps.io/Final_Project_Submission/)<br>
    R Pubs      :[Slide Deck](http://rpubs.com/maibrahim2016/Final_Project_Submission)
</font><br><br>


Project Assignment
========================================================

**Instructions**

<p style="text-align:justify">
  <font face="Arial" color="LIMEGREEN" size="5">
    The goal of this exercise is to create a product to highlight the prediction             algorithm that you have built and to provide an interface that can be accessed by        others. For this project you must submit: 
  <br>

  [1] A Shiny app that takes as input a phrase (multiple words) in a text box input and     outputs a prediction of the next word.
  <br>

  [2] A slide deck consisting of no more than 5 slides created with **[R Studio      Presenter](https://support.rstudio.com/hc/en-us/articles/200486468-Authoring-R-Presentat   ions)** pitching your algorithm and app as if you were presenting to your boss or an      investor.
  </font>
  

Algorithm Function - Flowchart
========================================================

**Word Prediction Flowchart**

![Flow](figures/flowchart.png)

<p style="text-align:justify">
  <font face="Arial" color="black" size="5">
    Functionality of the text prediction algorithm:
  </font>
  <br>
    
  <font face="Arial" color="blue" size="5">
    Step 1: Remove punctuation, foreign characters, and profanity.<br>
    Step 2: Search for match, if matches are found, skip to Step 4.<br>
    Step 3: Shorten input, calculate a penalty value, search again.<br>
    Step 4: Calculate score for each match found, sort results.
  </font>
</p>

Algorithm Function - Probability Model
========================================================

**Markov Assumption**

<p style="text-align:justify">
  <font face="Arial" color="brown" size="5">
    The algorithm built for this project is based on the n-grams model with the Markov        assumption. This is due to the speed returning predicted words and memory restrictions     of the shinyApps website. In other words, we seek to find the word (Wn) which             maximizes the conditional probability of (Wn) given its history.
  </font>
</p>

  ![Flow](figures/markovformula.png)</br>


<p style="text-align:justify">
  <font face="Arial" color="brown" size="5">
    If we use the "Stupid Backoff" to find more matches we apply a penalty to the log         probability score.
  </font>
</p>


User Guideline & Conclusion
========================================================

**How to use the application?**

<div>
  <img src="./figures/userinterface.png" width="300" height="250" align="right">

  <p style="display:inline-block">
   <font face="Arial" color="green" size="4">
      [1] Enter the beginning of a sentence in the text area.<br>
      [2] Choose the predicted choices you wish to be display.<br>
      [3] Hit the "Analyze Text" button to display the sentence completion predicted.<br>
    </font>
  </p></div>
<br>
**Conclusions**
<p style="text-align:justify">
  <font face="Arial" color="MEDIUMVIOLETRED" size="4">
    The prediction accuracy of the model evaluated on an out-of-sample validation set is     approximately 20%. This is quite good for a model based only on n-grams, but some        improvements may be possible in the near future.
  </font>
</p>
