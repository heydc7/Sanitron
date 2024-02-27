# Sanitron
Swift Student Challenge Submission | WWDC 2024

### 🎬 [Watch Preview]() 🎬
![cover](https://github.com/heydc7/Sanitron/assets/39642060/db5991e3-ab70-4ea1-8a79-0e3d5418da75)

My Swift Playground App aims to demonstrate the potential of Machine Learning in identifying various injection attacks that target input fields & implement best practices for validating & sanitizing user input.

Introducing Sanitron! Sanitron is a client-side bot that swiftly detects and prevents injection attacks using Machine Learning. 

Let's get started!

### Feature Extraction
Malicious input may have various characteristics that distinguish it from legitimate input.  

Feature Extraction is done using GoogleColab using Python to effectively classify the user input into various injection attacks.

#### Features:
1. Payload Length
2. Number of Non-Printable Characters
3. Number of Punctuation Characters
4. Number of SQL Keywords
5. Number of JS Keywords
6. Number of OS Command Keywords

### Training PurifyML:
PurifyML is an ML-Model trained in CreateML with a Random Forest Algorithm. 6 features are used as input & label + labelProbability as output. 

### Working: 
1. Navigate to Input Inspector
2. You can type or paste your input in the text field or select it from the Payload Dataset.
3. Click on the "Inspect" button. It will extract all features from the input & use the PurifyML Model to predict the label output & label probability.
4. You can also customize settings to sanitize malicious characters from input.
5. It will show an analysis report from the PurifyML model & the attack type with its probability. Also, it will show sanitized input, if settings are configured.

Hurray! This is how we can simply employ Sanitron in your mobile applications to identify injection attacks. 

### Technology Used:
SwiftUI, CreateML, CoreML, AVKit, Python, GoogleColab

### Resources
1) [Google Colab Notebook](Other/PureML.ipynb)
2) [Payload Dataset](Other/)
3) [Extracted Features](Other/allFeatures.csv)

### Credits:
1. Payload wordlists: GitHub(danielmiessler/SecLists, swisskyrepo/PayloadsAllTheThings)
2. Stats: HackerOne Hacker-Powered Security Report 2023
3. Icons: Freepik.com
4. Sounds: freesound.org

Thank you for checking out my Swift Playground App!!!

## ![Visitor Badge](https://visitor-badge.laobi.icu/badge?page_id=sanitron)
